CREATE DATABASE hospital_portal;
USE hospital_portal;
CREATE TABLE patients (
    patient_id INT NOT NULL AUTO_INCREMENT,
    patient_name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    admission_date DATE,
    discharge_date DATE,
    PRIMARY KEY (patient_id)
);
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
    );

INSERT INTO patients (patient_name, age, admission_date, discharge_date)
VALUES
    ('Maria Jozef', 67, '2023-10-01', '2023-10-07'),
	('Rogui Davis', 23, '2023-12-05', '2023-12-10'),
    ('Chris Wallace',15, '2023-12-29', '2023-12-13');
    
    
  CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR(45) NOT NULL,
    specialty VARCHAR(45) NOT NULL
);

INSERT INTO doctors (doctor_name, specialty) 
VALUES 
    ('Dr. Smith', 'Cardiology'),
    ('Dr. Johnson', 'Orthopedics'),
    ('Dr. Williams', 'Pediatrics'); 
    
CREATE VIEW doctor_appointment_view AS
SELECT
    a.appointment_id,
    p.patient_name,
    p.age,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time
FROM
    appointments a
JOIN
    patients p ON a.patient_id = p.patient_id
JOIN
    doctors d ON a.doctor_id = d.doctor_id;
SELECT * FROM doctor_appointment_view;
SELECT * FROM information_schema.views WHERE table_name = 'doctor_appointment_view';
SELECT * FROM doctor_appointment_view;
USE hospital_portal;
DROP VIEW IF EXISTS doctor_appointment_view;
CREATE VIEW doctor_appointment_view AS
SELECT
    a.appointment_id,
    p.patient_name,
    p.age,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time
FROM
    appointments a
JOIN
    patients p ON a.patient_id = p.patient_id
JOIN
    doctors d ON a.doctor_id = d.doctor_id;
SELECT * FROM hospital_portal.doctor_appointment_view;
SELECT * FROM doctor_appointment_view;
ALTER TABLE appointments
MODIFY COLUMN appointment_time TIME NOT NULL;
SELECT doctor_id, doctor_name FROM doctors;
SELECT * FROM hospital_portal.doctor_appointment_view;

DELETE FROM appointments;

INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time)
VALUES
    (1, 2, '2023-12-05', '10:00:00'),
    (2, 3, '2023-12-25', '14:30:00'),
    (3, 1, '2024-01-29', '11:45:00');

ALTER TABLE appointments AUTO_INCREMENT = 1;
SELECT * FROM hospital_portal.doctor_appointment_view;
SHOW TABLES;


delete from patients where patient_id > 3;

SELECT * FROM records;
CREATE VIEW record_view AS
SELECT
    appointment_id,
    appointment_date,
    appointment_time,
    patient_id,
    patient_name,
    age,
    admission_date,
    discharge_date,
    doctor_id,
    doctor_name,
    medical_field
FROM records;
