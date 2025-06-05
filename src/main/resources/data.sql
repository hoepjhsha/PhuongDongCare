-- data.sql

-- WARNING: Passwords are stored in plain text for demonstration purposes.
-- IN A PRODUCTION ENVIRONMENT, YOU MUST HASH PASSWORDS.

-- Insert data for doctors table
-- Assuming IDs auto-increment starting from 1
INSERT INTO doctors (username, email, password, specialization) VALUES
                                                                    ('bs.quang', 'quang.bs@clinic.com', 'password123', 'Cardiology'),
                                                                    ('bs.lien', 'lien.bs@clinic.com', 'password123', 'Neurology'),
                                                                    ('bs.minh', 'minh.bs@clinic.com', 'password123', 'General Practice');

-- Insert data for users (patients) table
-- Assuming IDs auto-increment starting from 1
INSERT INTO users (full_name, email, password, age, phone, address, gender, dob) VALUES
                                                                                     ('Nguyen Thi Mai', 'mai.nt@example.com', 'userpass', 30, '0901112220', '123 Flower Street, District 1', 'Female', '1995-06-15'),
                                                                                     ('Tran Van Hung', 'hung.tv@example.com', 'userpass', 45, '0903334440', '456 Construction Road, District 3', 'Male', '1980-03-20'),
                                                                                     ('Le Bao An', 'an.lb@example.com', 'userpass', 28, '0905556660', '789 Fun Lane, District 5', 'Male', '1997-10-05');

-- Insert data for appointments table
-- Assuming doctor_id and user_id reference the IDs created above.
-- e.g., bs.quang (ID=1), bs.lien (ID=2), bs.minh (ID=3)
-- Nguyen Thi Mai (ID=1), Tran Van Hung (ID=2), Le Bao An (ID=3)

INSERT INTO appointments (doctor_id, user_id, date, time, status, price) VALUES
                                                                             (1, 1, '2025-07-10', '10:00:00', 'SCHEDULED', 150.00),        -- Mai with BS.Quang (Appointment ID will be 1)
                                                                             (2, 2, '2025-05-20', '14:30:00', 'COMPLETED', 200.00),       -- Hung with BS.Lien (Appointment ID will be 2)
                                                                             (2, 1, '2025-08-01', '11:00:00', 'SCHEDULED', 200.00),       -- Mai with BS.Lien (Appointment ID will be 3)
                                                                             (1, 3, '2025-04-15', '09:00:00', 'COMPLETED', 120.00),       -- An with BS.Quang (Appointment ID will be 4)
                                                                             (3, 2, '2025-07-15', '16:00:00', 'SCHEDULED_ONLINE', 100.00); -- Hung with BS.Minh (Appointment ID will be 5)


-- Insert data for consultations table
-- Assuming appointment_id, doctor_id, user_id reference the IDs created above
-- Consultation for Appointment ID 2 (Hung with BS.Lien)
INSERT INTO consultations (appointment_id, doctor_id, user_id, notes, price, diagnosis, prescription, payment_status, payment_date, payment_method, consultation_date) VALUES
    (2, 2, 2, 'Patient reported dizziness. BP normal. Advised hydration and rest.', 200.00, 'Mild Vertigo', 'Drink plenty of water, follow-up if symptoms worsen.', 'PAID', '2025-05-20 15:00:00', 'CASH', '2025-05-20 14:45:00');

-- Consultation for Appointment ID 4 (An with BS.Quang)
INSERT INTO consultations (appointment_id, doctor_id, user_id, notes, price, diagnosis, prescription, payment_status, payment_date, payment_method, consultation_date) VALUES
    (4, 1, 3, 'Routine check-up. Patient is healthy.', 120.00, 'Healthy', 'Continue healthy lifestyle. Annual check-up recommended.', 'UNPAID', NULL, NULL, '2025-04-15 09:15:00');

-- Consultation for Appointment ID 1 (Mai with BS.Quang), assuming recently completed and awaiting online payment
INSERT INTO consultations (appointment_id, doctor_id, user_id, notes, price, diagnosis, prescription, payment_status, consultation_date) VALUES
    (1, 1, 1, 'Initial consultation for heart health.', 150.00, 'Pending further tests', 'Schedule ECG and blood work.', 'UNPAID', '2025-07-10 10:15:00');