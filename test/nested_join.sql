CREATE TABLE t1 (a INTEGER);
CREATE TABLE t2 (a2 INTEGER, b2 INTEGER);
CREATE TABLE t3 (b INTEGER);

INSERT INTO t1 VALUES (1), (2);
INSERT INTO t2 VALUES (1, 101);
INSERT INTO t3 VALUES (101);

-- works
SELECT * FROM t1 LEFT JOIN t2 ON t1.a = t2.a2 LEFT JOIN t3 ON t2.b2 = t3.b OR t2.b2 IS NULL;

-- does not work
SELECT * FROM t1 LEFT JOIN (t2 LEFT JOIN t3 ON t2.b2 = t3.b OR t2.b2 IS NULL) ON t1.a = t2.a2;

-- does not work
SELECT * FROM (t1 LEFT JOIN t2 ON t1.a = t2.a2) LEFT JOIN t3 ON t2.b2 = t3.b OR t2.b2 IS NULL;
