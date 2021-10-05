
-- DROP COLUMN
ALTER TABLE public.users DROP CONSTRAINT fk_status;
ALTER TABLE public.users DROP COLUMN status_id;
-- ADD COLUMN
ALTER TABLE public.users ADD COLUMN status VARCHAR(10) NOT NULL;

-- DROP user_status
DROP TABLE public.user_status;

