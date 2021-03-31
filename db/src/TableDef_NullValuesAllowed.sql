------DROP TABLE IF EXISTS------
DROP TABLE IF EXISTS InspectionLine;
DROP TABLE IF EXISTS Inspection;

DROP TABLE IF EXISTS EquipmentRespair;
DROP TABLE IF EXISTS EquipmentItem;

DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Room;


DROP TABLE IF EXISTS EquipmentBooking;
DROP TABLE IF EXISTS EquipmentTraining;
DROP TABLE IF EXISTS Visit;
DROP TABLE IF exists Person;

DROP TABLE IF EXISTS Equipment; 

------Equipment------
CREATE TABLE Equipment (
	equipCode CHAR(10), --max 999 types of equipment
	equipName VARCHAR(256) ,
	equipDesc VARCHAR(4000),
	equipInstruction VARCHAR(4000) , 
	equipPurpose VARCHAR(4000) ,
	equipSafetyCaution VARCHAR(4000) ,
	equipIsTrainingRequired int ,
	CONSTRAINT equipCodePK PRIMARY KEY(equipCode)
);


------Room-----
CREATE TABLE Room(
	roomId CHAR(7),
	roomName varchar(256),
	CONSTRAINT RoomPK PRIMARY KEY(roomId)
);

------Location------
CREATE TABLE Location(
	locId CHAR(10), --specific locequipion (area) in room
	roomId char(7) ,
	CONSTRAINT locIdPK PRIMARY KEY(locId),
	Constraint roomIdFK Foreign key(roomId) References Room ON DELETE CASCADE
	
);

------EquipmentItem------
CREATE TABLE EquipmentItem(
	equipCode CHAR(10) ,
	itemId int, --e.g. A18-050-01
	locId CHAR(10) ,
	itemStatus int , -- 0: not in use, 1: available in use, -1: temporarily repaired
	itemDeliveryDate Date ,
	itemRemovalDate Date , -- nearest inspection date where item is absent
	CONSTRAINT equipItemPK PRIMARY KEY(equipCode, itemId),
	CONSTRAINT equipCodeFK2 FOREIGN KEY(equipCode) REFERENCES Equipment ON DELETE CASCADE,
	CONSTRAINT locIdFK FOREIGN KEY(locId) REFERENCES Location ON DELETE CASCADE
);

------EquipmentRespair-----
CREATE TABLE EquipmentRespair(
	respId int, 
	equipCode CHAR(10),
	itemId int,
	respStartDate Date ,
	respEndDate Date,
	respDesc varchar(256) ,
	constraint respIdPK Primary Key(respId),
	constraint equipitemIdFK Foreign Key (equipCode, itemId) references EquipmentItem ON DELETE CASCADE
);

------Person------
CREATE TABLE Person(
	persId char(8), 
	persEmail varchar(256),
	persPhone char(10),
	persDept varchar(10),
	constraint persIdPK Primary Key(persId)
);

------VISIT-----
CREATE TABLE Visit(
	visitId int,
	persId char(8),
	visitTime TIMESTAMP,
	constraint visitIDPK PRIMARY KEY(visitId),
	constraint persIdFK1 FOREIGN  KEY(persId) References Person ON DELETE CASCADE
);

/* EquipmentTraining
Maps a person to an equipment that he/she completes training for. 
*/
CREATE TABLE EquipmentTraining(
	persId char(8),
	equipCode char(10), 
	completeDate Date ,
	constraint personTrainingPK PRIMARY KEY(persId, equipCode),
	constraint persIdFK2 FOREIGN KEY(persId) REFERENCES Person ON DELETE CASCADE,
	constraint equipCodeFK3 FOREIGN KEY(equipCode) REFERENCES Equipment ON DELETE CASCADE
);

------Inspection------
CREATE TABLE Inspection(
	inspId int, 
	inspStartTime DateTime   UNIQUE,
	inspEndTime DateTime  UNIQUE,
	persId char(8), --i.e. UG190005,
	inspNotes varchar(4000),
	constraint inspIdPK Primary Key(inspId),
	constraint persIdFK3 FOREIGN KEY(persId) REFERENCES Person ON DELETE CASCADE

);
/*InspectionLine
One inspection may have many lines. 
Each line inspects a specific equipment item*/
create table InspectionLine(
	inspId int,
	equipCode CHAR(10),
	itemId int,
	lineStatus varchar(50),
	constraint inspLinePK PRIMARY KEY(inspId, itemId),
	constraint inspIdFK FOREIGN KEY(inspId) REFERENCES Inspection ON DELETE CASCADE,
	constraint itemIdFK2 FOREIGN KEY(equipCode, itemId) REFERENCES EquipmentItem ON DELETE CASCADE,

);

------EquimentBooking-------
create table EquipmentBooking(
	bookingId int, 
	persId char(8) ,
	equipCode CHAR(10),
	itemId int , 
	bookingStartTime DateTime UNIQUE, 
	bookingEndTime DateTime UNIQUE,
	bookingStatus int, --1: acceped, 0: declined
	bookingPurpose varchar(256)
	Constraint bookingIdPK Primary Key(bookingId),
	Constraint bookingPersIdFK FOREIGN KEY(persId) REFERENCES Person ON DELETE CASCADE,
	Constraint bookingItemIdFK FOREIGN KEY(equipCode, itemId) REFERENCES EquipmentItem ON DELETE CASCADE
);



