CREATE TABLE establishment_subpages (
                                        id                      INT NOT NULL PRIMARY KEY auto_increment,
                                        establishment_id        INT NOT NULL,
                                        route                   VARCHAR(50) NOT NULL, -- url route of subpage
                                        content                 MEDIUMTEXT NOT NULL, -- content of subpage
                                        name                    VARCHAR(50) NOT NULL, -- name of subpage (title)

                                        FOREIGN KEY (establishment_id) REFERENCES establishments(id) ON DELETE CASCADE
) CHARACTER SET 'UTF8mb4' COLLATE 'utf8mb4_unicode_ci';

ALTER TABLE establishments DROP COLUMN content; -- content moved to subpages
