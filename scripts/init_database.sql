/*
=============================================================
Создание базы данных и схем
=============================================================
Назначение скрипта:
    Этот скрипт создает новую базу данных с именем "Хранилище данных" после проверки, существует ли она уже. 
    Если база данных существует, она удаляется и создается заново. Кроме того, скрипт настраивает
в базе данных три схемы: "бронзовую", "серебряную" и "золотую".
	
Предупреждение:
    Запуск этого скрипта приведет к удалению всей базы данных DataWarehouse, если она существует. 
    Все данные в базе данных будут удалены безвозвратно. Действуйте с осторожностью 
    и убедитесь, что у вас есть надлежащие резервные копии, прежде чем запускать этот скрипт.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
