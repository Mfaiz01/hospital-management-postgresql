-- Hospital Management System
-- Reusable reporting views

CREATE OR REPLACE VIEW appointment_details AS
SELECT
    a.appointment_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    d.doctor_name,
    d.specialization,
    dep.department_name,
    a.appointment_date,
    a.status,
    a.reason
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dep
    ON d.department_id = dep.department_id;

-- Example:
-- SELECT * FROM appointment_details;
