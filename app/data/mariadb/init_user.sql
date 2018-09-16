CREATE USER IF NOT EXISTS 'report'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON `survey_report`.* TO 'report'@'localhost';

CREATE USER IF NOT EXISTS 'report'@'%' IDENTIFIED BY '123456';
GRANT ALL ON `survey_report`.* TO 'report'@'%';
