-- ========== TESTDATA ==========

-- Roller
INSERT INTO roles (role_name) VALUES
('ADMIN'), ('PROJEKTLEDER'), ('MEDARBEJDER');

-- Brugere (med hashed adgangskoder + nye felter)
INSERT INTO users (username, email, password, role_id, last_login, is_active) VALUES
('admin', 'admin@example.com',
'$2a$10$SMHANoSd/3je9FeY7uEFkuXMdEEpegi745iiufQjo5piYi9ohEQ3W',
 1, '2025-05-21 08:00:00', TRUE),
('marcus', 'marcus@firma.dk',
'$2a$10$DCpiidKn5AqJCcQG3RlokeZN1UegrHb1gbqYruVgisNj6OJdHNWWW', 2, NULL, TRUE),
('najib', 'najib@firma.dk',
'$2a$10$lwJ26Zp9fytdc/bXmvs6bugcxBThP6iEOW7CCSMcKeGUe72F7oSdq', 3, NULL, TRUE);


-- Projekter
INSERT INTO projects (name, description, start_date, end_date, created_by) VALUES
('Testprojekt A', 'Et testprojekt med underprojekter',
'2025-05-01', '2025-06-01', 1),
('Testprojekt B', 'Et simpelt testprojekt',
'2025-05-10', '2025-06-15', 2);

-- Tildelinger
INSERT INTO project_assignments (user_id, project_id, project_role) VALUES
(2, 1, 'Projektleder'),
(3, 1, 'Udvikler');

-- Underprojekter
INSERT INTO sub_projects (project_id, name, description, start_date, end_date, price) VALUES
(1, 'Designfase', 'Skab layout og UI',
'2025-05-01', '2025-05-10', 0.00),
(1, 'Udviklingsfase', 'Implementér backend og frontend',
'2025-05-11', '2025-06-01',0.00);

-- Tasks
INSERT INTO tasks (sub_project_id, name, description, assigned_to, status, due_date, price, estimated_hours,
                   hourly_rate) VALUES
(1, 'Sketch mockups', 'Lav wireframes til layout',
3, 'I gang', '2025-05-03', 1000.00, 10.0, 100.0),
(1, 'UI Review', 'Få feedback på design',
3, 'Afventer', '2025-05-05', 400.00, 5.0, 80.0);
