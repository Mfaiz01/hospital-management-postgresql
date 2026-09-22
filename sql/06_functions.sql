-- Hospital Management System
-- PostgreSQL function examples

CREATE OR REPLACE FUNCTION get_patient_appointment_count(
    p_patient_id INTEGER
)
RETURNS INTEGER
LANGUAGE SQL
AS $$
    SELECT COUNT(*)::INTEGER
    FROM appointments
    WHERE patient_id = p_patient_id;
$$;

-- Example:
-- SELECT get_patient_appointment_count(1);
