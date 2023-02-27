/* Disable foreign keys */
PRAGMA foreign_keys = 'off';

/* Begin transaction */
BEGIN;

/* Database properties */
PRAGMA auto_vacuum = 0;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = 4096;

/* Drop table [admin_list] */
DROP TABLE IF EXISTS [main].[admin_list];

/* Table structure [admin_list] */
CREATE TABLE [main].[admin_list](
  [admin_id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  [fullname] INTEGER NOT NULL, 
  [username] TEXT NOT NULL, 
  [password] TEXT NOT NULL, 
  [type] INTEGER NOT NULL DEFAULT 1, 
  [status] INTEGER NOT NULL DEFAULT 1, 
  [date_created] TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

/* Drop table [position_list] */
DROP TABLE IF EXISTS [main].[position_list];

/* Table structure [position_list] */
CREATE TABLE [main].[position_list](
  [position_id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  [name] TEXT NOT NULL, 
  [status] TEXT NOT NULL DEFAULT 1, 
  [date_created] TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

/* Drop table [department_list] */
DROP TABLE IF EXISTS [main].[department_list];

/* Table structure [department_list] */
CREATE TABLE [main].[department_list](
  [department_id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  [name] TEXT NOT NULL, 
  [status] TEXT NOT NULL DEFAULT 1, 
  [date_created] TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

/* Drop table [employee_list] */
DROP TABLE IF EXISTS [main].[employee_list];

/* Table structure [employee_list] */
CREATE TABLE [main].[employee_list](
  [employee_id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  [department_id] INTEGER NOT NULL REFERENCES [department_list]([department_id]) ON DELETE CASCADE, 
  [position_id] INTEGER NOT NULL REFERENCES [position_list]([position_id]) ON DELETE CASCADE, 
  [employee_code] TEXT NOT NULL, 
  [firstname] TEXT NOT NULL, 
  [middlename] TEXT, 
  [lastname] TEXT NOT NULL, 
  [gender] TEXT NOT NULL, 
  [contact] TEXT NOT NULL, 
  [email] TEXT NOT NULL, 
  [password] TEXT NOT NULL, 
  [address] TEXT NOT NULL, 
  [status] TEXT NOT NULL DEFAULT 1, 
  [date_created] TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

/* Drop table [attendance_list] */
DROP TABLE IF EXISTS [main].[attendance_list];

/* Table structure [attendance_list] */
CREATE TABLE [main].[attendance_list](
  [attendance_id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  [employee_id] INTEGER NOT NULL REFERENCES [employee_list]([employee_id]) ON DELETE CASCADE, 
  [device_type] TEXT NOT NULL, 
  [att_type] TEXT NOT NULL, 
  [ip] TEXT NOT NULL, 
  [location] TEXT NOT NULL, 
  [json_data] TEXT NOT NULL, 
  [date_created] TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

/* Table data [admin_list] Record count: 2 */
INSERT INTO [admin_list]([rowid], [admin_id], [fullname], [username], [password], [type], [status], [date_created]) VALUES(1, 1, 0, 'admin', '0192023a7bbd73250516f069df18b500', 1, 1, '2023-02-17 05:34:30.000');
INSERT INTO [admin_list]([rowid], [admin_id], [fullname], [username], [password], [type], [status], [date_created]) VALUES(2, 2, 0, 'MAN014', '1226b72b14fbf5912f901c582ca30cdd', 2, 1, '2023-02-17 06:06:28.000');

/* Table data [position_list] Record count: 8 */
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(1, 1, 'Developer', '0', '2023-02-17 05:46:45.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(2, 2, 'Junior Developer', '1', '2023-02-17 05:47:05.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(3, 3, 'Senior Developer', '0', '2023-02-17 05:47:24.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(4, 4, 'Technician', '1', '2023-02-17 05:47:33.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(5, 5, 'Junior Technician', '1', '2023-02-17 05:47:49.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(6, 6, 'Senior Technicain', '1', '2023-02-17 05:48:05.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(7, 7, 'Sales Representative', '1', '2023-02-17 05:50:58.000');
INSERT INTO [position_list]([rowid], [position_id], [name], [status], [date_created]) VALUES(8, 8, 'Internal Sales Representative', '1', '2023-02-17 05:52:00.000');

/* Table data [department_list] Record count: 4 */
INSERT INTO [department_list]([rowid], [department_id], [name], [status], [date_created]) VALUES(1, 1, 'Deveolopment', '1', '2023-02-17 05:45:21.000');
INSERT INTO [department_list]([rowid], [department_id], [name], [status], [date_created]) VALUES(2, 2, 'Sales', '1', '2023-02-17 05:45:34.000');
INSERT INTO [department_list]([rowid], [department_id], [name], [status], [date_created]) VALUES(3, 3, 'Management', '1', '2023-02-17 05:45:44.000');
INSERT INTO [department_list]([rowid], [department_id], [name], [status], [date_created]) VALUES(4, 4, 'Technical', '1', '2023-02-17 05:46:10.000');

/* Table data [employee_list] Record count: 1 */
INSERT INTO [employee_list]([rowid], [employee_id], [department_id], [position_id], [employee_code], [firstname], [middlename], [lastname], [gender], [contact], [email], [password], [address], [status], [date_created]) VALUES(1, 1, 1, 2, 'MAN014', 'JOE-KABAMBA', '', 'MULAJI', 'Male', '+27 72 297 7581', 'jmk.mulaji@hotmail.com', '1226b72b14fbf5912f901c582ca30cdd', '', '1', '2023-02-17 06:05:33.000');

/* Table data [attendance_list] Record count: 4 */
INSERT INTO [attendance_list]([rowid], [attendance_id], [employee_id], [device_type], [att_type], [ip], [location], [json_data], [date_created]) VALUES(1, 1, 1, 'desktop', 'IN', '197.99.70.23', '-26.1000,28.0556', '{"ip":"197.99.70.23","hostname":"197-99-70-23.ip.broadband.is","city":"Johannesburg","region":"Gauteng","country":"ZA","loc":"-26.1000,28.0556","org":"AS3741 Dimension Data","postal":"2191","timezone":"Africa/Johannesburg","readme":"https://ipinfo.io/missingauth"}', '2023-02-17 14:07:00.000');
INSERT INTO [attendance_list]([rowid], [attendance_id], [employee_id], [device_type], [att_type], [ip], [location], [json_data], [date_created]) VALUES(2, 2, 1, 'desktop', 'L_OUT', '197.99.70.23', '-26.1000,28.0556', '{"ip":"197.99.70.23","hostname":"197-99-70-23.ip.broadband.is","city":"Johannesburg","region":"Gauteng","country":"ZA","loc":"-26.1000,28.0556","org":"AS3741 Dimension Data","postal":"2191","timezone":"Africa/Johannesburg","readme":"https://ipinfo.io/missingauth"}', '2023-02-17 14:08:00.000');
INSERT INTO [attendance_list]([rowid], [attendance_id], [employee_id], [device_type], [att_type], [ip], [location], [json_data], [date_created]) VALUES(3, 3, 1, 'desktop', 'L_IN', '197.99.70.23', '-26.1000,28.0556', '{"ip":"197.99.70.23","hostname":"197-99-70-23.ip.broadband.is","city":"Johannesburg","region":"Gauteng","country":"ZA","loc":"-26.1000,28.0556","org":"AS3741 Dimension Data","postal":"2191","timezone":"Africa/Johannesburg","readme":"https://ipinfo.io/missingauth"}', '2023-02-17 14:08:00.000');
INSERT INTO [attendance_list]([rowid], [attendance_id], [employee_id], [device_type], [att_type], [ip], [location], [json_data], [date_created]) VALUES(4, 4, 1, 'desktop', 'OUT', '197.99.70.23', '-26.1000,28.0556', '{"ip":"197.99.70.23","hostname":"197-99-70-23.ip.broadband.is","city":"Johannesburg","region":"Gauteng","country":"ZA","loc":"-26.1000,28.0556","org":"AS3741 Dimension Data","postal":"2191","timezone":"Africa/Johannesburg","readme":"https://ipinfo.io/missingauth"}', '2023-02-17 14:08:00.000');

/* Commit transaction */
COMMIT;

/* Enable foreign keys */
PRAGMA foreign_keys = 'on';
