-- Anna Khytrych

-- mixed view for monitoring the activity of memberships of fitness-center memberships. It tracks only active memberships
CREATE OR REPLACE VIEW fitness_center.view_active_members AS
SELECT m.first_name, m.last_name, m.phone, s.start_date, s.end_date
FROM fitness_center.members m
JOIN fitness_center.member_subscriptions s ON m.member_id = s.member_id
WHERE s.is_active = TRUE;

-- join view  for progress monitoring by first name and last name. For easy perseption of date
CREATE OR REPLACE VIEW fitness_center.view_member_progress AS
SELECT m.first_name, m.last_name, p.weight_kg, p.muscle_mass, p.report_date
FROM fitness_center.progress_reports p
JOIN fitness_center.members m ON p.member_id = m.member_id;

-- view to combine all visits and define them by group, personal and general gym visits.This view for future. For simplified understanding of gym administration, which type and time of trainings are more or less popular.
CREATE OR REPLACE VIEW fitness_center.view_combined_attendance AS 
SELECT
  m.first_name, 
  m.last_name,
  a.attendance_date::date AS attendance_date,
  CASE 
    WHEN pt.attendance_id IS NOT NULL THEN pt.start_time
    WHEN gt.training_start IS NOT NULL THEN gt.training_start
    ELSE a.check_in
  END AS check_in,
  CASE 
    WHEN pt.attendance_id IS NOT NULL THEN pt.end_time
    WHEN gt.training_end IS NOT NULL THEN gt.training_end
    ELSE a.check_out
  END AS check_out,
  CASE 
    WHEN pt.attendance_id IS NOT NULL THEN 'personal'
    WHEN gt.training_start IS NOT NULL THEN 'group'
    ELSE 'general'
  END AS source
FROM fitness_center.attendance a 
LEFT JOIN fitness_center.personal_trainings pt 
  ON pt.attendance_id = a.attendance_id
LEFT JOIN fitness_center.group_training_member gtm 
  ON gtm.attendance_id = a.attendance_id
LEFT JOIN fitness_center.group_trainings gt 
  ON gtm.group_training_id = gt.group_training_id
LEFT JOIN fitness_center.members m 
  ON a.member_id = m.member_id
ORDER BY attendance_date DESC, check_in DESC;

-- horizontal view. View to get information about main contact info. Consist full name and phone
CREATE OR REPLACE VIEW fitness_center.view_member_contacts AS
SELECT
  member_id,
  first_name || ' ' || last_name AS full_name,
  phone
FROM fitness_center.members;

-- subquery view for members who visit fitness-center more than 3 times.
CREATE OR REPLACE VIEW fitness_center.view_top_visitors AS
SELECT m.member_id, m.first_name, m.last_name
FROM fitness_center.members m
WHERE m.member_id IN (
  SELECT member_id
  FROM fitness_center.attendance
  GROUP BY member_id
  HAVING COUNT(*) >= 3
);
