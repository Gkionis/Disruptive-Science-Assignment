CREATE UNIQUE INDEX "idx_cdindex" ON cdindex.doi;

CREATE UNIQUE INDEX "idx_work_auth" ON work_authors.id;

CREATE INDEX "idx_work_auth_workid" ON work_authors.work_id;

CREATE INDEX "idx_work_ref" ON work_references.work_id;

CREATE INDEX "idx_work_sub" ON work_subjects.work_id;

CREATE UNIQUE INDEX "idx_works" ON works.id;

CREATE UNIQUE INDEX "idx_works_doi" ON works.doi;