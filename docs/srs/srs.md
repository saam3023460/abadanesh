
# Software Requirements Specification (SRS)
# Abadanesh – University Issue Management System

**Version:** 0.2  

---

## 1. Introduction

### 1.1 Project Goal

Abadanesh is a university issue management platform designed to facilitate the reporting, management, and resolution of problems experienced by students and university staff.

The system provides an organized channel for reporting problems related to university facilities, infrastructure, electrical systems, technical equipment, sanitation, and other campus services.

It facilitates problem resolution by allowing coordinators to review reports, assign issues to responsible technicians or service units, monitor progress, and follow up until resolution.

The system also allows users to submit suggestions for improving the university environment.

The main goals of Abadanesh are:

- Improve the identification and resolution of university-related problems.
- Facilitate communication between university members and responsible personnel.
- Increase transparency regarding the progress of reported issues.
- Encourage participation in improving the university environment.
- Provide an organized system for managing users, service units, and administrative responsibilities.

### 1.2 Definitions

| Term | Definition |
|---|---|
| Issue | A problem or an opportunity for improvement within the university environment that requires attention. |
| Issue Status | The current state of an issue within the system's management and resolution process. |
| Report | A submission made through the system describing an issue, including relevant information such as its description, category, and location. A report may also contain a suggestion for improvement. |
| Reporter | A student or university staff member who submits a report. |
| Coordinator | A person responsible for reviewing reports, coordinating the handling of issues, and assigning them to appropriate technicians or service units. |
| Technician | A person responsible for handling issues assigned to them and updating their progress and resolution status. |
| System Administrator | A person responsible for managing user accounts, assigning roles, managing service units, and maintaining administrative configurations required for the operation of the system. |
| Service Unit | An organizational unit within the university responsible for handling particular types of issues or services. |

---

## 2. Scope of the System

### 2.1 In-Scope Features

The system includes the following features:

**1. Issue Reporting**

- Students and university staff can submit reports describing problems or suggesting improvements.
- Reports can contain a title, description, category, and location.
- Users can attach images to support their reports.
- Each submitted report is associated with an initial issue status.

**2. Issue Management and Resolution**

- Coordinators can review submitted reports.
- Coordinators can categorize and prioritize issues.
- Coordinators can assign issues to responsible technicians or service units.
- Technicians can view issues assigned to them.
- Technicians can update the status of assigned issues.
- Technicians can provide progress updates.
- The system maintains issue status and relevant progress information.

**3. Issue Tracking**

- Users can view reports they have submitted.
- Users can monitor the status of their reported issues.
- Users can view relevant progress updates concerning their reports.

**4. User and Access Management**

- The system supports different user roles, including students, university staff, coordinators, technicians, and system administrators.
- Access to system features and operations is restricted according to user roles.
- Administrative and coordination operations are limited to authorized users.

**5. Notifications**

- Users receive notifications when the status of their reported issues changes.
- Technicians receive notifications when issues are assigned to them.

**6. System Administration**

- System administrators can view and manage user accounts.
- System administrators can assign roles to users.
- System administrators can activate and deactivate user accounts.
- System administrators can create, modify, and remove service units.
- System administrators can associate technicians and coordinators with service units.
- System administrators can maintain administrative configurations required by the system.

### 2.2 Out-of-Scope Features

The following features are not included in the current scope:

- **Dormitory-related problems:** Reporting and management of issues concerning university dormitories.
- **Physical maintenance and repairs:** The system coordinates and tracks maintenance activities but does not perform physical repairs itself(i.e technicians are not an asset of the system).
- **Financial management:** Managing budgets, payments, purchases, and financial transactions.
- **Emergency response services:** Handling emergencies that require immediate intervention from emergency services.
- **General university administration:** Course registration, grading, attendance, enrollment, and similar academic administrative activities.
- **Human resource management:** Managing employee recruitment, payroll, and other HR activities.
- **External public issue reporting:** Reporting problems unrelated to the university environment.

---

## 3. Stakeholders and User Roles

### 3.1 Students

Students are primary users of the system. They can:

- Submit reports concerning university facilities and services.
- Attach images to their reports.
- Track their submitted reports.
- View issue statuses and relevant progress updates.
- Receive notifications about changes to their reports.

