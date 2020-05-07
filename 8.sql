Update Task
Set Deadline = DATEADD(day, 5, Deadline)
Where TaskStatus IN (SELECT Id FROM TaskStatus WHERE Status != 'Закрыта')