SELECT ProjectName, COUNT(TaskContent) AS TasksCount FROM Everything WHERE TaskStatus IN 
(SELECT Id FROM TaskStatus WHERE Status = 'Открыта')
GROUP BY ProjectName;