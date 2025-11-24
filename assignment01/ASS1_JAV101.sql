CREATE DATABASE ASS1;
GO

USE ASS1;
GO

CREATE TABLE USERS (
    Id          VARCHAR(50)     NOT NULL PRIMARY KEY,
    Password    VARCHAR(100)    NOT NULL,
    Fullname    NVARCHAR(100)   NOT NULL,
    Birthday    DATE            NULL,
    Gender      BIT             NULL,      
    Mobile      VARCHAR(20)     NULL,
    Email       VARCHAR(100)    NULL,
    Role        BIT             NOT NULL   
);

CREATE TABLE CATEGORIES (
    Id      VARCHAR(50)     NOT NULL PRIMARY KEY,
    Name    NVARCHAR(100)   NOT NULL
);

CREATE TABLE NEWS (
    Id          VARCHAR(50)     NOT NULL PRIMARY KEY,
    Title       NVARCHAR(200)   NOT NULL,
    Content     NVARCHAR(MAX)   NOT NULL,
    Image       NVARCHAR(300)   NULL,
    PostedDate  DATE            NOT NULL DEFAULT GETDATE(),
    Author      VARCHAR(50)     NOT NULL,
    ViewCount   INT             NOT NULL DEFAULT 0,
    CategoryId  VARCHAR(50)     NOT NULL,
    Home        BIT             NOT NULL DEFAULT 0
);

ALTER TABLE NEWS
ADD CONSTRAINT FK_NEWS_USERS
    FOREIGN KEY (Author) REFERENCES USERS(Id);

ALTER TABLE NEWS
ADD CONSTRAINT FK_NEWS_CATEGORIES
    FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id);

CREATE TABLE NEWSLETTERS (
    Email       VARCHAR(100)    NOT NULL PRIMARY KEY,
    Enabled     BIT             NOT NULL DEFAULT 1
);