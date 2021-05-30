IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Employes] (
    [employesid] int NOT NULL IDENTITY,
    [employesname] nvarchar(max) NULL,
    [employesdesignation] nvarchar(max) NULL,
    [employessalary] int NOT NULL,
    CONSTRAINT [PK_Employes] PRIMARY KEY ([employesid])
);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210530070309_InitialCreate', N'2.1.1-rtm-30846');

GO

CREATE TABLE [Customers] (
    [Customersid] int NOT NULL IDENTITY,
    [CustomersFirstName] nvarchar(max) NULL,
    [CustomersLastName] nvarchar(max) NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY ([Customersid])
);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210530073101_CreateTable_Customers', N'2.1.1-rtm-30846');

GO

ALTER TABLE [Customers] ADD [CustomersFullName] nvarchar(max) NULL;

GO

update Customers set CustomersFullName = CustomersFirstName + ' : ' +CustomersLastName

GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Customers]') AND [c].[name] = N'CustomersFirstName');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Customers] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Customers] DROP COLUMN [CustomersFirstName];

GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Customers]') AND [c].[name] = N'CustomersLastName');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Customers] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Customers] DROP COLUMN [CustomersLastName];

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210530074017_DropCustomersFirstNameAndCustomersLastName_Customers', N'2.1.1-rtm-30846');

GO

