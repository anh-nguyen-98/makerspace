/* Create Progress table */
CREATE TABLE ProjectProgress (
	projectProgressID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	projectID int NOT NULL,
	CONSTRAINT FK_ProjectProgress FOREIGN KEY (projectID) REFERENCES Projects (projectID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	phase int NULL,
	description nvarchar(512) NULL
);
