# Abadanesh: System Architecture

## 1. Overview

Abadanesh uses a **layered architecture** to organize the
responsibilities of the system. The backend is divided into three
logical layers:

1.  **Presentation Layer** --- receives requests from the frontend and
    returns responses.
2.  **Business Logic Layer** --- implements application operations and
    enforces the rules governing them.
3.  **Data Access Layer** --- provides an interface for storing and
    retrieving application data.

Each layer provides a well-defined interface to the layer above it. A
layer uses the services of the layer immediately below it without
needing to know the internal implementation details of that layer.

The overall dependency direction is:

``` text
                 Frontend
                    |
                    | HTTP requests / responses
                    v
           +--------------------+
           | Presentation Layer |
           |    Controllers     |
           +--------------------+
                    |
                    | Service method calls
                    v
           +--------------------+
           | Business Logic     |
           |      Layer         |
           |     Services       |
           +--------------------+
                    |
                    | Repository method calls
                    v
           +--------------------+
           |   Data Access      |
           |      Layer         |
           |    Repositories    |
           +--------------------+
                    |
                    | Database operations
                    v
                 Database
```

The frontend is a separate application that communicates with the
backend through HTTP. It is not one of the backend's three layers, but
it is the client of the interface exposed by the Presentation Layer.

The entities used by the system, such as `Issue`, `Account`, and
`Location`, represent the information being processed. They are shared
data structures used across the layers, rather than a separate
architectural layer.

## 2. Presentation Layer

### Responsibility

The Presentation Layer is the entry point to the backend. It receives
requests from the frontend, interprets them, invokes the appropriate
operation in the Business Logic Layer, and sends the result back to the
frontend.

For example, when a coordinator wants to change the status of an issue,
the frontend sends an HTTP request to the backend. The Presentation
Layer receives that request and passes the relevant information to the
appropriate service.

This layer is responsible for communication with the frontend, not for
deciding how the application should behave.

### What Is a Controller?

A **controller** is a backend component that handles incoming HTTP
requests.

It acts as an intermediary between the frontend and the Business Logic
Layer. A controller:

-   Receives an HTTP request from the frontend.
-   Extracts the relevant information from the request.
-   Calls the appropriate service operation.
-   Converts the result into an HTTP response.
-   Returns the response to the frontend.

A controller should not implement business rules. For example, it should
not decide whether a coordinator is allowed to change an issue's status.
It should delegate that decision to the appropriate service.

In Abadanesh, controllers are grouped according to the part of the
application they handle:

-   `IssueController` handles requests related to issues.
-   `AuthController` handles authentication requests.

### Interface Exposed by the Presentation Layer

The Presentation Layer exposes **HTTP endpoints** to the frontend.

These endpoints define which operations the frontend can request, what
information it must provide, and what responses it can receive.

For example, the `IssueController` exposes operations corresponding to:

  ------------------------------------------------------------------------
  Operation                            Purpose
  ------------------------------------ -----------------------------------
  `submitIssue(data)`                  Submit a new issue

  `getMyIssues()`                      Retrieve the authenticated
                                       reporter's issues

  `getIssue(issueId)`                  Retrieve an issue's details

  `listIssues(filter)`                 Retrieve issues matching a filter

  `updateStatus(issueId, status)`      Change an issue's status

  `setPriority(issueId, priority)`     Change an issue's priority

  `setLocation(issueId, locationId)`   Assign a structured location

  `addComment(issueId, text)`          Add a comment to an issue

  `confirmResolution(issueId)`         Confirm that an issue has been
                                       resolved
  ------------------------------------------------------------------------

These are conceptual operation names. Their actual HTTP methods and URL
paths will be defined when the API is designed.

The frontend does not call services or repositories directly. It
communicates with the backend through this HTTP interface.

## 3. Business Logic Layer

### Responsibility

The Business Logic Layer contains the operations that make Abadanesh
function as an issue management system.

It determines what should happen when an operation is requested and
ensures that the application's rules are respected.

For example, when a coordinator attempts to change an issue's status,
the Business Logic Layer checks whether the coordinator is authorized to
perform the operation and whether the requested status transition is
valid.

This layer coordinates the work required to complete an operation. It
may:

-   Validate the information supplied by the user.
-   Check permissions and business rules.
-   Retrieve existing entities from the Data Access Layer.
-   Create or modify entities.
-   Save changes through the Data Access Layer.
-   Return the result of the operation.

### What Is a Service?

A **service** is a backend component that implements an application
operation.

An application operation is something the system allows an actor to do,
such as submitting an issue, changing its status, or confirming its
resolution.

A service receives the information needed to perform an operation,
applies the relevant rules, and coordinates the necessary work.

For example, `IssueService.createIssue()` is responsible for creating a
new issue. It validates the submitted information, constructs an `Issue`
entity, assigns its initial status, and asks the appropriate repository
to save it.

A service is not responsible for handling HTTP requests or communicating
with the frontend. It is also not responsible for directly executing
database queries. Those responsibilities belong to other layers.

In Abadanesh, services are grouped according to application
functionality:

-   `IssueService` implements operations related to issue management.
-   `AuthService` implements authentication operations.

