DROP TABLE vis;
CREATE TABLE vis (
		visno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        code                          VARCHAR(10)       NOT NULL,  
        title                           VARCHAR(100)		 NOT NULL,  
		data                      		VARCHAR(500)		 NOT NULL,
		rdate                 	     	DATE		 NOT NULL
);

COMMENT ON TABLE vis is '�ð�ȭ ������';
COMMENT ON COLUMN vis.visno is '�ð�ȭ ������ ��ȣ';
COMMENT ON COLUMN vis.code is '�ڵ�';
COMMENT ON COLUMN vis.title is '����';
COMMENT ON COLUMN vis.data is '������';
COMMENT ON COLUMN vis.rdate is '�����';

INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', '"abc"', sysdate);

SELECT * FROM vis;

-- X
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', "'abc'", sysdate);
             
-- X
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', "''abc''", sysdate);
             
-- O
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', '''abc''', sysdate);
SELECT * FROM vis;

-- X
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', '\'abc\'', sysdate);
SELECT * FROM vis;

-- O
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', q'$'abc'$', sysdate);
SELECT * FROM vis;

-- O
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR', '�����', q'$"abc"$', sysdate);
SELECT * FROM vis;

SELECT visno, code, title, data, rdate
FROM vis
WHERE code='BAR'
ORDER BY visno ASC;

--  subquery�� �̿��� �ֱ� ��� ������ ���
SELECT visno, code, title, data, rdate, r
FROM (
    SELECT visno, code, title, data, rdate, rownum as r
    FROM (
        SELECT visno, code, title, data, rdate
        FROM vis
        WHERE code='BAR'
        ORDER BY visno DESC
    )
)
WHERE r = 1;

DELETE FROM vis;
COMMIT;

-- �ɼ��� �߰��� ���� �׷���
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'LINE', '�ɼ��� �߰��� ���� �׷���', q'$[[10,20,30,40,50,300,200],[25,32,45,53,65,270,150]]$', sysdate);
SELECT * FROM vis;

-- Tcik�� �ִ� ���� �׷���
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'LINE', 'Tcik�� �ִ� ���� �׷���', q'$[[['1��', 300], ['2��', 52], ['3��', 38], ['4��', 30], ['5��', 0]]]$', sysdate);
SELECT * FROM vis;

-- ���� �׷��� �⺻
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR1', '���� �׷��� �⺻', q'$[['����', 4],['����', 6],['������', 2],['�ƿ��', 5],['�ΰ�Ƽ', 6]]$', sysdate);
SELECT * FROM vis;
    
-- ���� �׷��� 2 ����, ���� ������ '/'
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR2', '���� �׷��� 2 ����', q'$[9, 8, 6, 8, 7, 6, 4]/[2, 3, 4, 10, 8, 5, 1]$', sysdate);
SELECT * FROM vis;

-- ���� �׷����� ������ �׷����� ����
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR3', '���� �׷����� ������ �׷����� ����', q'$[9, 8, 6, 8, 7, 6, 4]/[2, 3, 4, 10, 8, 5, 1]$', sysdate);
SELECT * FROM vis;

-- ���� �׷��� �� ���
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'BAR4', '���� �׷��� �� ���', q'$[14, 32, 41, 44, 40, 37, 29]$', sysdate);
SELECT * FROM vis;

-- ���� �׷���
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'PIE', '���� �׷���', q'$[[['1/4 �б�', 50], ['2/4 �б�', 22], ['3/4 �б�', 38], ['4/4 �б�', 30]]]$', sysdate);
SELECT * FROM vis;

-- Meter gauge
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'METER', 'Meter gauge', q'$322$', sysdate);
SELECT * FROM vis;

COMMIT;

-- �ڵ� ���ΰ�ħ Ȯ�� ������
INSERT INTO vis (visno, code, title, data, rdate) 
VALUES ((SELECT NVL(MAX(visno), 0) + 1 as visno FROM vis),
             'METER', 'Meter gauge', q'$200$', sysdate);

COMMIT;

