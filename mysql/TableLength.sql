SELECT
    concat(
        round(sum(table_rows) / 1000000, 2),
        'm'
    )rows,
    concat(
        round(
            sum(data_length)/(1024 * 1024 * 1024),
            2
        ),
        'g'
    )DATA,
    concat(
        round(
            sum(index_length)/(1024 * 1024 * 1024),
            2
        ),
        'g'
    )idx,
    concat(
        round(
            sum(data_length + index_length)/(1024 * 1024 * 1024),
            2
        ),
        'g'
    )total_size,
    round(
        sum(index_length)/ sum(data_length + index_length),
        2
    )idxfrac
FROM
    information_schema. TABLES
WHERE
    table_schema = 'DATABASE_NAME'
AND table_name = 'TABLE_NAME';
