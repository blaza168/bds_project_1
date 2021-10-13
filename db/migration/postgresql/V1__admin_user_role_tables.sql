CREATE TABLE roles (
                       role_id     SERIAL PRIMARY KEY,
                       role        VARCHAR(50) NOT NULL,
                       CONSTRAINT index_role UNIQUE (role)
);


CREATE TABLE users (
                       username    VARCHAR(50)  NOT NULL PRIMARY KEY,
                       hash        VARCHAR(100),
                       salt        VARCHAR(100),
                       first_name  VARCHAR(60)  NOT NULL,
                       last_name   VARCHAR(60)  NOT NULL,
                       route       VARCHAR(120) NOT NULL,
                       CONSTRAINT index_first_last_name UNIQUE (first_name, last_name),
                       CONSTRAINT index_route UNIQUE (route)
);

CREATE TABLE user_roles (
                            username       VARCHAR(50) NOT NULL,
                            role_id        INT NOT NULL,
                            FOREIGN KEY (role_id) REFERENCES roles(role_id),
                            FOREIGN KEY (username) REFERENCES users(username)
);
