/* Create PROJECTS table */
CREATE TABLE Projects (
	projectID int NOT NULL IDENTITY(10000000,1) PRIMARY KEY,
	name nvarchar(256) NOT NULL,
	advisor nvarchar(64) NULL,
	overview nvarchar(4000) NULL,
	objective nvarchar(4000) NULL,
	duration nvarchar(4000) NULL,
	click_count int NULL,
	created_at date NOT NULL,
	ongoing int NOT NULL,
	end_date date NULL
);
