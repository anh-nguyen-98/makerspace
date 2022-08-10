/* Create ProjectDepartment table */
CREATE TABLE ProjectDepartment (
	projectDepartmentID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	projectID int NOT NULL,
	CONSTRAINT FK_ProjectDepartment FOREIGN KEY (projectID) REFERENCES Projects (projectID),
	name nvarchar(64) NULL,
	role nvarchar(512) NULL
);