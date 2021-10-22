-- Explanation of chosen data type: I chosed these data types, because data stored in specific columns have this data type.

-- Table for user's role
CREATE TABLE roles (
                       role_id     INT NOT NULL auto_increment PRIMARY KEY, -- PK
                       role        VARCHAR(50) NOT NULL,        -- name of role
                       CONSTRAINT index_role UNIQUE CLUSTERED (role)
) DEFAULT CHARACTER SET 'UTF8';

INSERT INTO roles (role) VALUES ("admin");


-- Table for users of administration users
CREATE TABLE users (
                       username    VARCHAR(50)  NOT NULL PRIMARY KEY,  -- PK, username
                       hash        BINARY(32), -- password hash.
                       salt        BINARY(16), -- password salt
                       first_name  VARCHAR(60)  NOT NULL, -- first name
                       last_name   VARCHAR(60)  NOT NULL, -- last name
                       route       VARCHAR(120) NOT NULL, -- URL route. HTTP GET url parameter
                       CONSTRAINT index_first_last_name UNIQUE NONCLUSTERED (first_name, last_name),
                       CONSTRAINT index_route UNIQUE ROUTE (route),
                       INDEX index_route (route)
) DEFAULT CHARACTER SET 'UTF8';

INSERT INTO `users` (`username`, `hash`, `salt`, `first_name`, `last_name`, `route`) VALUES
('admin', 0xC9904D4A605BEA174F3B7E3452A1F2AF8DD73A34C1234BB1DA648DA8649ACEFF, 0x01A91DD5921E93BA6D99BEC72F693A5F, 'I', 'DontLike', 'Projects');

-- M:M joining table for users-roles
CREATE TABLE user_roles (
                            username       VARCHAR(50) NOT NULL, -- user's FK
                            role_id        INT NOT NULL, -- role FK
                            FOREIGN KEY (role_id) REFERENCES roles(role_id),
                            FOREIGN KEY (username) REFERENCES users(username)
) DEFAULT CHARACTER SET 'UTF8';


INSERT INTO user_roles (username, role_id) VALUES ("admin", 1);
