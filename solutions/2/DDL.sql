-- NOTES
-- SERIAL = INT auto_increment


DROP TABLE IF EXISTS public.role_user;
DROP TABLE IF EXISTS public.roles;
DROP TABLE IF EXISTS public.user_contacts;
DROP TABLE IF EXISTS public.user_address;
DROP TABLE IF EXISTS public.user_relations;
DROP TABLE IF EXISTS public.meeting_invitations;
DROP TABLE IF EXISTS public.meetings;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.relation_type;
DROP TABLE IF EXISTS public.attachments;
DROP TABLE IF EXISTS public.user_status;


CREATE TABLE public.user_status (
    user_status_id    BIGSERIAL PRIMARY KEY,
    status            VARCHAR(30) NOT NULL
);


CREATE TABLE public.relation_type (
    relation_type_id  BIGSERIAL PRIMARY KEY,
    relation_type     VARCHAR(30)
);


CREATE TABLE public.attachments (
    attachment_id     BIGSERIAL PRIMARY KEY,
    location          VARCHAR(250) NOT NULL, -- location on hard disc
    mimetype          VARCHAR(50) NOT NULL,
    modification_date timestamp NOT NULL
);


CREATE TABLE public.users (
    user_id           BIGSERIAL PRIMARY KEY,
    given_name        VARCHAR(100) NOT NULL,
    family_name       VARCHAR(100) NOT NULL,
    email             VARCHAR(100) NOT NULL,
    status_id         BIGINT,
    attachment_id     BIGINT,

    CONSTRAINT fk_attachment FOREIGN KEY (attachment_id) REFERENCES public.attachments(attachment_id) ON DELETE SET NULL,
    CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES public.user_status(user_status_id) ON DELETE SET NULL
);


CREATE TABLE public.user_address (
    user_address_id   BIGSERIAL PRIMARY KEY,
    user_id           BIGINT NOT NULL,

    zip_code          VARCHAR(5) NOT NULL,
    street            VARCHAR(50) NOT NULL,
    house_number      NUMERIC(5) NOT NULL,
    city              VARCHAR(30) NOT NULL,

    CONSTRAINT fk_user    FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE
);

CREATE TABLE public.user_contacts (
    user_contact_id   BIGSERIAL PRIMARY KEY,
    user_id           BIGINT NOT NULL,

    mobile            VARCHAR(12),
    twitter           VARCHAR(40),
    webpage           VARCHAR(80),

    CONSTRAINT fk_user    FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE
);


CREATE TABLE public.user_relations (
    user1_id          BIGINT NOT NULL,
    user2_id          BIGINT NOT NULL,
    relation_id       BIGINT,

    CONSTRAINT fk_user1 FOREIGN KEY (user1_id) REFERENCES public.users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_user2 FOREIGN KEY (user2_id) REFERENCES public.users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_relation FOREIGN KEY (relation_id) REFERENCES public.relation_type(relation_type_id) ON DELETE SET NULL
);

CREATE TABLE public.roles (
    role_id            BIGSERIAL PRIMARY KEY,
    role_name          VARCHAR(25) NOT NULL
);

CREATE TABLE public.role_user (
    role_id            BIGINT NOT NULL,
    user_id            BIGINT NOT NULL,

    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users (user_id) ON DELETE CASCADE,
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES public.roles (role_id) ON DELETE CASCADE
);


-- MEETINGS

CREATE TABLE public.meetings (
    meeting_id        SERIAL PRIMARY KEY,
    organizer_id      BIGINT NOT NULL,
    note              VARCHAR(100),
    description       TEXT,
    location          VARCHAR(75) NOT NULL,
    start_date        TIME NOT NULL,
    end_date          TIME NOT NULL,

    CONSTRAINT fk_user FOREIGN KEY (organizer_id) references public.users(user_id) ON DELETE CASCADE
);

CREATE TABLE public.meeting_invitations (
    meeting_id        BIGINT NOT NULL,
    user_id           BIGINT NOT NULL,

    CONSTRAINT fk_meeting FOREIGN KEY (meeting_id) REFERENCES public.meetings(meeting_id) ON DELETE CASCADE,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE
);