### Interface Exposed by the Business Logic Layer

The Business Logic Layer exposes **service methods** to the Presentation
Layer.

These methods represent the operations the application supports. The
Presentation Layer does not need to know how an operation is
implemented; it only needs to know which method to call and what
information to provide.

For example, `IssueService` exposes the following operations:

  ---------------------------------------------------------------------------------------
  Method                                              Purpose
  --------------------------------------------------- -----------------------------------
  `createIssue(reporterId, data)`                     Validate and create an issue

  `getIssuesOfReporter(reporterId)`                   Retrieve issues belonging to a
                                                      reporter

  `getIssue(issueId, accountId)`                      Retrieve an issue after checking
                                                      access

  `listIssues(filter)`                                Retrieve issues matching a filter

  `changeStatus(issueId, coordinatorId, newStatus)`   Validate and change issue status

  `setPriority(issueId, coordinatorId, priority)`     Change issue priority

  `setLocation(issueId, coordinatorId, locationId)`   Assign a structured location

  `addComment(issueId, accountId, text)`              Add a comment

  `confirmResolution(issueId, reporterId)`            Confirm issue resolution
  ---------------------------------------------------------------------------------------

Similarly, `AuthService` exposes operations such as:

-   `sendOneTimeCode(phoneNumber)`
-   `verifyOneTimeCode(phoneNumber, code)`
-   `verifyPassword(username, password)`

The services are the interface through which the Presentation Layer
accesses application functionality.

### Entities and Business Rules

In the current design, entities such as `Issue`, `Account`, and
`Location` primarily represent application data. They do not contain the
application operations themselves.

The business rules are implemented in service classes. This is commonly
called an **Anemic Domain Model**: entities hold data, while services
contain the operations and rules that act on that data.

This is a deliberate organizational choice for the current design. It
keeps the entities simple and makes the services responsible for
coordinating application behavior.

## 4. Data Access Layer

### Responsibility

The Data Access Layer is responsible for communicating with the
database.

The Business Logic Layer needs to retrieve and store information, but it
should not need to know how that information is stored. The Data Access
Layer hides those details behind a set of well-defined operations.

For example, when `IssueService` needs to retrieve an issue, it does not
construct an SQL query. It asks `IssueRepository` to find the issue by
its identifier.

The Data Access Layer handles the actual database interaction.

### What Is a Repository?

A **repository** is a component that provides an interface for
retrieving and storing application data.

It acts as an intermediary between the Business Logic Layer and the
database. It provides operations such as:

-   Saving an entity.
-   Finding an entity by its identifier.
-   Finding entities that satisfy certain criteria.
-   Retrieving collections of entities.

A repository knows how to retrieve and persist data, but it does not
decide whether an application operation is allowed.

For example, `IssueRepository` knows how to save an issue to the
database. It does not decide whether a coordinator is allowed to change
that issue's status. That decision belongs to `IssueService`.

Repositories are grouped according to the data they manage:

-   `IssueRepository` handles issue data.
-   `AccountRepository` handles account data.
-   `LocationRepository` handles location data.

### Interface Exposed by the Data Access Layer

The Data Access Layer exposes **repository methods** to the Business
Logic Layer.

For example, `IssueRepository` exposes:

  -----------------------------------------------------------------------
  Method                              Purpose
  ----------------------------------- -----------------------------------
  `save(issue)`                       Store a new or modified issue

  `findById(id)`                      Retrieve an issue by its identifier

  `findByReporter(reporterId)`        Retrieve issues belonging to a
                                      reporter

  `findAll(filter)`                   Retrieve issues matching a filter
  -----------------------------------------------------------------------

`AccountRepository` exposes:

-   `findByPhone(phoneNumber)`
-   `findByEmployeeNumber(employeeNumber)`
-   `save(account)`

`LocationRepository` exposes:

-   `findAll()`
-   `findById(id)`

The services use these methods without needing to know whether the data
is stored in PostgreSQL, another relational database, or some other
persistence system.

The repository interface hides the implementation details of data
storage.

## 5. How the Layers Work Together

The three layers provide different interfaces to the layer above them:

  Layer            Interface it exposes   Used by
  ---------------- ---------------------- ----------------------
  Data Access      Repository methods     Business Logic Layer
  Business Logic   Service methods        Presentation Layer
  Presentation     HTTP endpoints         Frontend

Consider the operation of retrieving an issue:

1.  The frontend sends an HTTP request to retrieve an issue.
2.  The controller receives the request and extracts the issue
    identifier.
3.  The controller calls `IssueService.getIssue()`.
4.  The service checks whether the requesting account is allowed to
    access the issue.
5.  The service calls `IssueRepository.findById()`.
6.  The repository retrieves the issue from the database and returns it.
7.  The service returns the result to the controller.
8.  The controller converts the result into an HTTP response and sends
    it to the frontend.

Each layer performs its own responsibility and communicates with the
next layer through its exposed interface.

### Dependency Rules

The architecture follows these rules:

1.  The frontend communicates with the backend through HTTP endpoints
    exposed by the Presentation Layer.
