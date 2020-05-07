SELECT ProjectName,
	Cast( COUNT(TaskContent) AS float)/ Cast( COUNT(DISTINCT(Name)) AS float) AS AverageTasks
	FROM Everything GROUP BY ProjectName;