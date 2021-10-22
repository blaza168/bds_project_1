-- Files stored in application
CREATE TABLE files (
                       id                  INT NOT NULL auto_increment PRIMARY KEY, -- PK
                       filename            VARCHAR(255) NOT NULL,   -- filename of file
                       mimetype            VARCHAR(255) NOT NULL    -- mimetype. image/jpg, img/png, word,excel, ...

) DEFAULT CHARACTER SET 'UTF8';

-- Files are stored in specific groups / subgroups. Category + category-key combination is identifier of image/images.
CREATE TABLE file_identifications (
                                      category            VARCHAR(100) NOT NULL, -- Category of image
                                      category_key        VARCHAR(100) NOT NULL, -- key in category
                                      file_id             INT NOT NULL, -- file FK

                                      CONSTRAINT fk_identification_file FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE,
                                      INDEX index_identifications (category, category_key)
) DEFAULT CHARACTER SET 'UTF8';
