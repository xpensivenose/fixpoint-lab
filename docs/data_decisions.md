## 1. Data questions

| #   | File | Record | Problems and how we handled it |
| --- | ---- | ------ | ------------------------------ |
| 1.| repair_jobs_raw.csv | job 1017 | The job has no device_id, so we don't know which device was repaired. We left this job out. A repair must belong to a device, so we'd ask the client which device it was. |
| 2.| repair_jobs_raw.csv | job 1012 | The customer name says "Maja S", but device 6 belongs to customer 6, Ali Haddad. The two files don't agree. We don't store customer_name in repair_jobs, so this conflict can't happen in our database. The customer is found through the device instead. We kept the link via device_id and would ask the client who actually owns the device.|
| 3.| repair_jobs_raw.csv | jobs 1013, 1026 | The status is empty. We imported them with status empty. We don't want to guess how far the repair has come. |
| 4.| devices_raw.csv | device 24 | The device has no customer_id, so we don't know who owns it. We imported it with customer_id empty (NULL). Job 1011 belongs to this device, and we didn't want to lose that job. The owner needs to be checked with the client. |
| 5.| job_parts_raw.csv | job 1019 | The row has no part_id or part name, so we can't tell which part was used. We left this row out. Guessing the part could give the wrong result, so we'd ask the client which part it was. |
| 6.| job_parts_raw.csv | job 1017, part 3 | The row belongs to job 1017, which we didn't import because it has no device. We left this row out too. A part can't be linked to a job that doesn't exist in the database, and MySQL would block it anyway because of the foreign key. |
| 7.| job_parts_raw.csv | job 1014, part 11 | The quantity is empty. We left this row out. An empty quantity doesn't mean 1, and we don't want to make up numbers the client never gave us. We'd ask them how many were used. |

## 2. Functional dependencies

A functional dependency means that if you know one value, you
automatically know another. For example, if you know a customer's ID,
you can look up their name, email, phone number and city.

- customer_id → full_name, email, phone, city
- device_id → customer_id, brand, model, serial_number
- technician_id → technician_name, email, specialty
- part_id → part_name, unit_price_sek
- job_id → device_id, technician_id, fault_description, status, labor_cost_sek
- (job_id, part_id) → quantity

The last one works differently. Knowing just the job isn't enough to know
the quantity, because a job can use several different parts. And just knowing
the part isn't enough either, because the same part can be used in many jobs.
So we need both together, because the quantity always describes one particular
part in one particular job.

## 3. Normalization

Normalization is about dividing the data into the right tables, so that
every piece of information is only stored in one place. We used three
steps, 1NF, 2NF and 3NF.

**1NF – one value per cell.**
Every column should only hold a single value, so not a list. A repair job can use several parts, so instead of listing them in one cell, each part gets its own row in job_parts.

**2NF – everything depends on the whole key.**
job_parts is the only table where the key is made up of two columns (job_id, part_id). And in job_parts_raw.csv, part_name was written on every row so "Battery unit" showed up three times. But the part_name only depends on part_id. It does not have anything to do with which job the part was used in.
So we stored it once in parts, and removed part_name from job_parts.

**3NF – no information that can be found through another column**
In repair_jobs_raw.csv, every job had the customer's name and the
device brand. But these can be found through the device. So the job points to a device, and the device points to the customer and has the brand. So we removed them from the repair_jobs.

Job 1012 shows why this matters. The raw file says the customer is "Maja S",
but device 6 actually belongs to Ali Haddad. In our database the customer's
name is only stored in customers, so the same information can't be stored
in two places and end up saying different things.

## 4. Key choices

**Primary keys**
Every table uses the ID that was already in the CSV files as its primary key,
for example customer_id and job_id. That way the IDs stay the same as in the
client's old files.

**job_parts has two columns as its key**
job_parts connects jobs and parts, because a job can use many parts and a part
can be used in many jobs. Its key is the pair (job_id, part_id), which means
the same part can't be added twice to the same job.

**technician_id can be NULL**
A new job might not have a technician yet, so we allow it to be NULL.
That way the job can still be saved while it waits to be assigned.

**status starts as "Received"**
If a new job is added without a status, it automatically gets "Received", since that's where every repair starts.

**ON DELETE CASCADE (job_parts → repair_jobs)**
If a job is deleted, its part rows have no meaning and are deleted too.

**ON DELETE RESTRICT (job_parts → parts, repair_jobs → devices,devices → customers)**
A part or device that is in use cannot be deleted by mistake.
And a customer who still has devices in the system cannot be deleted.

**ON DELETE SET NULL (repair_jobs → technicians)**
If a technician leaves, the job stays but becomes unassigned.

**ON UPDATE CASCADE**
If an ID changes, all references follow automatically.

**Email is unique, phone is not**
Two customers can't share the same email address. But two people in the
same family might share a phone number, so we don't require phone to be unique.
