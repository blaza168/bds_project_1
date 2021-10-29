-- Files stored in application
CREATE TABLE files (
                       id                  INT NOT NULL auto_increment PRIMARY KEY, -- PK
                       filename            VARCHAR(255) NOT NULL,   -- filename of file
                       mimetype            VARCHAR(255) NOT NULL    -- mimetype. image/jpg, img/png, word,excel, ...

) DEFAULT CHARACTER SET 'UTF8';

-- Files are stored in specific groups / subgroups. Category + category-key combination is identifier of image/images.
-- Used by angular to pull down specific file(s) inserted in specific part of application.
-- Not all files have identifications. It can look like breaking 3rd normal form, but reason of having it here is that
-- some images have
-- default file. So angular calls "I want file with <category> and <key>" and BE checks if this image exists in DB
-- and if not, it will check filesystem and returns file on HDD
-- Watch: https://gitlab.com/blaza168/crm-files/-/blob/master/src/main/java/com/crm/files/repository/impl/FileSystemDefaultImageRepository.java
-- and https://gitlab.com/blaza168/crm-files/-/blob/master/src/main/java/com/crm/files/service/impl/FileServiceImpl.java#L120
CREATE TABLE file_identifications (
                                      category            VARCHAR(100) NOT NULL, -- Category of image
                                      category_key        VARCHAR(100) NOT NULL, -- key in category
                                      file_id             INT NOT NULL, -- file FK

                                      CONSTRAINT fk_identification_file FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE,
                                      INDEX index_identifications (category, category_key)
) DEFAULT CHARACTER SET 'UTF8';
