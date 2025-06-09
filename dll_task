INSERT INTO fitness_center.members (first_name, last_name, phone, email) VALUES
('Anna', 'Khytrych', '984531234', 'a.k@ukr.net'),
('Oleksandr', 'Yankovskiy', '678893245', 'o.yankovskiy@ukr.net'),
('Oleksii', 'Pavliuk', '685663245', 'o.pavliuk@ukr.net'),
('Ivan', 'Nosenko', '509876543', 'i.nosenko@ukr.net'),
('Olena', 'Bondarchuk', '671234567', 'o.bondarchuk@ukr.net'),
('Kateryna', 'Melnyk', '634484755', 'k.melnyk@ukr.net'),
('Dmytro', 'Shevchenko', '678845365', 'd.shevchenko@ukr.net'),
('Viktor', 'Nazarenko', '638493295', 'v.nazarenko@ukr.net'),
('Maria', 'Bila', '975643721', 'm.bila@gmail.com'),
('Vlad', 'Levchuk', '931001122', 'v.levchuk@gmail.com'),
('Roman', 'Mazur', '673214567', 'r.mazur@gmail.com'),
('Vitaliy', 'Dorosh', '684445566', 'v.dorosh@gmail.com'),
('Bohdan', 'Ostropilets', '639991122', 'b.ostropilets@gmail.com'),
('Oleksandr', 'Verovchuk', '993333444', 'o.verovchuk@gmail.com'),
('Olena', 'Tarasiuk', '931231122', 'o.tarasiuk@gmail.com'),
('Tanya', 'Rudenko', '686667788', 't.rudenko@gmail.com'),
('Yaan', 'Gladyshchuk', '993335544', 'y.gladyshchuk@gmail.com'),
('Olha', 'Bilous', '681234563', 'o.bilous@gmail.com'),
('Mykola', 'Zhuk', '681405678', 'm.zhuko@ukr.net'),
('Maria', 'Bronytska', '631453412', 'm.bronytska@gmail.com'),
('Viktor', 'Kolesnik', '631234123', 'v.kolesnik@gmail.com');

UPDATE fitness_center.members
SET phone = '993335567'
WHERE email = 'o.tarasiuk@gmail.com';

UPDATE fitness_center.members
SET email = 'a.khytrych@ukr.net'
WHERE phone = '984531234';

INSERT INTO fitness_center.memberships (type_name, duration, price) VALUES
('monthly gym', 30, 500.00),
('monthly group', 30, 1000.00),
('quarterly gym', 90, 1300.00),
('quarterly group', 90, 2600.00),
('semi-annual gym', 180, 2700.00),
('semi-annual group', 180, 5500.00),
('yearly gym', 365, 5500.00),
('yearly group', 365, 11000.00),
('single visit', 1, 250.00),
('student monthly gym', 30, 350.00),
('student monthly group', 30, 800.00),
('premium gym+group monthly', 30, 1300.00),
('unlimited access', 365, 15000.00),
('personal training', 1, 400.00);

UPDATE fitness_center.memberships
SET price = 1350.00
WHERE type_name = 'quarterly gym';

INSERT INTO fitness_center.member_subscriptions (member_id, membership_id, start_date, end_date, is_active) VALUES
(3, 8, '2024-07-01', '2025-06-30', FALSE),  
(5, 5, '2025-01-01', '2025-06-29', FALSE), 
(2, 6, '2025-02-15', '2025-08-13', TRUE),  
(4, 3, '2025-03-01', '2025-05-30', FALSE),
(19, 4, '2025-04-01', '2025-06-30', TRUE),
(1, 1, '2025-05-01', '2025-05-31', TRUE),
(5, 2, '2025-05-10', '2025-06-09', TRUE),
(6, 7, '2025-06-01', '2026-05-31', TRUE),    
(10, 10, '2025-06-01', '2025-06-30', TRUE),  
(13, 11, '2025-06-01', '2025-06-30', TRUE),   
(16, 12, '2025-06-01', '2025-06-30', TRUE),   
(8, 13, '2025-06-12', '2025-06-12', TRUE),    
(20, 9, '2025-06-20', '2025-06-20', TRUE); 

UPDATE fitness_center.member_subscriptions
SET is_active = FALSE
WHERE member_subscriptions_id = 4; 

UPDATE fitness_center.member_subscriptions
SET membership_id = 6
WHERE member_subscriptions_id = 3;

INSERT INTO fitness_center.freezes (member_subscriptions_id, duration_days, is_active) VALUES
(1, 7, TRUE),
(2, 7, TRUE),
(4, 5, TRUE),
(5, 7, FALSE),
(6, 4, TRUE),
(7, 4, TRUE),
(8, 3, TRUE),
(9, 7, FALSE),
(10, 5, TRUE),
(2, 7, TRUE);

UPDATE fitness_center.freezes
SET is_active = FALSE
WHERE freeze_id = 2;

DELETE FROM fitness_center.freezes
WHERE is_active = FALSE;

INSERT INTO fitness_center.attendance (member_id, attendance_date, check_in, check_out) VALUES
(1, '2025-05-01', '07:45:00', '09:00:00'),
(1, '2025-05-01', '18:10:00', '19:30:00'),
(6, '2025-05-01', '18:10:00', '19:30:00'),
(2, '2025-05-01', '18:10:00', '19:30:00'),
(3, '2025-05-02', '06:50:00', '08:15:00'),
(4, '2025-05-02', '17:00:00', '18:20:00'),
(5, '2025-05-03', '09:10:00', '10:30:00'),
(6, '2025-05-03', '20:15:00', '21:30:00'),
(7, '2025-05-04', '07:30:00', '08:45:00'),
(8, '2025-05-04', '19:00:00', '20:15:00'),
(9, '2025-05-05', '06:00:00', '07:20:00'),
(10, '2025-05-05', '21:00:00', '22:15:00'),
(11, '2025-05-06', '08:00:00', '09:10:00'),
(14, '2025-05-06', '08:00:00', '09:10:00'),
(16, '2025-05-06', '08:00:00', '09:10:00'),
(12, '2025-05-06', '16:45:00', '18:00:00'),
(13, '2025-05-07', '10:30:00', '11:45:00'),
(14, '2025-05-07', '19:20:00', '20:35:00'),
(15, '2025-05-08', '07:15:00', '08:25:00'),
(16, '2025-05-08', '20:00:00', '21:10:00'),
(17, '2025-05-09', '05:45:00', '07:00:00'),
(18, '2025-05-09', '22:10:00', '23:30:00'),
(19, '2025-05-10', '09:50:00', '11:05:00'),
(20, '2025-05-10', '14:30:00', '15:40:00'),
(1, '2025-05-11', '08:05:00', '09:20:00'),
(2, '2025-05-11', '17:35:00', '18:45:00'),
(3, '2025-05-12', '06:30:00', '07:45:00'),
(4, '2025-05-12', '18:15:00', '19:30:00'),
(5, '2025-05-13', '09:00:00', '10:20:00'),
(6, '2025-05-13', '09:00:00', '10:20:00'),
(7,  '2025-05-13', '09:00:00', '10:20:00'),
(9, '2025-05-13', '09:00:00', '10:20:00'),
(10, '2025-05-15', '20:45:00', '21:55:00');
