SELECT [ProductName]
	   ,[OrderDate]
	   ,DATEADD(DAY, 3, [OrderDate]) [Pay Due]
	   ,DATEADD(MONTH, 1, [OrderDate]) [Deliver Due]
FROM [Orders];