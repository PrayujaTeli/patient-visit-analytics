# Patient Visit Analytics (SQL Project)

This project analyzes patient visits using structured SQL queries. It focuses on generating healthcare insights from multiple relational tables: Patient, Visit, Provider, and Claims data.

## 📁 Dataset Files
- `Patient - Patient.csv`: Contains patient demographics and DOB.
- `Visit - Sheet1.csv`: Records of patient visits, dates, and associated provider IDs.
- `provider - Sheet1.csv`: List of providers with specialty information.
- `claim - Sheet1.csv`: Contains claim amounts related to visits.
- `Patient_Visit_Summary_By_Date.sql`: SQL script to generate first and latest visit per patient.

---

## 🔍 Key Questions Answered

### 1. Patients Who Visited Cardiology in 2024
> "Which patients had at least one visit with a provider in the 'Cardiology' specialty in 2024?"

```sql
SELECT DISTINCT p.first_name, p.last_name
FROM PatientData p
JOIN Visit v ON p.patient_id = v.patient_id
JOIN Provider pr ON v.provider_id = pr.provider_id
WHERE pr.specialty = 'Cardiology'
  AND YEAR(v.visit_date) = 2024;
````

---

### 2. Provider Visit and Claim Totals

> "List each provider with total number of visits and total claim amount."

```sql
SELECT pr.provider_name,
       COUNT(v.visit_id) AS total_visits,
       SUM(c.claim_amount) AS total_claim_amount
FROM Provider pr
JOIN Visit v ON pr.provider_id = v.provider_id
JOIN Claim c ON v.visit_id = c.visit_id
GROUP BY pr.provider_name;
```

---

### 3. Visits on Patient's Birthday

> "Find any visits where the visit date matches the patient's birthday (same month and day)."

```sql
SELECT p.first_name, p.last_name, v.visit_date
FROM PatientData p
JOIN Visit v ON p.patient_id = v.patient_id
WHERE MONTH(v.visit_date) = MONTH(p.dob)
  AND DAY(v.visit_date) = DAY(p.dob);
```

---

### 4. Patient Visit Summary (First & Most Recent Visit)

> "For each patient, determine the date of their first-ever and most recent visit."

```sql
SELECT p.first_name, 
       MIN(v.visit_date) AS first_visit, 
       MAX(v.visit_date) AS latest_visit
FROM PatientData p
JOIN Visit v ON p.patient_id = v.patient_id
GROUP BY p.patient_id, p.first_name;
```

---

## 📌 How to Use

1. Import all `.csv` files into your SQL environment as tables.
2. Run the included SQL queries individually or use the `Patient_Visit_Summary_By_Date.sql` file.
3. Adjust date formats or table names based on your DBMS if needed.

---
