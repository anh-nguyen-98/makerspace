------EquimentBooking-------
CREATE TABLE EquipmentBooking(
	bookingID INT IDENTITY(1,1) PRIMARY KEY, 
	userID INT,
	itemId INT, 
	bookingStartTime DateTime, 
	bookingEndTime DateTime,
	bookingStatus INT, --1: acceped, 0: declined
	bookingPurpose NVARCHAR(256),
	ConstraINT bookingPersIdFK FOREIGN KEY(userID) REFERENCES MksUser ON DELETE CASCADE ON UPDATE CASCADE,
	ConstraINT bookingItemIdFK FOREIGN KEY(itemId) REFERENCES EquipmentItem ON DELETE CASCADE ON UPDATE CASCADE
);
