CREATE TABLE establishment_subpages (
                                        id                      SERIAL NOT NULL PRIMARY KEY,
                                        establishment_id        INT NOT NULL,
                                        route                   VARCHAR(50) NOT NULL, -- url route of subpage
                                        content                 TEXT NOT NULL, -- content of subpage
                                        name                    VARCHAR(50) NOT NULL, -- name of subpage (title)

                                        FOREIGN KEY (establishment_id) REFERENCES establishments(id) ON DELETE CASCADE
);

ALTER TABLE establishments DROP COLUMN content; -- content moved to subpages
