/* Create Images table */
CREATE TABLE Images (
	imageID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	pageID int NOT NULL,
	position int NOT NULL,
	section int NOT NULL,
	image_path nvarchar(100) NOT NULL
);