### 3.2 University Staff

University staff members can:

- Submit reports concerning university facilities, infrastructure, and services.
- Attach images to their reports.
- Track their submitted reports.
- View issue statuses and relevant progress updates.
- Receive notifications about changes to their reports.

### 3.3 Coordinators

Coordinators are responsible for organizing and overseeing the issue-resolution process. They can:

- Review submitted reports.
- Categorize reported issues.
- Assign priorities to issues.
- Assign issues to responsible technicians or service units.
- Monitor issue statuses and progress.
- Oversee the resolution process.

### 3.4 Technicians

Technicians are responsible for handling issues assigned to them. They can:

- View issues assigned to them or their service units, according to their permissions.
- Access relevant issue information.
- Update issue statuses.
- Provide progress updates.
- Record the outcome of completed work.

### 3.5 System Administrators

System administrators are responsible for maintaining the administrative aspects of Abadanesh. They can:

- View and manage user accounts.
- Assign roles to users.
- Activate and deactivate user accounts.
- Create, modify, and remove service units.
- Associate technicians and coordinators with service units.
- Maintain administrative configurations.
- Oversee administrative access and permissions.

---

## 4. Functional Requirements

### 4.1 Issue Reporting

| ID | Functional Requirement |
|---|---|
| FR-01 | The system shall allow students and university staff to submit reports. |
| FR-02 | Each report shall contain a description of the reported issue. |
| FR-03 | The system shall allow users to provide relevant information about an issue, including its category and location. |
| FR-04 | The system shall allow users to attach images to their reports. |
| FR-05 | The system shall associate each submitted report with an initial issue status. |
| FR-06 | The system shall provide confirmation after a report has been successfully submitted. |

### 4.2 Issue Management and Resolution

| ID | Functional Requirement |
|---|---|
| FR-07 | The system shall allow coordinators to view submitted reports. |
| FR-08 | The system shall allow coordinators to categorize reported issues. |
| FR-09 | The system shall allow coordinators to assign priorities to issues. |
| FR-10 | The system shall allow coordinators to assign issues to responsible technicians or service units. |
| FR-11 | The system shall allow technicians to view issues assigned to them. |
| FR-12 | The system shall allow authorized personnel to update the status of assigned issues. |
| FR-13 | The system shall allow technicians to provide progress updates for assigned issues. |
| FR-14 | The system shall maintain the status and relevant progress information of issues. |
| FR-15 | The system shall allow authorized personnel to mark issues as resolved. |

### 4.3 Issue Tracking

| ID | Functional Requirement |
|---|---|
| FR-16 | The system shall allow users to view reports they have submitted. |
| FR-17 | The system shall allow users to view the current status of their reported issues. |
| FR-18 | The system shall allow users to view relevant progress updates concerning their reported issues. |

### 4.4 User and Access Management

| ID | Functional Requirement |
|---|---|
| FR-19 | The system shall support different user roles with different permissions. |
| FR-20 | The system shall restrict administrative and coordination operations to authorized users. |
| FR-21 | The system shall restrict technicians to managing issues assigned to them or their service units, according to their permissions. |

### 4.5 Notifications

| ID | Functional Requirement |
|---|---|
| FR-22 | The system shall notify users when the status of their reported issues changes. |
| FR-23 | The system shall notify technicians when issues are assigned to them. |

### 4.6 System Administration

| ID | Functional Requirement |
|---|---|
| FR-24 | The system shall allow authorized system administrators to view and manage user accounts. |
| FR-25 | The system shall allow system administrators to assign roles to users. |
| FR-26 | The system shall allow system administrators to activate and deactivate user accounts. |
| FR-27 | The system shall allow system administrators to create, modify, and remove service units. |
| FR-28 | The system shall allow system administrators to associate technicians and coordinators with service units. |
| FR-29 | The system shall restrict system-wide administrative operations to authorized system administrators. |

---

## 5. Non-Functional Requirements

### 5.1 Security

| ID | Non-Functional Requirement |
|---|---|
| NFR-01 | The system shall require authentication before allowing access to features that require a user account. |
| NFR-02 | The system shall enforce role-based access control. |
| NFR-03 | The system shall prevent unauthorized users from accessing or modifying restricted reports and system resources. |
| NFR-04 | The system shall protect sensitive user information against unauthorized access. |
| NFR-15 | Administrative operations shall be restricted to authenticated users with appropriate administrative permissions. |
| NFR-16 | The system shall maintain records of important administrative operations, including changes to user roles and account status. |

