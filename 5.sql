SELECT ProjectName, DATEDIFF(day, Created, Finished) AS Duration 
FROM Project Order By Duration Desc;