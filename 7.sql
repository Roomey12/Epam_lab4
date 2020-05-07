SELECT Name, COUNT(TaskContent) AS Wasted FROM Everything   -- 4. ����� �����, � ������� ����� �������, ������ �� �������							
WHERE Deadline < GETDATE() AND TaskStatus IN 
(SELECT Id FROM TaskStatus WHERE Status != '�������')
GROUP BY Name Having COUNT(TaskContent) =                   -- 4. � ���������� ���������� ����� ������������

(SELECT MAX(Wasted) FROM(                                   -- 3. �������� ���� ����� ������������ �����, ���� ����� ����������� � ����
SELECT Name, COUNT(TaskContent) AS Wasted FROM Everything   -- 2. ����� ����, ��� ���� �������� ��� ����� ����� � ������� ���������
WHERE Deadline < GETDATE() AND TaskStatus IN 
(SELECT Id FROM TaskStatus WHERE Status != '�������')       -- 1. �������� ��� ���� �������� ����� ����� ��������
Group by Name) As WW);