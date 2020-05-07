SELECT Name, COUNT(TaskContent) AS Wasted FROM Everything   -- 4. ¬з€ть людей, у который истек дедлайн, задача не закрыта							
WHERE Deadline < GETDATE() AND TaskStatus IN 
(SELECT Id FROM TaskStatus WHERE Status != '«акрыта')
GROUP BY Name Having COUNT(TaskContent) =                   -- 4. и количество незакрытых задач максимальное

(SELECT MAX(Wasted) FROM(                                   -- 3. ѕолучить макс число просроченных задач, чтоб найти сотрудников с ними
SELECT Name, COUNT(TaskContent) AS Wasted FROM Everything   -- 2. ¬з€ть инфу, где айди статусов все кроме задач и дедлайн просрочен
WHERE Deadline < GETDATE() AND TaskStatus IN 
(SELECT Id FROM TaskStatus WHERE Status != '«акрыта')       -- 1. ѕолучить все айди статусов задач кроме закрытой
Group by Name) As WW);