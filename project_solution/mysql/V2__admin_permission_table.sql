-- permissions for each role
CREATE TABLE role_permissions (
                                  role_id       INT NOT NULL, -- PK
                                  permission    VARCHAR(100) NOT NULL, -- permission name. Example: ARTICLE:EDIT
                                  CONSTRAINT index_role_permission UNIQUE NONCLUSTERED (role_id, permission),
                                  FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
) DEFAULT CHARACTER SET 'UTF8';
