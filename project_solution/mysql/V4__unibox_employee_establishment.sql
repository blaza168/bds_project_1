-- Table for employees
CREATE TABLE employees (
                           id                INT auto_increment PRIMARY KEY NOT NULL, -- PK
                           first_name        VARCHAR(50)  NOT NULL, -- first name
                           last_name         VARCHAR(50)  NOT NULL, -- last name
                           route             VARCHAR(100) NOT NULL, -- route. HTTP GER url parameter
                           INDEX index_route (route),
                           CONSTRAINT  index_unique_route UNIQUE unq_route (route)
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';

-- Establishments
CREATE TABLE establishments (
                                id                INT auto_increment PRIMARY KEY NOT NULL, -- PK
                                name              VARCHAR(50)  NOT NULL, -- name
                                content           MEDIUMTEXT   NOT NULL, -- some text
                                route             VARCHAR(50)  NOT NULL, -- HTTP GET url parameter
                                INDEX index_route (route),
                                CONSTRAINT  index_unique_route UNIQUE unq_route (route)
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';


-- M:m employees - establishments
CREATE TABLE employee_establishments (
                                         employee_id       INT NOT NULL, -- FK employee
                                         establishment_id  INT NOT NULL, -- FK establoshment
                                         CONSTRAINT index_ids UNIQUE employee_establishment (employee_id, establishment_id),
                                         FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
                                         FOREIGN KEY (establishment_id) REFERENCES establishments(id) ON DELETE CASCADE
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';
