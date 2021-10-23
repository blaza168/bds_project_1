-- Notes. Probably something in administration to keep things organized.
CREATE TABLE notes (
                       note_id     INT NOT NULL auto_increment PRIMARY KEY,
                       content     TEXT NOT NULL
) DEFAULT CHARACTER SET 'UTF8';