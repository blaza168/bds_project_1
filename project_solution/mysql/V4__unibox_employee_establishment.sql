CREATE TABLE employees (
                           id                INT auto_increment PRIMARY KEY NOT NULL,
                           first_name        VARCHAR(50)  NOT NULL,
                           last_name         VARCHAR(50)  NOT NULL,
                           route             VARCHAR(100) NOT NULL,
                           INDEX index_route (route),
                           CONSTRAINT  index_unique_route UNIQUE unq_route (route)
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';

CREATE TABLE establishments (
                                id                INT auto_increment PRIMARY KEY NOT NULL,
                                name              VARCHAR(50)  NOT NULL,
                                content           MEDIUMTEXT   NOT NULL, -- LIMIT 16,777,215 CHARS
                                route             VARCHAR(50)  NOT NULL,
                                INDEX index_route (route),
                                CONSTRAINT  index_unique_route UNIQUE unq_route (route)
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';

CREATE TABLE employee_establishments (
                                         employee_id       INT NOT NULL,
                                         establishment_id  INT NOT NULL,
                                         CONSTRAINT index_ids UNIQUE employee_establishment (employee_id, establishment_id),
                                         FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
                                         FOREIGN KEY (establishment_id) REFERENCES establishments(id) ON DELETE CASCADE
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';
