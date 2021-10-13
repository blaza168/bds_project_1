# roles + permissions

for i in range(51):
    print(f'INSERT INTO roles (role) VALUES ("admin{i}");')
    print(f'INSERT INTO role_permissions (role_id, permission) VALUES ({i + 1}, "permission {i + 1}")')

# users + user_roles

for i in range(5):
    print("INSERT INTO `users` (`username`, `hash`, `salt`, `first_name`, `last_name`, `route`) VALUES " +
            f"('admin{i}', 0xC9904D4A605BEA174F3B7{i}3452A2F2AF8DD73A34C1234BB1BA648DA8649ACEFF, "
            "0x01A91DD5922E93BA6B99BEC72F693A5F, 'I', 'DontLike', 'Projects');")

    print(f'INSERT INTO user_roles (username, role_id) VALUES ("admin{i}", {i});')

# files + file_identifications

for i in range(5):
    print(f'INSERT INTO files (filename, mimetype) VALUES ("file_{i}.jpeg", "image/jpeg")')
    print(f'INSERT INTO file_identifications (category, category_key, file_id) VALUES ("category", "key", {i + 1})')