### 5.2 Usability

| ID | Non-Functional Requirement |
|---|---|
| NFR-05 | The system shall provide an understandable and user-friendly interface. |
| NFR-06 | The report submission process shall be straightforward and require only necessary information. |
| NFR-07 | The system shall provide clear feedback to users, including confirmation messages and validation errors. |

### 5.3 Performance

| ID | Non-Functional Requirement |
|---|---|
| NFR-08 | The system shall respond to ordinary user interactions within an acceptable time under normal operating conditions. The maximum response time is TBD. |
| NFR-09 | The system shall support multiple concurrent users. The expected number of concurrent users is TBD. |

### 5.4 Reliability and Availability

| ID | Non-Functional Requirement |
|---|---|
| NFR-10 | The system shall preserve submitted reports and their associated information. |
| NFR-11 | The system shall prevent failed operations from leaving issue records in an inconsistent state. |
| NFR-12 | The system shall be available during its intended university operating periods. The required availability level is TBD. |

### 5.5 Maintainability

| ID | Non-Functional Requirement |
|---|---|
| NFR-13 | The system shall have a modular design to facilitate modifications and future extensions. |
| NFR-14 | The source code and documentation shall be organized to support maintenance and further development. |

---

## 6. Constraints

1. **University Environment:** The system is intended to address problems and improvement suggestions related to the university environment.

2. **User Eligibility:** Only students and university staff are intended to submit reports.

3. **Role-Based Permissions:** Coordination, issue management, and administrative operations shall be restricted to authorized personnel according to their assigned roles.

4. **Service Unit Dependency:** Issue resolution depends on the availability and actions of responsible technicians and service units. The system coordinates and tracks the process but cannot guarantee that reported issues will be resolved.

5. **Administrative Access:** Only designated system administrators may perform system-wide administrative operations, such as managing user roles and service units.

6. **Technical Constraints:** The system must comply with the technical limitations and resources available to the development team. Specific technologies and deployment requirements are TBD.

7. **Project Constraints:** The initial implementation must be developed within the available time, personnel, and resource limitations.

---

## 7. Open Questions

The following questions require further discussion and clarification:

### 7.1 User Accounts and Authentication

1. Should users authenticate through existing university accounts, or should the system provide its own registration mechanism?
2. Who is responsible for creating the initial system administrator account?
3. Can system administrators create user accounts, or are accounts obtained through university authentication?
4. Can users have multiple roles simultaneously?
5. Can administrators modify their own roles or permissions?

### 7.2 Issue Reporting and Tracking

6. Should users be allowed to submit reports anonymously?
7. Can users view reports submitted by others, or can they only view their own reports?
8. Should users be able to comment on reports or participate in discussions?
9. How should the system handle multiple reports describing the same issue? Should duplicate reports be linked to an existing issue?
10. What are the exact issue statuses and transitions in the issue lifecycle?
11. Should users be allowed to reopen an issue if they believe it has not actually been resolved?
12. Should users be able to provide feedback on resolved issues?

### 7.3 Issue Management and Assignment

13. Which notification channels should the system support (e.g., email, SMS, or in-app notifications)?
14. Who is responsible for creating and managing service units and their associated technicians?
15. Should coordinators and technicians be associated with specific service units?
16. Can an issue be assigned to multiple technicians simultaneously?
17. Do suggestions follow the same workflow as ordinary issue reports, or do they require additional handling?

### 7.4 System Administration

18. Should administrative operations be recorded in an audit log? If so, which operations should be recorded?
19. Should service units be allowed to be permanently deleted, or should they only be deactivated?
20. What administrative configurations should be configurable through the system?
21. Should system administrators be able to manage all user roles, or should some roles require additional authorization?

### 7.5 Technical and Operational Requirements

22. What are the expected maximum response times for ordinary operations?
23. How many concurrent users should the system support?
24. What availability level is required?
25. What data backup and recovery mechanisms should be implemented?
26. What deployment environment and technology stack will be used?

