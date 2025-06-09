-- Anna Khytrych

CREATE TABLE fitness_center.members (
  member_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone INTEGER NOT NULL UNIQUE,
  email VARCHAR(50) NOT NULL
);

CREATE TABLE fitness_center.memberships (
  membership_id SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL,
  duration SMALLINT NOT NULL,
  price DECIMAL(8,2)
);

CREATE TABLE fitness_center.member_subscriptions (
  member_subscriptions_id SERIAL PRIMARY KEY,
  member_id INTEGER NOT NULL,
  membership_id INTEGER NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE fitness_center.freezes (
  freeze_id SERIAL PRIMARY KEY,
  member_subscriptions_id INTEGER,
  duration_days SMALLINT DEFAULT 7 CHECK (duration_days > 0 AND duration_days <= 7),
  is_active BOOLEAN DEFAULT FALSE
);

CREATE TABLE fitness_center.attendance (
  attendance_id BIGSERIAL PRIMARY KEY,
  member_id BIGINT NOT NULL,
  attendance_date TIMESTAMP NOT NULL
);

ALTER TABLE fitness_center.attendance ADD FOREIGN KEY (member_id) REFERENCES fitness_center.members(member_id);
ALTER TABLE fitness_center.freezes ADD FOREIGN KEY (member_subscriptions_id) REFERENCES fitness_center.member_subscriptions(member_subscriptions_id);
ALTER TABLE fitness_center.member_subscriptions ADD FOREIGN KEY (member_id) REFERENCES fitness_center.members(member_id);
ALTER TABLE fitness_center.member_subscriptions ADD FOREIGN KEY (membership_id) REFERENCES fitness_center.memberships(membership_id);

-- add alter table for editing attendance table. For change type of attendance_date, also add cols for check_in and check_out of all fitness-center visitors

ALTER TABLE fitness_center.attendance ALTER COLUMN attendance_date TYPE DATE;
ALTER TABLE fitness_center.attendance ALTER COLUMN attendance_date SET DEFAULT CURRENT_DATE;
ALTER TABLE fitness_center.attendance ADD COLUMN check_in TIME NOT NULL, ADD COLUMN check_out TIME NOT NULL;

-- for available filtering for attendance of specific user

CREATE INDEX idx_attendance_member
ON fitness_center.attendance(member_id);

-- for easy search of subscriptions of specific user

CREATE INDEX idx_subscriptions_member
ON fitness_center.member_subscriptions(member_id);
