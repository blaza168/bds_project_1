-- Images for establishment
CREATE TABLE subpage_gallery (
                                 establishment_subpage_id           INT NOT NULL, -- FK establishment
                                 file_id                            INT NOT NULL, -- file contained in gallery
                                 description                        VARCHAR(500) DEFAULT NULL, -- description of image

                                 CONSTRAINT fk_est_subpage FOREIGN KEY (establishment_subpage_id) REFERENCES establishment_subpages(id) ON DELETE CASCADE,
                                 CONSTRAINT fk_gallery_file FOREIGN KEY (file_id) REFERENCES crm_file.files(id) ON DELETE CASCADE,
                                 INDEX index_subpage (establishment_subpage_id)
) DEFAULT CHARACTER SET 'UTF8';
