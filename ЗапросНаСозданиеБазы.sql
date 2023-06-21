GO
Create Database ProjectBoxDB;
GO
Use ProjectBoxDB;
GO
Create Table UserData
(
	UserID int Primary key Identity(1,1),
	UserName varchar(256) not null,
	Email varchar(256),
	Telephone varchar(256)
);
Create Table AuthorizationData
(
	[Login] varchar(256) primary key,
	UserID int Foreign key References UserData(UserID) Unique Not null,
	SecurePasssword varchar(256) not null
);
Create Table ObjectData
(
	ObjectID int Primary key Identity(1,1),
	ObjectName varchar(256) not null,
	[Description] varchar(max),
	[Image] varbinary(max)
);
Create Table ContainerData
(
	ContainerID int Primary key Identity(1,1),
	ContainerName varchar(256) not null Unique,
	[Description] varchar(max)
);
Create Table HistoryOfChangesObjectLocation
(
	ChangesObjectLocationID int Primary key Identity(1,1),
	UserID int Foreign key References UserData(UserID) not null,
	ObjectID int Foreign key References ObjectData(ObjectID) not null,
	ContainerID int Foreign key References ContainerData(ContainerID) not null,
	[Description] varchar(max),
	ChangesDate datetime not null
);