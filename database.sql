BEGIN TRANSACTION;
CREATE TABLE `VPN` (
	`ID`	TEXT,
	`Client`	TEXT,
	`ClientName`	TEXT,
	`Version`	TEXT,
	`Server`	TEXT,
	`Logins`	TEXT,
	`Notes`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`User`) REFERENCES User(ID)
);
CREATE TABLE `UserType` (
	`ID`	TEXT,
	PRIMARY KEY(ID)
);
CREATE TABLE "User" (
	`ID`	TEXT,
	`Password`	TEXT,
	`Fullname`	TEXT,
	`Phone`	TEXT,
	`Affiliation`	TEXT,
	`Usertype`	TEXT,
	`Email`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`Affiliation`) REFERENCES `Customer`(`ID`)
);
CREATE TABLE `Tag` (
	`ID`	TEXT,
	`Text`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`User`) REFERENCES User(ID)
);
CREATE TABLE `Software` (
	`ID`	TEXT,
	`Name`	TEXT,
	`Version`	TEXT,
	PRIMARY KEY(ID)
);
CREATE TABLE `Server` (
	`ID`	TEXT,
	`Platform`	TEXT,
	`OS`	TEXT,
	`Name`	TEXT,
	`IP`	TEXT,
	`Environment`	TEXT,
	`Logins`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`User`) REFERENCES User(ID)
);
CREATE TABLE `Logins` (
	`ID`	TEXT,
	`Type`	TEXT,
	`Name`	TEXT,
	`Password`	TEXT,
	`Domain`	TEXT,
	`Expiration`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`User`) REFERENCES User(ID)
);
CREATE TABLE "Customer" (
	`ID`	TEXT,
	`Name`	TEXT,
	`Address`	TEXT,
	`Phone`	TEXT,
	`PrimaryContact`	TEXT,
	`VPNInfo`	TEXT,
	`Servers`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`PrimaryContact`) REFERENCES `User`(`ID`),
	FOREIGN KEY(`VPNInfo`) REFERENCES VPN(ID),
	FOREIGN KEY(`User`) REFERENCES `User`(`ID`)
);
INSERT INTO `Customer` VALUES ('BA5005','Dave Martina','13 Somwhere street','111-222-1234',NULL,NULL,NULL,'1','01/20/2017',NULL);
CREATE TABLE "Comment" (
	`ID`	TEXT,
	`Text`	TEXT,
	`ReplyTo`	TEXT,
	`Article`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`ReplyTo`) REFERENCES `Comment`(`ID`),
	FOREIGN KEY(`Article`) REFERENCES Article(ID),
	FOREIGN KEY(`User`) REFERENCES `User`(`ID`)
);
CREATE TABLE "Attachments" (
	`ID`	TEXT,
	`Type`	TEXT,
	`FileExt`	TEXT,
	`Data`	BLOB,
	`Article`	BLOB,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`Article`) REFERENCES Article(ID),
	FOREIGN KEY(`User`) REFERENCES `User`(`ID`)
);
CREATE TABLE "Articles" (
	`ID`	TEXT,
	`Title`	TEXT,
	`Symptoms`	TEXT,
	`Summary`	TEXT,
	`Cause`	TEXT,
	`Resolution`	TEXT,
	`Tags`	TEXT,
	`Attachments`	BLOB,
	`Customer`	TEXT,
	`User`	TEXT,
	`Created`	TEXT,
	`Modified`	TEXT,
	PRIMARY KEY(ID),
	FOREIGN KEY(`Customer`) REFERENCES `Customers`(`ID`)
);
INSERT INTO `Articles` VALUES ('1','Printer stopped working','Data sent to printer, no output',NULL,NULL,NULL,'EPSON, Output, Hardware',NULL,'BA5005','Dave','1/20/2017',NULL);
INSERT INTO `Articles` VALUES ('2','Input data no longer being recieved','Input data created, but does not reach server',NULL,NULL,NULL,'CERNER, Network',NULL,'AZ13','Patrick','5/13/2012',NULL);
COMMIT;
