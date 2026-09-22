-- Hospital Management System
-- Sample / seed data
-- Run after 01_schema.sql.

INSERT INTO departments (department_name, location, phone)
VALUES
    ('Cardiology', 'Block A', '0821-100001'),
    ('Neurology', 'Block B', '0821-100002'),
    ('Orthopedics', 'Block A', '0821-100003'),
    ('Pediatrics', 'Block C', '0821-100004'),
    ('General Medicine', 'Main Building', '0821-100005'),
    ('Emergency', 'Block D', '0821-100006'),
    ('Radiology', 'Block E', '0821-100009');

INSERT INTO doctors
    (doctor_name, specialization, email, phone, department_id, hire_date)
VALUES
    ('Dr. Ahmed Khan', 'Cardiologist', 'ahmed.khan@hospital.com', '9876500001', 1, '2022-06-15'),
    ('Dr. Priya Sharma', 'Cardiologist', 'priya.sharma@hospital.com', '9876500002', 1, '2021-08-20'),
    ('Dr. Rahul Verma', 'Neurologist', 'rahul.verma@hospital.com', '9876500003', 2, '2023-01-10'),
    ('Dr. Sara Ali', 'Neurologist', 'sara.ali@hospital.com', '9876500004', 2, '2020-11-05'),
    ('Dr. Arjun Rao', 'Orthopedic Surgeon', 'arjun.rao@hospital.com', '9876500005', 3, '2022-03-18'),
    ('Dr. Meera Nair', 'Pediatrician', 'meera.nair@hospital.com', '9876500006', 4, '2024-02-12'),
    ('Dr. Vikram Singh', 'General Physician', 'vikram.singh@hospital.com', '9876500007', 5, '2019-07-25'),
    ('Dr. Sameer Khan', 'Emergency Physician', 'sameer.khan@hospital.com', '9876500008', 6, '2023-09-01');

INSERT INTO patients
    (first_name, last_name, date_of_birth, gender, blood_group, phone, email, address)
VALUES
    ('Arjun', 'Kumar', '1995-04-12', 'Male', 'B+', '9876500011', 'arjun.kumar@email.com', 'Mysore'),
    ('Sneha', 'Rao', '1998-08-25', 'Female', 'O+', '9876500012', 'sneha.rao@email.com', 'Bangalore'),
    ('Rahul', 'Sharma', '1987-11-03', 'Male', 'A+', '9876500013', 'rahul.sharma@email.com', 'Mangalore'),
    ('Aisha', 'Khan', '2001-02-17', 'Female', 'AB+', '9876500014', 'aisha.khan@email.com', 'Mysore'),
    ('Vikram', 'Patel', '1979-06-30', 'Male', 'O-', '9876500015', 'vikram.patel@email.com', 'Bangalore');

INSERT INTO appointments
    (patient_id, doctor_id, appointment_date, reason, status, notes)
VALUES
    (1, 1, '2026-09-23 10:00:00', 'Chest pain and regular checkup', 'Scheduled', NULL),
    (2, 2, '2026-09-23 11:30:00', 'Heart consultation', 'Scheduled', NULL),
    (3, 3, '2026-09-23 14:00:00', 'Headache and dizziness', 'Completed', 'Follow-up required'),
    (4, 4, '2026-09-24 09:30:00', 'Migraine consultation', 'Scheduled', NULL),
    (5, 5, '2026-09-24 15:00:00', 'Knee pain', 'Completed', 'Physiotherapy recommended'),
    (1, 3, '2026-09-25 10:30:00', 'Neurological consultation', 'Scheduled', NULL),
    (2, 1, '2026-09-25 12:00:00', 'Cardiac follow-up', 'Cancelled', 'Patient requested cancellation'),
    (3, 8, '2026-09-26 16:00:00', 'Emergency consultation', 'Completed', 'Patient treated successfully');

INSERT INTO prescriptions
    (appointment_id, medicine_name, dosage, duration_days, instructions)
VALUES
    (3, 'Paracetamol', '500mg', 5, 'Take after meals'),
    (3, 'Betahistine', '16mg', 7, 'Take twice daily'),
    (5, 'Ibuprofen', '400mg', 5, 'Take after meals'),
    (5, 'Calcium Supplement', '500mg', 30, 'Take once daily'),
    (8, 'Omeprazole', '20mg', 7, 'Take before breakfast');

INSERT INTO bills
    (appointment_id, consultation_fee, medicine_fee, payment_status)
VALUES
    (1, 800, 250, 'Pending'),
    (2, 1000, 500, 'Paid'),
    (3, 700, 150, 'Pending'),
    (4, 900, 300, 'Paid'),
    (6, 600, 200, 'Paid'),
    (7, 500, 100, 'Paid');
