/* Create Workshop table */
CREATE TABLE Workshops (
	workshopID int NOT NULL IDENTITY(20000000,1) PRIMARY KEY,
	name nvarchar(256) NOT NULL,
	intro nvarchar(4000) NULL,
	learn nvarchar(4000) NULL,
	prepare nvarchar(4000) NULL
);