

DROP DATABASE IF EXISTS fixpoint_lab;


CREATE DATABASE fixpoint_lab
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

DROP DATABASE fixpoint_lab;

USE fixpoint_lab;

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    full_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(255) NULL,
    phone       VARCHAR(20)  NULL,
    city        VARCHAR(100) NULL,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id),
    CONSTRAINT uq_customers_email UNIQUE (email)
    )ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;



CREATE TABLE devices (
    device_id     INT NOT NULL AUTO_INCREMENT,
    customer_id   INT NULL,
    brand         VARCHAR(50)  NOT NULL,
    model         VARCHAR(100) NOT NULL,
    serial_number VARCHAR(50)  NULL,
    created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (device_id),
    CONSTRAINT uq_devices_serial UNIQUE (serial_number),
    CONSTRAINT fk_devices_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE technicians (
    technician_id   INT NOT NULL AUTO_INCREMENT,
    technician_name VARCHAR(100) NOT NULL,
    email           VARCHAR(255) NOT NULL,
    specialty       VARCHAR(50) NULL,
    PRIMARY KEY (technician_id),
    CONSTRAINT uq_technicians_email UNIQUE (email)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE parts (
    part_id        INT NOT NULL AUTO_INCREMENT,
    part_name      VARCHAR(100) NOT NULL,
    unit_price_sek DECIMAL(10,2) NULL,
    PRIMARY KEY (part_id),
    CONSTRAINT uq_parts_name UNIQUE (part_name)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE repair_jobs (
    job_id            INT NOT NULL AUTO_INCREMENT,
    device_id         INT NOT NULL,
    technician_id     INT NULL,
    fault_description VARCHAR(255) NULL,
    status            VARCHAR(30) NULL DEFAULT 'Received',
    labor_cost_sek    DECIMAL(10,2) NULL,
    PRIMARY KEY (job_id),
    CONSTRAINT fk_repair_jobs_device
        FOREIGN KEY (device_id)
        REFERENCES devices(device_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_repair_jobs_technician
        FOREIGN KEY (technician_id)
        REFERENCES technicians(technician_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE job_parts (
    job_id   INT NOT NULL,
    part_id  INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (job_id, part_id),
    CONSTRAINT fk_job_parts_job
        FOREIGN KEY (job_id)
        REFERENCES repair_jobs(job_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_job_parts_part
        FOREIGN KEY (part_id)
        REFERENCES parts(part_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_job_parts_quantity CHECK (quantity > 0)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;



ALTER TABLE repair_jobs
    ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

    SELECT COUNT(*) AS total_customers FROM customers;