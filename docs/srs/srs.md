
# Software Requirements Specification (SRS)
## Abadanesh – University Issue Management System

**Version:** 0.1  

---

## 1. Introduction

### 1.1 Project Goal

Abadanesh is a university issue management platform designed to facilitate the reporting, management, and resolution of problems experienced by students and university staff.

The primary goal of the system is to provide an organized channel through which university members can report problems related to university facilities, infrastructure, electrical systems, technical equipment, sanitation, and other campus services.

Rather than merely collecting reports, Abadanesh aims to facilitate the entire problem-resolution process by allowing coordinators to review reports, assign issues to responsible technicians, monitor their progress, and follow up until they are resolved.

The system also allows users to submit suggestions for improving the university environment.

Ultimately, Abadanesh aims to:

- Improve the identification and resolution of university-related problems.
- Facilitate communication between university members and responsible personnel.
- Increase transparency regarding the progress of reported issues.
- Encourage participation in improving the university environment.

### 1.2 Definitions

| Term | Definition |
|---|---|
| **Issue** | A problem or an opportunity for improvement within the university environment that requires attention. |
| **Issue Status** | The current state of an issue within the system's management and resolution process. |
| **Report** | A submission made through the system describing an issue, including relevant information such as its description, category, and location. A report may also contain a suggestion for improvement. |
| **Reporter** | A student or university staff member who submits a report. |
| **Coordinator** | A person responsible for reviewing reports, coordinating the handling of issues, and assigning them to appropriate technicians or departments. |
| **Technician** | A person responsible for handling issues assigned to them and updating their progress and resolution status. |

---

## 2. Scope of the System

### 2.1 In-Scope Features

The system will cover the following activities:

**1. Issue Reporting**

- Students and university staff can submit reports describing problems or suggesting improvements.
- Reports can include relevant information such as a title, description, category, and location.
- Users can attach supporting images to their reports.
- Each submitted report is associated with an issue status.

**2. Issue Management and Resolution**

- Coordinators can review submitted reports.
- Coordinators can categorize and prioritize issues.
- Coordinators can assign issues to responsible technicians or departments.
- Technicians can view issues assigned to them.
- Technicians can update the progress and status of assigned issues.
- The system maintains information about the progress and resolution of issues.

**3. Issue Tracking**

- Users can view the reports they have submitted.
- Users can monitor the status of their reports.
- Users can view relevant updates concerning their reports.

**4. User and Access Management**

- The system supports different user roles, including students, university staff, coordinators, and technicians.
- Access to management operations is restricted according to user roles.

**5. Notifications**

- Users can receive notifications about relevant changes to their submitted reports.
- Technicians can be notified when issues are assigned to them.

### 2.2 Out-of-Scope Features

The following activities are not part of the system's intended responsibilities:

- **Dormitory-related problems:** Reporting and managing issues specifically related to university dormitories.
- **Direct execution of maintenance work:** The system coordinates and tracks issues but does not physically perform repairs or maintenance.
- **Financial management:** Handling budgets, payments, purchases, or financial transactions related to resolving issues.
- **Emergency response services:** Replacing emergency services or providing immediate emergency response.
- **General university administration:** Managing academic activities such as course registration, grading, attendance, and student enrollment.
- **Human resources management:** Managing employee records, recruitment, payroll, or staff administration.
- **External public issue reporting:** Managing problems unrelated to the university environment.

---

## 3. Stakeholders and User Roles

The system is intended for the following user groups:

### 3.1 Students

Students can:

- Submit reports.
- Track their submitted reports.
- Receive updates about their reports.

### 3.2 University Staff

University staff members can:

- Submit reports concerning university facilities and services.
- Track their submitted reports.
- Receive relevant updates.

### 3.3 Coordinators

Coordinators are responsible for managing the issue-handling process. They can:

- Review submitted reports.
- Categorize and prioritize issues.
- Assign issues to technicians or responsible departments.
- Monitor the progress of reported issues.
- Oversee the issue-management workflow.

### 3.4 Technicians

Technicians are responsible for handling assigned issues. They can:

- View issues assigned to them.
- Update the status of assigned issues.
- Provide information about the progress of an issue.
- Record the outcome of completed work.

---

## 4. Functional Requirements

Functional requirements describe the operations and services that the system must provide.

### 4.1 Issue Reporting

| ID | Requirement |
|---|---|
| FR-01 | The system shall allow students and university staff to submit reports. |
| FR-02 | The system shall require a report to contain a description. |
| FR-03 | The system shall allow users to provide relevant information about an issue, including its category and location. |
| FR-04 | The system shall allow users to attach images to reports. |
| FR-05 | The system shall associate each submitted report with an initial issue status. |
| FR-06 | The system shall provide confirmation when a report is successfully submitted. |

