CREATE DATABASE sample2

--Alter mevcut bir tabloya s�tun eklemek, silmek, s�tunlar� d�zenlemek i�in ve Foreign Key, gibi s�tunlar �zerinde �al��an k�s�tlamalar eklemek i�in kullan�l�r.
ALTER TABLE table_name ADD 				column_name datatype
					 --DROP COLUMN 		column_name datatype
					 --MODIFY COLUMN 	column_name datatype
					 --MODIFY 			column_name datatype NOT NULL
					 
					 --ADD CONSTRAINT MyUniqueConstraint UNIQUE		 (column1, column2...)
					 --ADD CONSTRAINT MyPrimaryKey 		 PRIMARY KEY (column1, column2...)
					 --DROP CONSTRAINT My...Constraint
					 
Alter database sample2 modify Name = sample3
sp_renameDB 'sample3','sample4'
Drop database sample4