ALTER TABLE establishments ADD COLUMN position INT NOT NULL DEFAULT 0;
UPDATE establishments SET position = id WHERE position = 0;