Select Position, Count(Worker.EmpId) As EmployeeCount from Position
Left Join Worker On Worker.PosId = Position.Id
Group by Position;
