SELECT ProjectName, COUNT(TaskContent) AS TasksCount FROM Everything WHERE TaskStatus IN 
(SELECT Id FROM TaskStatus WHERE Status = '�������')
GROUP BY ProjectName;