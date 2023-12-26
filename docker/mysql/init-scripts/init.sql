DROP USER IF EXISTS 'mysql'@'%';
CREATE USER 'mysql'@'%' IDENTIFIED BY 'mysql';
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS source_db;
GRANT ALL PRIVILEGES ON source_db.* TO 'mysql'@'%';

USE source_db;

CREATE TABLE IF NOT EXISTS service (
    company_id INT,
    job_uuid TEXT,
    status_uuid TEXT,
    question TEXT,
    answer TEXT,
    synced_at TIMESTAMP,
    id INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO service (
    company_id, job_uuid, status_uuid, question, answer, synced_at
) VALUES (
    1, 'c1486c5a-a012-11ee-8c90-0242ac120002', '518f93a2-a017-11ee-8c90-0242ac120002', 'malfunctioning', '1', '2023-10-01 07:00:00'
);

INSERT INTO service (
    company_id, job_uuid, status_uuid, question, answer, synced_at
) VALUES (
    2, 'c1486c5a-a012-11ee-8c90-0242ac120002', '518f9802-a017-11ee-8c90-0242ac120002', 'malfunctioning', '1', '2023-10-01 09:00:00'
);

INSERT INTO service (
    company_id, job_uuid, status_uuid, question, answer, synced_at
) VALUES (
    3, 'c14874c0-a012-11ee-8c90-0242ac120002', '518f95b4-a017-11ee-8c90-0242ac120002', 'malfunctioning', '1', '2023-10-04 06:00:00'
);

INSERT INTO service (
    company_id, job_uuid, status_uuid, question, answer, synced_at
) VALUES (
    4, 'c1487696-a012-11ee-8c90-0242ac120002', '518f96ea-a017-11ee-8c90-0242ac120002', 'malfunctioning', '1', '2023-10-06 09:00:00'
);