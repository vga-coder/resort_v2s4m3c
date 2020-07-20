/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
DROP TABLE attachfile;
DROP TABLE contents;
DROP TABLE cate;
DROP TABLE categrp;
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         	     	DATE		 NOT NULL
);

COMMENT ON TABLE categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN categrp.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN categrp.name is '�̸�';
COMMENT ON COLUMN categrp.seqno is '��� ����';
COMMENT ON COLUMN categrp.visible is '��� ���';
COMMENT ON COLUMN categrp.rdate is '�׷� ������';

DROP SEQUENCE categrp_seq;
CREATE SEQUENCE categrp_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 
-- insert
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '��ȭ', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '����', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, 'ķ��', 3, 'Y', sysdate);

commit;

-- list
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-04-27 03:02:50
         2 ����                                                        2 Y 2020-04-27 03:02:50
         3 ķ��                                                        3 Y 2020-04-27 03:02:50

-- read
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
WHERE categrpno=1;

-- 1�� ���ڵ� name ����
UPDATE categrp
SET name='��ȭ'
WHERE categrpno=1;

-- 1�� ���ڵ� seqno ����
UPDATE categrp
SET seqno=10
WHERE categrpno=1;

-- 1�� ���ڵ� visible ����
UPDATE categrp
SET visible='N'
WHERE categrpno=1;

-- ����
UPDATE categrp
SET name='�Ĵ�', seqno = 10, visible='N'
WHERE categrpno = 5;

commit;


-- 1�� ���ڵ� ����
DELETE FROM categrp
WHERE categrpno=1;

-- ���ڵ� ����
SELECT COUNT(*) as cnt
FROM categrp;

-- ��� ���������� ��ü ���
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;
 
-- ��� ���� ����, 10 �� 1
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 
-- ��¼��� ����, 1 �� 10
UPDATE categrp
SET seqno = seqno + 1
WHERE categrpno=1;

-- ������ ���� �߻��� ���: �ڽ� ���ڵ尡 �߰ߵǾ� ���� ����.
ORA-02292: integrity constraint (AI6.SYS_C007230) violated - child record found
SELECT * FROM cate;

    CATENO  CATEGRPNO NAME              SEQNO V RDATE                      CNT
---------- ---------- ------------------------- ---------- - ------------------- ----------
         2          1              ���              1 Y 2020-04-27 12:16:37          0
         3          1              ������              1 Y 2020-04-27 12:16:37          0

-- cate ���̺� ���ڵ尡 ���� ��� ���� ����
DELETE FROM categrp
WHERE categrpno=1;

commit;

SELECT * FROM categrp;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         2 ����                                                        2 Y 2020-04-27 12:03:22
         3 ķ��                                                        3 Y 2020-04-27 12:03:22
         
-- ��� ����� ����
UPDATE categrp
SET visible='Y'
WHERE categrpno=1;

UPDATE categrp
SET visible='N'
WHERE categrpno=1;

commit;













