-- Allow set position of establishment in top menu
ALTER TABLE establishments ADD COLUMN position INT NOT NULL DEFAULT 0;
UPDATE establishments SET position = id WHERE position = 0;