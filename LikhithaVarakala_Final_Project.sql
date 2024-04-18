create database ass5;
use ass5;

#PART2 
ALTER TABLE member
ADD PRIMARY KEY (member_id);

ALTER TABLE drug
ADD PRIMARY KEY (drug_ndc);

ALTER TABLE fact
ADD PRIMARY KEY (prescription_id);

ALTER TABLE fact
ADD FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE fact
ADD FOREIGN KEY (drug_ndc) REFERENCES drug(drug_ndc) ON DELETE CASCADE ON UPDATE CASCADE;

#PART-4
#1
SELECT drug_name, COUNT(*) AS num_prescriptions
FROM Drug
JOIN fact ON drug.drug_ndc = fact.drug_ndc
GROUP BY drug_name;

#2
SELECT 
    CASE 
        WHEN member.member_age >= 65 THEN 'Age 65+'
        ELSE '< 65'
    END AS age_group,
    COUNT(*) AS total_prescriptions,
    COUNT(DISTINCT member.member_id) AS unique_members,
    SUM(fact.copay) AS total_copay,
    SUM(fact.insurancepaid) AS total_insurance_paid
FROM fact
JOIN member ON fact.member_id = member.member_id
GROUP BY age_group;

#3
WITH RankedPrescriptions AS (
  SELECT
    m.member_id,
    m.member_first_name,
    m.member_last_name,
    d.drug_name,
    f.fill_date,
    f.insurancepaid,
    ROW_NUMBER() OVER (PARTITION BY m.member_id ORDER BY f.fill_date DESC) AS rn
  FROM
    FACT f
    JOIN MEMBER m ON f.member_id = m.member_id
    JOIN DRUG d ON f.drug_ndc = d.drug_ndc
)
SELECT
  member_id,
  member_first_name,
  member_last_name,
  drug_name,
  fill_date AS most_recent_fill_date,
  insurancepaid AS most_recent_insurance_paid
FROM
  RankedPrescriptions
WHERE
  rn = 1;


