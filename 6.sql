	SELECT * FROM 
	(SELECT Name, COUNT(TaskContent)AS NotFinishedTasks FROM  -- ����� �������� � ����� ������������� �����
	(SELECT * FROM Everything WHERE TaskStatus				  -- ����� ��� ���� � �������, � ������� ������ ������� �� ������
	IN (SELECT Id FROM TaskStatus WHERE Status != '�������')) -- 
	AS W GROUP BY Name) AS WW                                 -- 
	WHERE NotFinishedTasks =								  -- ��� ���������� ������������� ����� �����������
	(SELECT MIN(NotFinishedTasks) FROM						  -- ����� ����������� ���������� �����
	(SELECT Name, COUNT(TaskContent)AS NotFinishedTasks			-- 2 ����� �������� � ���������� ������������� �����
	FROM (SELECT * FROM Everything WHERE TaskStatus					-- 1 ����� ��� ���� � �������, � ������� ������ ������� �� ������
	IN (SELECT Id FROM TaskStatus WHERE Status != '�������'))		-- 1 
	AS W GROUP BY Name) AS WW) 	