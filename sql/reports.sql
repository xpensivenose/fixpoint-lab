-- Report A: This shows every repair job in numeric order, with the customer,
-- the device and the technician.
-- Job 1017 is not here because it has no device, so we decided to exclude it.
-- LEFT JOIN is used on the customers table and the technicians table, because
-- one device has no owner (device 24) and some jobs have no technician assigned.

SELECT r.job_id, c.full_name AS customer, d.brand, d.model, t.technician_name AS technician
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


-- Report C: 