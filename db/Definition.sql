------DROP TABLE IF EXISTS------
DROP TABLE IF EXISTS InspectionLine;
DROP TABLE IF EXISTS Inspection;

DROP TABLE IF EXISTS EquipmentRespair;
DROP TABLE IF EXISTS EquipmentItem;

DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS LocObject;
DROP TABLE IF EXISTS RoomSpace;
DROP TABLE IF EXISTS Room;


DROP TABLE IF EXISTS EquipmentBooking;
DROP TABLE IF EXISTS UserTraining;
DROP TABLE IF EXISTS Visit;
DROP TABLE IF EXISTS UserRoles;
DROP TABLE IF exists MksUser;
DROP TABLE IF EXISTS RolePermission;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Permission;
DROP TABLE IF EXISTS EquipmentCategory;
DROP TABLE IF EXISTS Equipment; 
------Room-----
CREATE TABLE Room( 
	roomID INT IDENTITY(1,1) PRIMARY KEY,
	roomCode NCHAR(5) UNIQUE,
	roomName NVARCHAR(256)
);

------Space------
CREATE TABLE RoomSpace(	
	spaceID INT IDENTITY(1,1) PRIMARY KEY,
	roomID INT,
	spaceCode NCHAR(2),
	spaceName NVARCHAR(100),
	CONSTRAINT RSUnique UNIQUE(roomID, spaceCode),
	CONSTRAINT RS_RoomFK FOREIGN KEY(roomID) REFERENCES Room ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LocObject
(	
	objectID INT IDENTITY(1,1) PRIMARY KEY,
	objectCode NCHAR(2) UNIQUE,
	objectName NVARCHAR(20)
);

------Location------
CREATE TABLE Location(
	locID INT IDENTITY(1,1) PRIMARY KEY,

	-- room-space code --
	spaceID INT,
	
	-- object-no code -- 
	objectID INT,
	objectNum NCHAR(3),

	CONSTRAINT LocUNIQUE UNIQUE (spaceID, objectID, objectNum),
	CONSTRAINT Loc_RoomSpaceFK FOREIGN KEY(spaceID) REFERENCES RoomSpace ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT Loc_ObjectFK FOREIGN KEY(objectID) REFERENCES LocObject ON DELETE CASCADE ON UPDATE CASCADE	
);

------Equipment------
CREATE TABLE Equipment (
	eID INT IDENTITY(1,1) PRIMARY KEY,
	eCode NCHAR(15) UNIQUE, 
	eName NVARCHAR(256) ,
	eDesc NVARCHAR(4000),
	eFunction NVARCHAR(4000) ,
	eManual NVARCHAR(4000) , 
	eSafety NVARCHAR(4000) ,
	eTraining INT
);




------EquipmentItem------
CREATE TABLE EquipmentItem(
	itemID INT IDENTITY(1,1) PRIMARY KEY,
	eID INT,
	itemNum INT,
	locID INT,
	itemStatus INT , -- 0: not in use, 1: available in use, -1: temporarily repaired
	itemDeliveryDate DATE , ---YYYY-MM-DD
	itemRemovalDate DATE, -- nearest inspection date where item is absent
	CONSTRAINT equipItemUnique UNIQUE (eID, itemNum),
	CONSTRAINT EI_equipementFK FOREIGN KEY(eID) REFERENCES Equipment ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT EI_locFK FOREIGN KEY(locID) REFERENCES Location ON DELETE CASCADE ON UPDATE CASCADE
);

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

------Person------
CREATE TABLE MksUser(
	userID INT IDENTITY(1,1) PRIMARY KEY, 
	userCode NCHAR(10),
	userEmail NVARCHAR(256),
	userFirstName NVARCHAR(100),
	userLastName NVARCHAR(100),
	userMiddleName NVARCHAR(100),
	userPhone NCHAR(15),
	userDept NVARCHAR(15),
	userJob NVARCHAR(256),
	userDOB DATE
);

------VISIT-----
CREATE TABLE Visit(
	visitID INT IDENTITY(1,1) PRIMARY KEY,
	userID INT,
	visitTime TIMESTAMP,
	CONSTRAINT Visit_UserFK FOREIGN  KEY(userId) References MksUser ON DELETE CASCADE ON UPDATE CASCADE
);

/* EquipmentTraining
Maps a useron to an equipment that he/she completes training for. 
*/
CREATE TABLE UserTraining(
	usrtrID INT IDENTITY(1,1) PRIMARY KEY, 
	userId INT,
	eID INT, 
	completeDate DATE,
	CONSTRAINT UT_PK UNIQUE (userId, eID),
	constraINT UT_UserFK FOREIGN KEY(userId) REFERENCES MksUser ON DELETE CASCADE ON UPDATE CASCADE,
	constraINT UT_EquipementFK FOREIGN KEY(eID) REFERENCES Equipment ON DELETE CASCADE ON UPDATE CASCADE
);


------Inspection------
CREATE TABLE Inspection(
	inspectnId INT IDENTITY(1,1) PRIMARY KEY, 
	inspectnDate DATE,
	userID INT, 
	inspectnNotes NVARCHAR(4000),
	constraINT Inspectn_UserID_FK FOREIGN KEY(userID) REFERENCES MksUser ON DELETE CASCADE ON UPDATE CASCADE

);

/*InspectionLine
One inspection may have many lines. 
Each line inspects a specific equipment item*/
create table InspectionLine(
	lineID INT IDENTITY(1,1) PRIMARY KEY,
	inspectnID INT,
	itemID INT,
	lineStatus NVARCHAR(50),
	CONSTRAINT line_inspectnid_FK FOREIGN KEY(inspectnID) REFERENCES Inspection ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT line_itemId_FK FOREIGN KEY(itemID) REFERENCES EquipmentItem ON DELETE CASCADE ON UPDATE CASCADE,

);
/*Role*/
CREATE TABLE Role(
	roleID INT IDENTITY(1,1) PRIMARY KEY,
	roleName NVARCHAR(60)
);
/*User roles*/
CREATE TABLE UserRoles(
	id INT IDENTITY(1,1) PRIMARY KEY,
	userID INT,
	roleID INT, 
	CONSTRAINT userID FOREIGN KEY (userID) REFERENCES MksUser (userID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT roleID FOREIGN KEY (roleID) REFERENCES Role (roleID) ON DELETE CASCADE ON UPDATE CASCADE

);
/*Role Permission*/
CREATE TABLE Permission(
	permissionID INT IDENTITY(1,1) PRIMARY KEY,
	permission NVARCHAR(256)
)
/* Mapping Role with Permission*/
CREATE TABLE RolePermission(
	id INT IDENTITY(1,1) PRIMARY KEY,
	roleID INT,
	perID INT ,
	CONSTRAINT role_ID FOREIGN KEY (roleID) REFERENCES Role (roleID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT perID FOREIGN KEY (perID) REFERENCES Permission (permissionID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE EquipmentCategory (
	catID INT IDENTITY(1,1) PRIMARY KEY,
	catCode NCHAR(5),
	catName NVARCHAR(20)
);

