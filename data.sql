
CREATE DATABASE IF NOT EXISTS fixpoint_lab
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE fixpoint_lab;

INSERT INTO customers (customer_id, full_name, email, phone, city)
VALUES
(1,  'Emma Lind',       'emma_lind1@example.com',        '0703001137', 'Malmö'),
(2,  'Lukas Berg',      'lukas_berg2@example.com',       '0703002274', 'Jönköping'),
(3,  'Maja Sjöström',   'maja_sjostrom3@example.com',    '0703003411', 'Borås'),
(4,  'Oscar Nyström',   NULL,                            '0703004548', 'Skövde'),
(5,  'Ella Holm',       'ella_holm5@example.com',        '0703005685', 'Uppsala'),
(6,  'Ali Haddad',      'ali_haddad6@example.com',       '0703006822', 'Lund'),
(7,  'Sara Lundqvist',  'sara_lundqvist7@example.com',   NULL,         'Falköping'),
(8,  'Noah Andersson',  'noah_andersson8@example.com',   '0703009096', 'Göteborg'),
(9,  'Leila Farah',     'leila_farah9@example.com',      '0703010233', 'Stockholm'),
(10, 'Felix Lindberg',  'felix_lindberg10@example.com',  '0703011370', 'Malmö'),
(11, 'Clara Eklund',    'clara_eklund11@example.com',    '0703012507', 'Jönköping'),
(12, 'Samir Osman',     'samir_osman12@example.com',     '0703013644', 'Borås'),
(13, 'Hanna Åström',    NULL,                            '0703014781', 'Skövde'),
(14, 'Victor Nilsson',  'victor_nilsson14@example.com',  '0703015918', 'Uppsala'),
(15, 'Amina Saleh',     'amina_saleh15@example.com',     '0703017055', 'Lund'),
(16, 'Isak Dahl',       'isak_dahl16@example.com',       '0703018192', 'Falköping'),
(17, 'Nora Vik',        'nora_vik17@example.com',        '0703019329', 'Göteborg'),
(18, 'Simon Larsson',   'simon_larsson18@example.com',   '0703020466', 'Stockholm'),
(19, 'Lina Jansson',    'lina_jansson19@example.com',    NULL,         'Malmö'),
(20, 'David Ekström',   'david_ekstrom20@example.com',   '0703022740', 'Jönköping'),
(21, 'Alice Strand',    'alice_strand21@example.com',    '0703023877', 'Borås'),
(22, 'Omar Hussein',    NULL,                            '0703025014', 'Skövde'),
(23, 'Julia Rosén',     'julia_rosen23@example.com',     '0703026151', 'Uppsala'),
(24, 'Erik Wall',       'erik_wall24@example.com',       '0703027288', 'Lund'),
(25, 'Yasmin Ali',      'yasmin_ali25@example.com',      '0703028425', NULL);


INSERT INTO devices (device_id, customer_id, brand, model, serial_number)
VALUES
(1,  1,    'Apple',    'iPhone 13',      'FP-SN-0001'),
(2,  2,    'Samsung',  'Galaxy S22',     'FP-SN-0002'),
(3,  3,    'Lenovo',   'ThinkPad T14',   'FP-SN-0003'),
(4,  4,    'HP',       'EliteBook 840',  'FP-SN-0004'),
(5,  5,    'Apple',    'MacBook Air',    'FP-SN-0005'),
(6,  6,    'Dell',     'Latitude 5420',  'FP-SN-0006'),
(7,  7,    'Google',   'Pixel 7',        'FP-SN-0007'),
(8,  8,    'Samsung',  'Galaxy A54',     NULL),
(9,  9,    'Asus',     'ZenBook 14',     'FP-SN-0009'),
(10, 10,   'Acer',     'Swift 3',        'FP-SN-0010'),
(11, 11,   'Apple',    'iPad Air',       'FP-SN-0011'),
(12, 12,   'Motorola', 'Edge 40',        'FP-SN-0012'),
(13, 13,   'Sony',     'Xperia 5',       'FP-SN-0013'),
(14, 14,   'Lenovo',   'Yoga 7',         'FP-SN-0014'),
(15, 15,   'HP',       'Pavilion 15',    'FP-SN-0015'),
(16, 16,   'Apple',    'iPhone 12',      'FP-SN-0016'),
(17, 17,   'Samsung',  'Galaxy S21',     'FP-SN-0017'),
(18, 18,   'Dell',     'Inspiron 15',    'FP-SN-0018'),
(19, 19,   'Huawei',   'MatePad 11',     'FP-SN-0019'),
(20, 20,   'Asus',     'ROG Zephyrus',   'FP-SN-0020'),
(21, 21,   'Apple',    'MacBook Pro',    NULL),
(22, 22,   'Nokia',    'G60',            'FP-SN-0022'),
(23, 23,   'Lenovo',   'IdeaPad 5',      'FP-SN-0023'),
(24, NULL, 'Samsung',  'Tab S8',         'FP-SN-0024'),
(25, 25,   'Google',   'Pixel 8',        'FP-SN-0025');



