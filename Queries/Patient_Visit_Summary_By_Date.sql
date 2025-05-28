Select p.first_name, MIN(v.visit_date), MAX(v.visit_date)
from PatientData p
Join Visit v on p.patient_id = v.patient_id
Group BY p.patient_id, p.first_name