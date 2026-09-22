-- Hospital Management System
-- Indexes for frequently joined / filtered columns

CREATE INDEX idx_appointments_patient
    ON appointments(patient_id);

CREATE INDEX idx_appointments_doctor
    ON appointments(doctor_id);

CREATE INDEX idx_appointments_date
    ON appointments(appointment_date);

CREATE INDEX idx_doctors_department
    ON doctors(department_id);
