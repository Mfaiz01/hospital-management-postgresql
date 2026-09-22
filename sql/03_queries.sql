-- Hospital Management System
-- Reporting and SQL practice queries
-- Run after schema and seed data.

-- 1. All doctors with their departments
SELECT
    d.doctor_id,
    d.doctor_name,
    d.specialization,
    dep.department_name
FROM doctors d
INNER JOIN departments dep
    ON d.department_id = dep.department_id
ORDER BY d.doctor_id;

-- 2. All departments, including departments without doctors
SELECT
    dep.department_name,
    d.doctor_name
FROM departments dep
LEFT JOIN doctors d
    ON dep.department_id = d.department_id
ORDER BY dep.department_id;

-- 3. Doctors in the Neurology department
SELECT
    d.doctor_id,
    d.doctor_name,
    d.specialization,
    dep.department_name
FROM doctors d
JOIN departments dep
    ON d.department_id = dep.department_id
WHERE dep.department_name = 'Neurology';

-- 4. Departments with more than one doctor
SELECT
    dep.department_name,
    COUNT(d.doctor_id) AS doctor_count
FROM departments dep
LEFT JOIN doctors d
    ON dep.department_id = d.department_id
GROUP BY dep.department_id, dep.department_name
HAVING COUNT(d.doctor_id) > 1;

-- 5. Complete appointment report
SELECT
    a.appointment_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    d.doctor_name,
    dep.department_name,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dep
    ON d.department_id = dep.department_id
ORDER BY a.appointment_date;

-- 6. Doctor workload
SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
ORDER BY total_appointments DESC;

-- 7. Department statistics
SELECT
    dep.department_name,
    COUNT(DISTINCT d.doctor_id) AS doctor_count,
    COUNT(a.appointment_id) AS appointment_count
FROM departments dep
LEFT JOIN doctors d
    ON dep.department_id = d.department_id
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY dep.department_id, dep.department_name
ORDER BY appointment_count DESC;

-- 8. Appointment and billing report
SELECT
    a.appointment_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    d.doctor_name,
    dep.department_name,
    a.status,
    b.total_amount,
    b.payment_status
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dep
    ON d.department_id = dep.department_id
LEFT JOIN bills b
    ON a.appointment_id = b.appointment_id
ORDER BY a.appointment_id;