INSERT INTO technicians (technician_id, technician_name, email, specialty) VALUES
(1,  'Amir Karlsson',   'amir_karlsson1@example.com',   'Phones'),
(2,  'Elin Persson',    'elin_persson2@example.com',    'Laptops'),
(3,  'Mikael Holm',     'mikael_holm3@example.com',     'Tablets'),
(4,  'Rania Farouk',    'rania_farouk4@example.com',    'Laptops'),
(5,  'David Svensson',  'david_svensson5@example.com',  'Phones'),
(6,  'Sofia Nyberg',    'sofia_nyberg6@example.com',    NULL),
(7,  'Elias Lund',      'elias_lund7@example.com',      'Phones'),
(8,  'Linda Bergström', 'linda_bergstrom8@example.com', 'Laptops'),
(9,  'Oskar Sjödin',    'oskar_sjodin9@example.com',    'Phones'),
(10, 'Nadine Karim',    'nadine_karim10@example.com',   'Laptops');


INSERT INTO parts (part_id, part_name, unit_price_sek) VALUES
(1,  'OLED screen',        1590),
(2,  'Battery unit',        490),
(3,  'USB charging port',   190),
(4,  'Keyboard module',     650),
(5,  'Cooling fan',         320),
(6,  'Speaker set',         240),
(7,  'Camera module',       420),
(8,  'SSD 512GB',           NULL),
(9,  'WiFi card',           230),
(10, 'Microphone module',   170),
(11, 'Touch panel',         820),
(12, 'Thermal adhesive',     90);


INSERT INTO repair_jobs
(job_id, device_id, technician_id, fault_description, status, labor_cost_sek)
VALUES
(1001, 4,  2,    'Screen cracked',             'Received',          350),
(1002, 11, 5,    'Battery drains quickly',     'Diagnosing',        423),
(1003, 18, 8,    'Keyboard keys not working',  'Waiting for parts', 496),
(1004, 25, 2,    'Does not start',             'In repair',         569),
(1005, 7,  5,    'Charging port damaged',      'Ready',             642),
(1006, 14, NULL, 'Speaker distorted',          'Collected',         715),
(1007, 21, 2,    'Overheating',                'Received',          788),
(1008, 3,  5,    NULL,                         'Diagnosing',        861),
(1009, 10, 8,    'Camera not focusing',        'Waiting for parts', 934),
(1010, 17, 2,    'Blue screen on startup',     'In repair',        1007),
(1011, 24, 5,    'Touch screen unresponsive',  'Ready',            1080),
(1012, 6,  8,    'Strange fan noise',          'Collected',        1153),
(1013, 13, 2,    'Charging slowly',            NULL,               1226),
(1014, 20, 5,    'USB port not working',       'Diagnosing',       1299),
(1015, 2,  8,    'Microphone not working',     'Waiting for parts',1372),
(1016, 9,  2,    'Screen cracked',             'In repair',        1445),
-- 1017 saknar device_id och importeras inte
(1018, 23, 8,    'Keyboard keys not working',  'Collected',         441),
(1019, 5,  2,    'Does not start',             'Received',          514),
(1020, 12, 5,    'Charging port damaged',      'Diagnosing',        587),
(1021, 19, 8,    'Speaker distorted',          'Waiting for parts', 660),
(1022, 1,  2,    'Overheating',                'In repair',         NULL),
(1023, 8,  5,    'WiFi not connecting',        'Ready',             806),
(1024, 15, 8,    'Camera not focusing',        'Collected',         879),
(1025, 22, 2,    'Blue screen on startup',     'Received',          952),
(1026, 4,  5,    'Touch screen unresponsive',  NULL,               1025),
(1027, 11, 8,    'Strange fan noise',          'Waiting for parts',1098),
(1028, 18, 2,    'Charging slowly',            'In repair',        1171),
(1029, 25, NULL, 'USB port not working',       'Ready',            1244),
(1030, 7,  8,    'Microphone not working',     'Collected',        1317),
(1031, 14, 2,    NULL,                         'Received',         1390),
(1032, 21, 5,    'Battery drains quickly',     'Diagnosing',       1463),
(1033, 3,  8,    'Keyboard keys not working',  'Waiting for parts', 386),
(1034, 10, 2,    'Does not start',             'In repair',         459),
(1035, 17, 5,    'Charging port damaged',      'Ready',             532);


INSERT INTO job_parts (job_id, part_id, quantity) VALUES
(1004, 2,  1),
(1015, 7,  1),
(1003, 1,  1),
(1014, 6,  1),
(1002, 11, 1),
(1013, 5,  1),
(1001, 10, 1),
(1012, 4,  2),
(1023, 9,  1),
(1011, 3,  1),
(1022, 8,  1),
(1010, 2,  2),
(1021, 7,  1),
(1009, 1,  1),
(1020, 6,  1),
(1008, 11, 1),
-- ! (1019, NULL, 1),    -- UNDANTAG: Saknar part_id i rådata. Går ej att koppla till reservdel.

(1007, 10, 1),
(1018, 4,  1),
(1006, 9,  1),
-- ! (1017, 3, 1),       -- UNDANTAG: Ärende 1017 finns inte (saknade device_id i repair_jobs)
(1005, 8,  1),
(1016, 2,  1),
(1004, 7,  1),
(1015, 1,  1),
(1003, 6,  2),
-- ! (1014, 11, NULL),   -- UNDANTAG: Saknar quantity i rådata. Vi gissar inte antalet
(1002, 5,  1),
(1013, 10, 1),
(1001, 4,  1),
(1012, 9,  1),
(1023, 3,  1),
(1011, 8,  1);
