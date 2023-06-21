Go
	Use ProjectBoxDB;
--GO
--	SELECT HistoryOfChangesObjectLocation.ObjectID, ObjectData.ObjectName, ObjectData.[Description],
--	ContainerData.ContainerName, HistoryOfChangesObjectLocation.[Description], UserData.UserName, UserData.Email, HistoryOfChangesObjectLocation.ChangesDate
--	FROM HistoryOfChangesObjectLocation
--	join UserData on HistoryOfChangesObjectLocation.UserID = UserData.UserID
--	join ObjectData on HistoryOfChangesObjectLocation.ObjectID = ObjectData.ObjectID
--	join ContainerData on HistoryOfChangesObjectLocation.ContainerID = ContainerData.ContainerID
--	WHERE ChangesObjectLocationID = (select top 1 ChangesObjectLocationID from HistoryOfChangesObjectLocation AS S
--	where S.ObjectID=HistoryOfChangesObjectLocation.ObjectID order by ChangesDate desc)
GO
	CREATE VIEW Complete_tasks(ObjectID, ObjectName, ObjectDataDescription,
	ContainerName, HistoryOfChangesObjectLocationDescription, UserName, Email, ChangesDate)
	AS SELECT ISNULL(HistoryOfChangesObjectLocation.ObjectID, -1), ObjectData.ObjectName, ObjectData.[Description],
	ContainerData.ContainerName, HistoryOfChangesObjectLocation.[Description], UserData.UserName, UserData.Email, HistoryOfChangesObjectLocation.ChangesDate
	FROM HistoryOfChangesObjectLocation
	join UserData on HistoryOfChangesObjectLocation.UserID = UserData.UserID
	join ObjectData on HistoryOfChangesObjectLocation.ObjectID = ObjectData.ObjectID
	join ContainerData on HistoryOfChangesObjectLocation.ContainerID = ContainerData.ContainerID
	WHERE ChangesObjectLocationID = (select top 1 ChangesObjectLocationID from HistoryOfChangesObjectLocation AS S
	where S.ObjectID=HistoryOfChangesObjectLocation.ObjectID order by ChangesDate desc)