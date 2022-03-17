------DROP TABLE IF EXISTS------
DROP TABLE IF EXISTS EquipmentItem;

DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Object;
DROP TABLE IF EXISTS RoomSpace;
DROP TABLE IF EXISTS Room;

DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS UserRoles;
DROP TABLE IF EXISTS RolePermission;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Permission;
DROP TABLE IF EXISTS MUser;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Equipment; 

------Room-----
CREATE TABLE Room( 
	id INT IDENTITY(1,1) PRIMARY KEY,
	code NCHAR(5) UNIQUE,
	name NVARCHAR(256)
);

------Space------
CREATE TABLE RoomSpace(	
	id INT IDENTITY(1,1) PRIMARY KEY,
	room_id INT,
	code NCHAR(2),
	name NVARCHAR(100),
	CONSTRAINT RSUnique UNIQUE(room_id, code),
	CONSTRAINT RS_RoomFK FOREIGN KEY(room_id) REFERENCES Room(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Object
(	
	id INT IDENTITY(1,1) PRIMARY KEY,
	code NCHAR(2) UNIQUE,
	name NVARCHAR(20)
);

------Location------
CREATE TABLE Location(
	id INT IDENTITY(1,1) PRIMARY KEY,

	-- room-space code --
	room_space_id INT,
	
	-- object-no code -- 
	object_id INT,
	object_num NCHAR(3),

	CONSTRAINT LocUNIQUE UNIQUE (room_space_id, object_id, object_num),
	CONSTRAINT Loc_RoomSpaceFK FOREIGN KEY(room_space_id) REFERENCES RoomSpace (id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT Loc_ObjectFK FOREIGN KEY(object_id) REFERENCES Object(id) ON DELETE CASCADE ON UPDATE CASCADE	
);

----EquipmentCategory------
CREATE TABLE Category (
	id INT IDENTITY(1,1) PRIMARY KEY,
	code NCHAR(5),
	name NVARCHAR(20)
);

------Equipment------
CREATE TABLE Equipment (
	id INT IDENTITY(1,1) PRIMARY KEY,
	code NCHAR(15) UNIQUE, 
	name NVARCHAR(256),
	description NVARCHAR(4000),
	purpose NVARCHAR(4000) ,
	instruction NVARCHAR(4000),
	training INT,
	category_id INT,
	popular int default 0 CONSTRAINT popular_check  CHECK (popular >= 0),
	name_vie NVARCHAR(256),
	image NVARCHAR(100),
	CONSTRAINT item_category FOREIGN KEY(category_id) REFERENCES Category(id) ON DELETE CASCADE ON UPDATE CASCADE
);



------EquipmentItem------
CREATE TABLE EquipmentItem(
	id INT IDENTITY(1,1) PRIMARY KEY,
	equipment_id INT,
	num INT,
	location_id INT,
	status INT , -- 0: not in use, 1: available in use
	delivered_at DATE , ---YYYY-MM-DD
	removed_at DATE, -- nearest inspection date where item is absent,
	CONSTRAINT equipItemUnique UNIQUE (equipment_id, num),
	CONSTRAINT EI_equipementFK FOREIGN KEY(equipment_id) REFERENCES Equipment(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT EI_locFK FOREIGN KEY(location_id) REFERENCES Location(id) ON DELETE CASCADE ON UPDATE CASCADE
);

------Makerspace User------
CREATE TABLE MUser (
	id INT IDENTITY(1,1) PRIMARY KEY,
	email NVARCHAR(256),
	first_name NVARCHAR(100),
	last_name NVARCHAR(100),
	department NVARCHAR(15)
);

CREATE TABLE Staff (
	id INT IDENTITY(1,1) PRIMARY KEY,
	user_id INT UNIQUE,
	status INT,
	start_date DATE,
	end_date DATE
);

/*Role*/
CREATE TABLE Role(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(60)
);

/*User roles*/
CREATE TABLE UserRoles(
	id INT IDENTITY(1,1) PRIMARY KEY,
	user_id INT,
	role_id INT, 
	CONSTRAINT userID FOREIGN KEY (user_id) REFERENCES Muser (id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT roleID FOREIGN KEY (role_id) REFERENCES Role (id) ON DELETE CASCADE ON UPDATE CASCADE

);


/*Role Permission*/
CREATE TABLE Permission(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(256)
)
/* Mapping Role with Permission*/
CREATE TABLE RolePermission(
	id INT IDENTITY(1,1) PRIMARY KEY,
	role_id INT,
	perm_id INT ,
	CONSTRAINT role_ID FOREIGN KEY (role_id) REFERENCES Role (id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT perm_ID FOREIGN KEY (perm_id) REFERENCES Permission (id) ON DELETE CASCADE ON UPDATE CASCADE
)

/* EquipmentTraining
Maps a user to an equipment that he/she completes training for. 
*/
--CREATE TABLE UserTraining(
--	usrtrID INT IDENTITY(1,1) PRIMARY KEY, 
--	userId INT,
--	eID INT, 
--	completeDate DATE,
--	CONSTRAINT UT_PK UNIQUE (userId, eID),
--	constraINT UT_UserFK FOREIGN KEY(userId) REFERENCES MksUser ON DELETE CASCADE ON UPDATE CASCADE,
--	constraINT UT_EquipementFK FOREIGN KEY(eID) REFERENCES Equipment ON DELETE CASCADE ON UPDATE CASCADE
--);

------VISIT-----
/*CREATE TABLE Visit(
	visitID INT IDENTITY(1,1) PRIMARY KEY,
	userID INT,
	visitTime TIMESTAMP,
	CONSTRAINT Visit_UserFK FOREIGN  KEY(userId) References MksUser ON DELETE CASCADE ON UPDATE CASCADE
);*/


------Inspection------
--CREATE TABLE Inspection(
--	inspectnId INT IDENTITY(1,1) PRIMARY KEY, 
--	inspectnDate DATE,
--	userID INT, 
--	inspectnNotes NVARCHAR(4000),
--	constraINT Inspectn_UserID_FK FOREIGN KEY(userID) REFERENCES MksUser ON DELETE CASCADE ON UPDATE CASCADE

--);

/*InspectionLine
One inspection may have many lines. 
Each line inspects a specific equipment item*/
--create table InspectionLine(
--	lineID INT IDENTITY(1,1) PRIMARY KEY,
--	inspectnID INT,
--	itemID INT,
--	lineStatus NVARCHAR(50),
--	CONSTRAINT line_inspectnid_FK FOREIGN KEY(inspectnID) REFERENCES Inspection ON DELETE CASCADE ON UPDATE CASCADE,
--	CONSTRAINT line_itemId_FK FOREIGN KEY(itemID) REFERENCES EquipmentItem ON DELETE CASCADE ON UPDATE CASCADE,

--);

------EquipmentRespair-----
/*CREATE TABLE EquipmentRespair(
	respId INT, 
	code CHAR(10),
	itemId INT,
	respStartDate Date ,
	respEndDate Date,
	respDesc NVARCHAR(256) ,
	constraINT respIdPK Primary Key(respId),
	constraINT equipitemIdFK Foreign Key (code, itemId) references EquipmentItem ON DELETE CASCADE
);*/