### 4.2 Issue Management

| ID | Requirement |
|---|---|
| FR-07 | The system shall allow coordinators to view submitted reports. |
| FR-08 | The system shall allow coordinators to categorize reported issues. |
| FR-09 | The system shall allow coordinators to assign priorities to issues. |
| FR-10 | The system shall allow coordinators to assign issues to responsible technicians or departments. |
| FR-11 | The system shall allow technicians to view issues assigned to them. |
| FR-12 | The system shall allow authorized personnel to update the status of assigned issues. |
| FR-13 | The system shall allow technicians to provide progress updates on assigned issues. |
| FR-14 | The system shall maintain the status and relevant progress information of each issue. |
| FR-15 | The system shall allow authorized personnel to mark an issue as resolved. |

### 4.3 Issue Tracking

| ID | Requirement |
|---|---|
| FR-16 | The system shall allow users to view the reports they have submitted. |
| FR-17 | The system shall allow users to view the current status of their reported issues. |
| FR-18 | The system shall allow users to view relevant progress updates concerning their reports. |

### 4.4 User and Access Management

| ID | Requirement |
|---|---|
| FR-19 | The system shall support different user roles with different permissions. |
| FR-20 | The system shall restrict administrative and coordination operations to authorized users. |
| FR-21 | The system shall restrict technicians to managing issues assigned to them or their department, according to their permissions. |

### 4.5 Notifications

| ID | Requirement |
|---|---|
| FR-22 | The system shall notify users when the status of their reported issues changes. |
| FR-23 | The system shall notify technicians when an issue is assigned to them. |

---

## 5. Non-Functional Requirements

Non-functional requirements define the quality attributes and operational expectations of the system.

### 5.1 Security

- **NFR-01:** The system shall require users to authenticate before accessing features that require an account.
- **NFR-02:** The system shall enforce role-based access control.
- **NFR-03:** The system shall prevent unauthorized users from accessing or modifying restricted reports and system resources.
- **NFR-04:** Sensitive user information shall be protected against unauthorized access.

### 5.2 Usability

- **NFR-05:** The system shall provide an understandable and user-friendly interface.
- **NFR-06:** The issue-reporting process shall be straightforward and require only the information necessary to describe an issue.
- **NFR-07:** The system shall provide clear feedback when users perform operations, including successful submissions and validation errors.

### 5.3 Performance

- **NFR-08:** The system shall respond to ordinary user interactions within an acceptable time under normal operating conditions. The maximum response time is **TBD**.
- **NFR-09:** The system shall support multiple users accessing the platform concurrently. The expected number of concurrent users is **TBD**.

### 5.4 Reliability and Availability

- **NFR-10:** The system shall preserve submitted reports and their associated information.
- **NFR-11:** The system shall prevent failed operations from leaving inconsistent issue records.
- **NFR-12:** The system shall be available during the university's intended operating periods. The required availability level is **TBD**.

### 5.5 Maintainability

- **NFR-13:** The system shall be designed in a modular manner to facilitate future modifications and extensions.
- **NFR-14:** The system's source code and documentation shall be organized to support maintenance and further development.

---

## 6. Constraints

The development and operation of Abadanesh are subject to the following constraints:

1. **University environment:** The system is intended to address problems and suggestions related to the university environment and its services.

2. **User eligibility:** Only students and university staff are intended to submit reports through the platform.

3. **Role-based permissions:** Coordination and issue-management operations must be restricted to authorized personnel.

4. **Department dependency:** The resolution of an issue depends on the availability and actions of the responsible technicians or university departments. The system can coordinate and track the process but cannot guarantee that every issue will be resolved.

5. **Technical constraints:** The implementation must comply with the technical limitations and resources available to the development team. Specific technologies and deployment requirements are TBD.

6. **Project constraints:** The initial implementation must remain within the time, personnel, and resource limitations of the project.

---

## 7. Open Questions

The following points require further discussion and confirmation before the requirements can be considered final:

1. Will users authenticate using university accounts, or will the system provide its own registration process?
2. Can users submit reports anonymously?
3. Can users view reports submitted by other users, or only their own?
4. Can users comment on or discuss reports?
5. Can multiple users report the same issue, and should duplicate reports be linked?
6. What exact statuses should an issue have throughout its lifecycle?
7. Can users reopen an issue if they believe it has not actually been resolved?
8. Should users be able to provide feedback on resolved issues?
9. What notification channels will be supported?
10. Who is responsible for creating and managing university departments and their technicians?
11. Should coordinators and technicians be assigned to specific departments?
12. Can a single issue be assigned to multiple technicians?
13. Should suggestions follow the same workflow as ordinary issue reports, or require additional handling?



