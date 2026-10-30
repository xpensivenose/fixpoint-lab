USE fixpoint_lab;

-- Report A: This shows every repair job in numeric order, with the customer,
-- the device and the technician.
-- Job 1017 is not here because it has no device, so we decided to exclude it.
-- LEFT JOIN is used on the customers table and the technicians table, because
-- one device has no owner (device 24) and some jobs have no technician assigned.

SELECT r.job_id, c.full_name AS customer, d.brand, d.model, 
t.technician_name AS technician
FROM repair_jobs AS r
    JOIN devices AS d ON r.device_id = d.device_id
    LEFT JOIN customers AS c ON d.customer_id = c.customer_id
    LEFT JOIN technicians AS t ON r.technician_id = t.technician_id
ORDER BY r.job_id ASC;

-- Report B: This shows how many repair jobs each technician has, with the
-- technician with the most jobs first.
-- LEFT JOIN is used so that all technicians are shown, even the ones with no jobs.
-- COUNT(r.job_id) only counts real jobs, so technicians with no jobs get 0.

SELECT t.technician_name AS technician, COUNT(r.job_id) AS job_count
FROM technicians AS t
    LEFT JOIN repair_jobs AS r ON t.technician_id = r.technician_id
    GROUP BY t.technician_id
    ORDER BY job_count DESC;

-- Report E: This shows the average labor cost for each technician rounded to two decimals 
-- LEFT JOIN is used so that all technicians are shown, even the ones with no jobs.
-- Technicians with no jobs show NULL instead of 0, because they have no jobs
-- to calculate an average from, and 0 would mean they worked for free.
-- AVG skips empty values, so a job like 1022 that missing labor cost doesn't affect the result.

SELECT t.technician_name AS technician, 
ROUND(AVG(r.labor_cost_sek), 2) AS average_cost
FROM technicians AS t
    LEFT JOIN repair_jobs AS r ON t.technician_id = r.technician_id
    GROUP BY t.technician_id 
    ORDER BY average_cost DESC;


-- TEST DATABASE
-- We add three test parts, update them and delete them again.
-- The client's real data is not changed.

SELECT * FROM parts;

INSERT INTO parts(part_name, unit_price_sek)
VALUES
('Infrared Camera', 1455),
('32gb RAM', 434),
('GeForce RTX 5060', 2344); 

SELECT * FROM parts;

UPDATE parts 
SET unit_price_sek = 912
WHERE part_name = 'Infrared Camera';

SELECT * FROM parts;

UPDATE parts
SET part_name = 'Corsair Vengeance DDR4 2x16gb RAM'
WHERE part_name = '32gb RAM';

SELECT * FROM parts;

UPDATE parts
SET unit_price_sek = 1122
WHERE part_name = 'GeForce RTX 5060';

SELECT * FROM parts;

DELETE FROM parts
WHERE part_name IN ('Infrared Camera', 'Corsair Vengeance DDR4 2x16gb RAM', 'GeForce RTX 5060');

SELECT * FROM parts;


-- INSERT INTO job_parts(job_id, part_id, quantity)
-- VALUES(1017, 3, 2);
-- A FOREIGN KEY is like a bridge between two tables, so if the FK points to
-- something that doesn't exist, the connection between the tables will not work.
-- This example we try to add a part to job 1017, but job 1017 doesn't exist in repair_jobs.
-- MySQL stops the row with an error, because the job_id FK in job_parts must
-- point to a job_id that is in repair_jobs. Otherwise we would have a part
-- connected to a job that doesn't exist.

-- INSERT INTO job_parts(job_id, part_id, quantity)
-- VALUES(1021, 7, 2);
-- If the same row is written twice in a table, the same data would be stored
-- in two places instead of one. It is wrong because we want to use and
-- change the right data, and we can only do that if there are no duplicates.
-- This example we try to add part 7 to job 1021 again, but that row already exists.
-- MySQL stops it with a error, because the primary key in
-- job_parts is the pair (job_id, part_id). The same part can only be connected
-- to the same job once. It doesn't matter that the quantity is different (2
-- instead of 1). If more parts are used, we should update the quantity on the
-- row that's already there, not add a new one.