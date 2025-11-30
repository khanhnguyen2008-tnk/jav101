CREATE DATABASE Lab06_JAV101;
GO
USE Lab06_JAV101;
GO

CREATE TABLE Departments (
    Id CHAR(3) NOT NULL, 
    Name NVARCHAR(50) NOT NULL, 
    Description NVARCHAR(255) NULL, 
    PRIMARY KEY (Id), 
);

CREATE TABLE Employees (
    Id VARCHAR(20) NOT NULL,
    Password NVARCHAR(50) NOT NULL, 
    Fullname NVARCHAR(50) NOT NULL, 
    Photo NVARCHAR(50) NOT NULL, 
    Gender BIT NOT NULL, 
    Birthday DATE NOT NULL,
    Salary FLOAT NOT NULL, 
    DepartmentId CHAR(3) NOT NULL,
    PRIMARY KEY (Id), 
    FOREIGN KEY (DepartmentId) REFERENCES Departments (Id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE 
);

INSERT INTO Departments (Id, Name, Description) 
VALUES ('HR', N'Phòng Nhân Sự', N'Quản lý nhân sự');
INSERT INTO Departments (Id, Name, Description) 
VALUES ('SAL', N'Phòng Kinh Doanh', N'Phụ trách bán hàng và doanh số');
INSERT INTO Employees (Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId) 
VALUES ('NV001', '123456', N'Trần Thị B', 'b.jpg', 0, '1998-03-01', 9000000, 'SAL');
INSERT INTO Employees (Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId) 
VALUES ('NV002', '123450', N'Nguyễn Văn C', 'b.jpg', 1, '1988-03-01', 9000000, 'HR');
INSERT INTO Employees (Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId) 
VALUES ('NV003', '234251', N'Nguyễn Văn A', 'b.jpg', 1, '1989-03-02', 9000000, 'SAL');

UPDATE Departments 
SET 
    Name = N'Phòng Hành chính Nhân sự', 
    Description = N'Tuyển dụng và Hành chính' 
WHERE 
    Id = 'HR';

DELETE FROM Departments 
WHERE 
    Id = 'HR';

SELECT * FROM Departments;

SELECT * FROM Departments 
WHERE 
    Id = 'HR';

UPDATE Employees 
SET 
    Salary = 12000000, 
    DepartmentId = 'SAL' 
WHERE 
    Id = 'NV001';

DELETE FROM Employees 
WHERE 
    Id = 'NV001';

SELECT * FROM Employees;

SELECT * FROM Employees 
WHERE 
    Id = 'NV001';