Activity Diagrams — Problem Reporting System

Overview

This document describes the initial activity diagrams for the Problem Reporting System proposed by Team Halolmasayel.

The diagrams represent four main processes: problem reporting, report review and assignment, report status tracking, and Admin account management.

The system includes different roles with specific responsibilities, such as Reporter, Coordinator, Technician, and Admin.

These diagrams represent the initial design of the system and may be revised as the team clarifies the requirements and finalizes the system architecture.

---

1. Problem Reporting and Handling

This diagram shows the process from submitting a problem report to reviewing it, assigning it for investigation, and recording the outcome.
```mermaid 
flowchart TD
    A([Start]) --> B[User enters report information]
    B --> C{Is the information valid?}
    C -- No --> D[Show validation errors]
    D --> B
    C -- Yes --> E[Submit the report]
    E --> F[Create problem report]
    F --> G[Set status to SUBMITTED]
    G --> H[SupportAgent reviews the report]
    H --> I{Is the report acceptable?}
    I -- No --> J[Set status to REJECTED]
    J --> K[Record rejection reason]
    I -- Yes --> L[Determine report priority]
    L --> M{Is a FieldAgent needed?}
    M -- Yes --> N[Assign a FieldAgent]
    N --> O[Set status to ASSIGNED]
    O --> P[Record the outcome]
    M -- No --> Q[Keep the report under review]
    Q --> P
    K --> R([End])
    P --> R
```
---

2. Report Review and Assignment

This diagram focuses on the SupportAgent's review of a submitted problem, priority determination, and assignment to a FieldAgent when appropriate.
```mermaid 
flowchart TD
    A([Start]) --> B[SupportAgent reviews the report]
    B --> C{Is the report acceptable?}
    C -- No --> D[Set status to REJECTED]
    D --> E[Record rejection reason]
    E --> J([End])
    C -- Yes --> F[Determine report priority]
    F --> G{Is a FieldAgent needed?}
    G -- Yes --> H[Assign a FieldAgent]
    H --> I[Set status to ASSIGNED]
    I --> K[Record the review result]
    G -- No --> L[Keep the report under review]
    L --> K
    K --> J
```
---

3. Problem Status Tracking

This diagram shows how a user searches for a report and views its current status and priority.
```mermaid 
flowchart TD
    A([Start]) --> B[User searches for a report]
    B --> C{Is the report found?}
    C -- No --> D[Show report not found]
    D --> E([End])
    C -- Yes --> F[Display report status]
    F --> G[Display report priority]
    G --> H{Does the user want to view details?}
    H -- Yes --> I[Display report details]
    H -- No --> E
    I --> E
```
---

4. Admin Account Management

This diagram describes how the Admin manages Staff accounts, including creating, editing, and deactivating Coordinator and Technician accounts.

When creating a Technician account, the Admin must also assign the Technician to a Service Unit.
```mermaid 
flowchart TD
    A([Start]) --> B[Admin opens the management panel]
    B --> C[Selects Staff Account Management]
    C --> D{Choose an action}

    D -- Create --> E[Enter staff information]
    E --> F[Select account role]
    F --> G{Is the role Technician?}
    G -- Yes --> H[Assign a Service Unit]
    G -- No --> I[Validate account information]
    H --> I
    I --> J{Is the information valid?}
    J -- No --> K[Show validation errors]
    K --> E
    J -- Yes --> L[Create staff account]
    L --> M[Show confirmation]

    D -- Edit --> N[Select an existing staff account]
    N --> O[Update account information]
    O --> P[Validate changes]
    P --> Q{Are the changes valid?}
    Q -- No --> R[Show validation errors]
    R --> O
    Q -- Yes --> S[Save account changes]
    S --> M

    D -- Deactivate --> T[Select an existing staff account]
    T --> U{Confirm deactivation?}
    U -- No --> C
    U -- Yes --> V[Deactivate staff account]
    V --> M

    M --> W([End])
```
---

Assumptions and Open Questions

These diagrams represent an initial model and may be revised as the team clarifies the system requirements.

- The Reporter account is created automatically through phone number verification using OTP.
- Coordinator and Technician accounts are created and managed by the Admin. Staff members do not register themselves.
- The Admin assigns a Service Unit when creating a Technician account.
- The Coordinator is responsible for reviewing reports and managing their workflow.
- The Technician is responsible for carrying out assigned technical tasks.
- The Admin manages Staff accounts, roles, permissions, and basic system information.
- The Admin does not directly handle problem reports or perform technical tasks.

The following points still need further discussion and agreement within the team:

- Report rejection criteria and priority assignment rules.
- The complete report status lifecycle and the permissions for changing statuses.
- The exact responsibilities of the Coordinator when a new Location or Category is needed.
- The release in which Admin management features will be implemented.
- The authentication and access control process for the Admin.

The diagrams are intended to remain consistent with the project's requirements, Class Diagram, Data Model, and Architecture documentation. Any changes to roles, responsibilities, statuses, or relationships should be reviewed with the team.
