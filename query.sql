SELECT works.doi AS doi, works.abstract AS abstract, works.published_year AS year, works.title AS title,
        GROUP_CONCAT(work_subjects.name, '|') AS subjects,
        GROUP_CONCAT(work_references.doi, '|') AS crossrefs,

        AVG(2023 - work_references.year) AS crossref_mean_age,

        AVG((2023 - work_references.year) * ( 2023 - work_references.year)) - (AVG(2023 - work_references.year) *
        AVG(2023 - work_references.year)) AS crossref_var_age,

        cdindex.cdindex AS cdindex

    FROM works
    JOIN work_subjects ON works.id == work_subjects.work_id
    JOIN work_authors ON works.id == work_authors.work_id
    JOIN work_references ON works.id == work_references.work_id
    JOIN cdindex ON works.doi == cdindex.doi

WHERE cdindex.cdindex IS NOT NULL AND works.published_year IS NOT NULL AND work_references.year IS NOT NULL GROUP BY works.doi