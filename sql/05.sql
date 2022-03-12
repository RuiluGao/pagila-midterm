-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.

CREATE TABLE project (
    -- len = 16
    developer_id UUID,    

    -- len = 8
    author_id BIGINT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMPTZ,

    -- len = 4
    id SERIAL PRIMARY KEY,
    target_id INTEGER,
    project_id INTEGER NOT NULL UNIQUE,

    -- len = 2
    action SMALLINT NOT NULL,
  
    -- len = 1
    title CHAR(256),

    -- len = -1
    developer_addr INET,
    target_type VARCHAR(2),
    data TEXT
);

-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header: 23 bytes for struct; more than 8 columns --> >1 null bit map = 32 total;
-- Data: Total = 4+4+8+16+4+2+2+8+8 = 56
    INT position 32, +4 bytes of data, 32-35, +4 bytes of padding
    BIGINT position 40; +8 bytes of data 40-47
    UUID position 48, +16 bytes of data 48-63 
    INT position 64, +4 bytes of data, 64-67
    SMALLINT position 68, +2 bytes of data, 68-69, +2 bytes of padding
    TIMESTAMP position 72, +8 bytes of data, 72-79
    TIMESTAMPTZ position 80, +8 bytes of data, 80-87
-- Padding: 32+56 = 88 88%8=0
-- Total: 88
