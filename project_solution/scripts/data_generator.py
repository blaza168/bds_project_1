# roles + permissions

for i in range(51):
    print(f"INSERT INTO roles (role) VALUES ('admin{i}');")
    print(f"INSERT INTO role_permissions (role_id, permission) VALUES ({i + 1}, 'permission {i + 1}');")

# users + user_roles

for i in range(5):
    print("INSERT INTO users (username, hash, salt, first_name, last_name, route) VALUES " +
            f"('admin{i}', '0xC9904D4A605BEA174F3B7{i}3452A2F2AF8DD73A34C1234BB1BA648DA8649ACEFF', " +
            f"'0x01A91DD5922E93BA6B99BEC72F693A5F', 'I', 'DontLike{i}', 'Projects{i}');")

    print(f"INSERT INTO user_roles (username, role_id) VALUES ('admin{i}', {i + 1});")

# notes

for i in range(5):
    print(f"INSERT INTO notes (content) VALUES ('MESSAGE{i}');")

# files + file_identifications

for i in range(5):
    print(f"INSERT INTO files (filename, mimetype) VALUES ('file_{i}.jpeg', 'image/jpeg');")
    print(f"INSERT INTO file_identifications (category, category_key, file_id) VALUES ('category', 'key', {i + 1});")

# UNIBOX

for i in range(5):
    print(f"INSERT INTO employees (first_name, last_name, route, phone) VALUES ('pepa', 'blemca', 'papa-blemca', '123{i}56788');")
    print(f"INSERT INTO establishments (name, route) VALUES ('blem', 'blem{i}');")
    print(f"INSERT INTO employee_establishments (employee_id, establishment_id) VALUES ({i + 1}, {i + 1});")
    print(f"INSERT INTO establishment_subpages (establishment_id, route, content, name) VALUES ({i+1}, 'route_{i+1}', 'content', 'name_{i+1}');")
    print(f"INSERT INTO subpage_gallery (establishment_subpage_id, file_id, description) VALUES ({i + 1}, {i+1}, 'description');")

"""
CREATE OR REPLACE FUNCTION truncate_tables(username IN VARCHAR) RETURNS void AS $$
DECLARE
    statements CURSOR FOR
        SELECT tablename FROM pg_tables
        WHERE tableowner = username AND schemaname = 'public';
BEGIN
    FOR stmt IN statements LOOP
        EXECUTE 'TRUNCATE TABLE ' || quote_ident(stmt.tablename) || ' RESTART IDENTITY CASCADE;';
    END LOOP;
END;
$$ LANGUAGE plpgsql;
SELECT truncate_tables('postgres');
"""