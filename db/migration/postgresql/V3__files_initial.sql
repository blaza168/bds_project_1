CREATE TABLE files (
                       id                  SERIAL PRIMARY KEY,
                       filename            VARCHAR(255) NOT NULL,
                       mimetype            VARCHAR(255) NOT NULL

);

CREATE TABLE file_identifications (
                                      category            VARCHAR(100) NOT NULL,
                                      category_key        VARCHAR(100) NOT NULL,
                                      file_id             INT NOT NULL,

                                      CONSTRAINT fk_identification_file FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE
);
