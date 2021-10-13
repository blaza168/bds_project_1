CREATE TABLE subpage_gallery (
                                 establishment_subpage_id           INT NOT NULL,
                                 file_id                            INT NOT NULL,
                                 description                        VARCHAR(500) DEFAULT NULL,

                                 CONSTRAINT fk_est_subpage FOREIGN KEY (establishment_subpage_id) REFERENCES establishment_subpages(id) ON DELETE CASCADE,
                                 CONSTRAINT fk_gallery_file FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE
);