2.  Controllers call services; they do not call repositories directly.
3.  Services call repositories to retrieve and store data; they do not
    communicate with the frontend or execute database queries directly.
4.  Repositories communicate with the database; they do not implement
    application business rules.
5.  Entities represent application data and can be used by multiple
    layers.

These rules prevent the responsibilities of different layers from
becoming mixed together.

For example, if a controller directly executed SQL queries, it would be
responsible for both handling HTTP requests and accessing the database.
This would make the controller harder to maintain and would bypass the
Data Access Layer.

Likewise, if a repository decided whether an issue could be marked as
resolved, it would mix application rules with database access.

Keeping these responsibilities separate makes the system easier to
understand, test, and modify.

## 6. Example: Tracing a User Story Through the Architecture

Consider the following user story:

**As a reporter, I want to submit an issue so that the university can
review and resolve it.**

The reporter fills in the issue submission form with a title,
description, category, location information, and optional attachments.

The following describes how this operation is processed by the
architecture.

### Step 1: The Frontend Sends a Request

The reporter fills in the submission form and presses the submit button.

The frontend sends an HTTP request to the backend containing the
submitted information.

The request is sent to the endpoint exposed by `IssueController`.

### Step 2: The Controller Receives the Request

`IssueController` receives the HTTP request.

It extracts the submitted information and identifies the authenticated
reporter.

It then calls:

``` text
IssueService.createIssue(reporterId, data)
```

The controller does not decide whether the submitted issue is valid. Its
responsibility is to receive the request and pass the information to the
appropriate service.

### Step 3: The Service Validates and Creates the Issue

`IssueService.createIssue()` receives the reporter's identifier and the
submitted issue data.

It performs the necessary checks, such as:

-   The title must not be empty.
-   Required information must be present.
-   The submitted category must be valid.
-   The reporter must be allowed to submit an issue.

If the information is invalid, the service returns an appropriate error
without saving the issue.

If the information is valid, the service creates an `Issue` entity.

It assigns the initial status, `New`, and populates the entity with the
submitted information.

### Step 4: The Service Asks the Repository to Save the Issue

The service calls:

``` text
IssueRepository.save(issue)
```

The repository is responsible for storing the issue and its associated
attachments in the database.

The service does not need to know how the repository performs this
operation.

### Step 5: The Repository Stores the Data

`IssueRepository.save()` performs the necessary database operations.

It stores the issue and its associated attachments, ensuring that the
related data is persisted consistently.

After the operation succeeds, the repository returns the saved issue
(including any generated identifiers) to the service.

### Step 6: The Result Returns Through the Layers

The saved issue is returned to `IssueService.createIssue()`.

The service returns the result to `IssueController`.

The controller converts the result into an HTTP response and sends it to
the frontend.

The frontend can then display a success message to the reporter.

### Complete Interaction

The complete flow can be represented as:

``` text
Reporter
   |
   | Fills in form and submits
   v
Frontend
   |
   | HTTP request
   v
IssueController
   |
   | createIssue(reporterId, data)
   v
IssueService
   |
   | Validate submitted information
   | Create Issue entity
   |
   | save(issue)
   v
IssueRepository
   |
   | Store issue and attachments
   v
Database
   |
   | Saved issue
   v
IssueRepository
   |
   | Returns saved issue
   v
IssueService
   |
   | Returns result
   v
IssueController
   |
   | HTTP response
   v
Frontend
   |
   | Displays success message
   v
Reporter
```

### What Happens if Validation Fails?

Suppose the reporter submits the form without providing a title.

The flow stops inside `IssueService.createIssue()` when the service
detects that the title is empty.

The service returns a validation error to the controller. The controller
converts that error into an appropriate HTTP response, and the frontend
displays the error to the reporter.

In this case, `IssueRepository.save()` is never called, so no issue is
stored in the database.

This demonstrates an important property of the architecture: validation
and business rules are enforced in the Business Logic Layer, regardless
of which frontend or interface initiated the operation.

## 7. Summary

Abadanesh uses a three-layer architecture in which each layer has a
distinct responsibility and exposes a clear interface to the layer above
it.

-   **Presentation Layer:** Controllers receive HTTP requests from the
    frontend and return HTTP responses. They expose the backend's HTTP
    API.
-   **Business Logic Layer:** Services implement application operations,
    enforce business rules, and coordinate the work needed to complete
    those operations. They expose service methods to controllers.
-   **Data Access Layer:** Repositories retrieve and store application
    data. They expose repository methods to services.

The separation means that each layer can be modified without requiring
unnecessary changes to the others. For example, the database
implementation can change without requiring changes to the services, and
the frontend can be replaced without changing the application's business
rules.

The architecture therefore provides a clear organization for the system
while keeping communication between its components explicit and
controlled.

## 8. Important Implementation Consideration: Authenticated Identity

Identifiers such as `reporterId` and `coordinatorId` must come from the
authenticated user's identity, not from an ID that the frontend is free
to submit.

The controller obtains the identity from the authentication context (for
example, a validated session or token) and passes it to the service.

This prevents a user from pretending to be another account by changing
an identifier in an HTTP request.

