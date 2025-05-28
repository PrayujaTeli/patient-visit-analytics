SELECT DISTINCT p.first_name + ' ' + p.last_name AS full_name 
from PatientData p
Join Visit v on p.patient_id = v.patient_id
Join Provider pr on v.provider_id = pr.provider_id
where pr.specialty = 'Cardiology' and YEAR(v.visit_date) = '2024'