CREATE TABLE employees (
                           id                SERIAL PRIMARY KEY NOT NULL,
                           first_name        VARCHAR(50)  NOT NULL,
                           last_name         VARCHAR(50)  NOT NULL,
                           route             VARCHAR(100) NOT NULL
);

CREATE TABLE establishments (
                                id                SERIAL PRIMARY KEY NOT NULL,
                                name              VARCHAR(50)  NOT NULL,
                                content           TEXT          NOT NULL, -- LIMIT 16,777,215 CHARS
                                route             VARCHAR(50)  NOT NULL,
                                CONSTRAINT  index_unique_route UNIQUE (route)
);

CREATE TABLE employee_establishments (
                                         employee_id       INT NOT NULL,
                                         establishment_id  INT NOT NULL,
                                         CONSTRAINT index_ids UNIQUE (employee_id, establishment_id),
                                         FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
                                         FOREIGN KEY (establishment_id) REFERENCES establishments(id) ON DELETE CASCADE
);
