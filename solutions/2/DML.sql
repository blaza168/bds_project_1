INSERT INTO public.relation_type (relation_type) VALUES ('type1');

INSERT INTO public.attachments (location, mimetype, modification_date) VALUES ('/tmp/blemca/file.png', 'image/png', current_timestamp);

INSERT INTO public.users (given_name, family_name, email, status, attachment_id)
VALUES ('blemca', 'pepa z depa', 'email@gmail.xyz', 'online',1);

INSERT INTO public.user_address (user_id, zip_code, street, house_number, city)
VALUES (1, '12345', 'pepa', '159', 'jozkov');

INSERT INTO public.user_contacts (user_id, mobile, twitter, webpage) VALUES (1, '1547896320', 'tweet', NULL);

INSERT INTO public.meetings (organizer_id, note, description, location, start_date, end_date)
VALUES (1, 'note', NULL, 'webex', current_time, current_time);
