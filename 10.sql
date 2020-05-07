SELECT ProjectName, Max(Deadline) as NewFinishDate FROM -- получить проект и выбрать из дедлайн задачи которая была закрыта последней
Everything WHERE ProjectName = 
(SELECT W.ProjectName FROM 
((SELECT ProjectName, COUNT(TaskContent) AS TaskCount
FROM Everything GROUP BY ProjectName) AS W JOIN 

(SELECT ProjectName, COUNT(ProjectName) AS FinishedTasks FROM Everything  -- получить закрытые задачи по проектам
WHERE TaskStatus IN (SELECT Id FROM TaskStatus WHERE Status = 'Закрыта')
GROUP BY ProjectName)

AS WW ON W.ProjectName = WW.ProjectName) 
WHERE FinishedTasks = TaskCount) AND TaskStatus = 4
Group by ProjectName
