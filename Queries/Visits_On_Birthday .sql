SELECT * 
FROM Visit v
JOIN PatientData p ON v.patient_id = p.patient_id
WHERE 
    EXTRACT(MONTH FROM v.visit_date) = EXTRACT(MONTH FROM p.date_of_birth) AND
    EXTRACT(DAY FROM v.visit_date) = EXTRACT(DAY FROM p.date_of_birth);
