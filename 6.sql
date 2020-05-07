	SELECT * FROM 
	(SELECT Name, COUNT(TaskContent)AS NotFinishedTasks FROM  -- Взять человека и колво незавершенных задач
	(SELECT * FROM Everything WHERE TaskStatus				  -- Взять всю инфу о записях, у которых статус проекта не закрыт
	IN (SELECT Id FROM TaskStatus WHERE Status != 'Закрыта')) -- 
	AS W GROUP BY Name) AS WW                                 -- 
	WHERE NotFinishedTasks =								  -- Где количество незавершенных задач минимальное
	(SELECT MIN(NotFinishedTasks) FROM						  -- Взять минимальное количество задач
	(SELECT Name, COUNT(TaskContent)AS NotFinishedTasks			-- 2 Взять человека и количество незавершенных задач
	FROM (SELECT * FROM Everything WHERE TaskStatus					-- 1 Взять всю инфу о записях, у которых статус проекта не закрыт
	IN (SELECT Id FROM TaskStatus WHERE Status != 'Закрыта'))		-- 1 
	AS W GROUP BY Name) AS WW) 	