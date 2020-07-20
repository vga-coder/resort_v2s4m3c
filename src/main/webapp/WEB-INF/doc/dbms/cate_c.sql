1) ���̺� ����: �ڽ� -> �θ�
�� DROP TABLE categrp; : ORA-02449: unique/primary keys in table referenced by foreign keys
�� �ڽ� ���̺� ����: DROP TABLE cate;
�� �θ� ���̺� ����: DROP TABLE categrp;
  
2) ���̺� ����: �θ� -> �ڽ�
�� FK cate ������ ���� �߻�: ORA-00942: table or view does not exist
�� �θ� ���̺� ���� ����: categrp
�� �ڽ� ���̺� ����: cate

/**********************************/
/* Table Name: ī�װ� */
/**********************************/
DROP TABLE contents;
DROP TABLE cate;
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                           		DATE		 NOT NULL,
		cnt                           	    	NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

COMMENT ON TABLE cate is 'ī�װ�';
COMMENT ON COLUMN cate.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN cate.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN cate.name is 'ī�װ� �̸�';
COMMENT ON COLUMN cate.seqno is '��� ����';
COMMENT ON COLUMN cate.visible is '��� ���';
COMMENT ON COLUMN cate.rdate is '�����';
COMMENT ON COLUMN cate.cnt is '��ϵ� �� ��';

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

3) ���
-- ERROR�� �߻��ϴ� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1000, 'SF', 1 , 'Y', sysdate, 0);

-- �������� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

-- ORA-02291: integrity constraint (AI6.SYS_C007209) violated - parent key not found

SELECT * FROM categrp;
-- �θ� ���̺� ���ڵ尡 ��� ����� ���е�.

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '��ȭ', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '����', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, 'ķ��', 3, 'Y', sysdate);

commit;

SELECT * FROM categrp;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-04-27 12:03:22
         2 ����                                                        2 Y 2020-04-27 12:03:22
         3 ķ��                                                        3 Y 2020-04-27 12:03:22

4) �������� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '���', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '������', 1 , 'Y', sysdate, 0);

COMMIT;

5) ���
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;

    CATENO  CATEGRPNO NAME              SEQNO V RDATE                      CNT
---------- ---------- ------------------------- ---------- - ------------------- ----------
         1          1              SF                    1 Y 2020-04-27 12:16:37          0
         2          1              ���              1 Y 2020-04-27 12:16:37          0
         3          1              ������              1 Y 2020-04-27 12:16:37          0
         
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY seqno ASC;


6) ����
DELETE FROM cate
WHERE cateno = 7;
commit;

SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;

7) categrpno FK ���� �̿��� ����
DELETE FROM cate
WHERE categrpno = 1;

8) ��ȸ
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE cateno=1;

9) ����
UPDATE cate
SET categrpno=1, name='�Ĵ�', seqno = 10, visible='N', cnt=0
WHERE cateno = 5;

commit;

10) ��� ���� ����, 10 �� 1
UPDATE cate
SET seqno = seqno - 1
WHERE cateno=1;
 
11) ��¼��� ����, 1 �� 10
UPDATE cate
SET seqno = seqno + 1
WHERE cateno=1;

commit;

12) ��� ����� ����
UPDATE cate
SET visible='Y'
WHERE cateno=1;

UPDATE cate
SET visible='N'
WHERE cateno=1;

commit;

13) ���� VO
SELECT r.categrpno as r_categrpno, r.name as r_name,
           c.cateno, c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.seqno ASC;

R_CATEGRPNO R_NAME  CATENO  CATEGRPNO  NAME      SEQNO VISIBLE RDATE            CNT
----------- --------------- ---------- ----------- --------------------- ---------- - ------------------- ----------
          1 ��ȭ                  1           1 SF                              1 Y 2020-05-12 04:04:28          0
          1 ��ȭ                  2           1 ���                         2 Y 2020-05-12 04:04:28          0
          1 ��ȭ                  3           1 ������                         3 Y 2020-05-12 04:04:28          0
          2 ����                  6           2 �ް� Ʈ���̳�                1 Y 2020-05-13 12:50:28          0
          2 ����                  4           2 ð�� Ǫ��                      2 Y 2020-05-13 12:48:32          0

14) ���� VO, categrpno �� cate ���
SELECT r.categrpno as r_categrpno, r.name as r_name,
           c.cateno, c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
FROM categrp r, cate c
WHERE (r.categrpno = c.categrpno) AND r.categrpno=1
ORDER BY r.categrpno ASC, c.seqno ASC;

R_CATEGRPNO R_NAME  CATENO  CATEGRPNO  NAME      SEQNO VISIBLE RDATE            CNT
----------- --------------- ---------- ----------- --------------------- ---------- - ------------------- ----------
          1 ��ȭ                  1           1 SF                              1 Y 2020-05-12 04:04:28          0
          1 ��ȭ                  2           1 ���                         2 Y 2020-05-12 04:04:28          0
          1 ��ȭ                  3           1 ������                         3 Y 2020-05-12 04:04:28          0


���� 1) categrp + cate inner join,  1 : ��, association
SELECT r.categrpno as r_categrpno, r.name as r_name,
           c.cateno as c_cateno, c.categrpno as c_categrpno, c.name as c_name,
           c.seqno as c_seqno, c.visible as c_visible, c.rdate as c_rdate, c.cnt as c_cnt
FROM categrp r
INNER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.seqno ASC;

SELECT r.categrpno as r_categrpno, r.name as r_name,
           c.cateno as c_cateno, c.categrpno as c_categrpno, c.name as c_name,
           c.seqno as c_seqno, c.visible as c_visible, c.rdate as c_rdate, c.cnt as c_cnt
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.seqno ASC;

R_CATEGRPNO R_NAME  C_CATENO C_CATEGRPNO C_NAME     C_SEQNO C C_RDATE            C_CNT
----------- --------------- ---------- ----------- --------------------- ---------- - ------------------- ----------
          1 ��ȭ                  1           1 SF                              1 Y 2020-05-12 04:04:28          0
          1 ��ȭ                  2           1 ���                         2 Y 2020-05-12 04:04:28          0
          1 ��ȭ                  3           1 ������                         3 Y 2020-05-12 04:04:28          0
          2 ����                  6           2 �ް� Ʈ���̳�                1 Y 2020-05-13 12:50:28          0
          2 ����                  4           2 ð�� Ǫ��                      2 Y 2020-05-13 12:48:32          0

���� 2) categrp + cate inner join,  1 : ��, collection
SELECT r.categrpno as r_categrpno, r.name as r_name, r.rdate as r_date,
           c.cateno as c_cateno, c.categrpno as c_categrpno, c.name as c_name,
           c.seqno as c_seqno, c.visible as c_visible, c.rdate as c_rdate, c.cnt as c_cnt
FROM categrp r
INNER JOIN cate c
ON r.categrpno = c.categrpno 
WHERE r.categrpno=1
ORDER BY r.categrpno ASC, c.seqno ASC;

SELECT r.categrpno as r_categrpno, r.name as r_name, r.rdate as r_date,
           c.cateno as c_cateno, c.categrpno as c_categrpno, c.name as c_name,
           c.seqno as c_seqno, c.visible as c_visible, c.rdate as c_rdate, c.cnt as c_cnt
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno AND r.categrpno=1
ORDER BY r.categrpno ASC, c.seqno ASC;

R_CATEGRPNO R_NAME ? R_DATE ? ? ? ? ? ? ? ?C_CATENO C_CATEGRPNO C_NAME ? ? ? ?C_SEQNO C C_RDATE ? ? ? ? ? ? ? ? ?C_CNT
----------- ---------------- ------------------- ---------- ----------- -------------------------------------- ---------- - ------------------- ----------
? ? ? ? ? 1 ? ? ? ?��ȭ ? ? ? ?2020-05-12 04:02:35 ? ? ? ? ?1 ? ? ? ? ? 1 SF ? ? ? ? ? ?1 Y 2020-05-12 04:04:28 ? ? ? ? ?0
? ? ? ? ? 1 ? ? ? ?��ȭ ? ? ? ?2020-05-12 04:02:35 ? ? ? ? ?2 ? ? ? ? ? 1 ��� ? ? ? 2 Y 2020-05-12 04:04:28 ? ? ? ? ?0
? ? ? ? ? 1 ? ? ? ?��ȭ ? ? ? ?2020-05-12 04:02:35 ? ? ? ? ?3 ? ? ? ? ? 1 ������ ? ? ? 3 Y 2020-05-12 04:04:28 ? ? ? ? ?0
? ? ? ? ? 1 ? ? ? ?��ȭ ? ? ? ?2020-05-12 04:02:35 ? ? ? ? ?7 ? ? ? ? ? 1 ���� ? ? ? ? ?4 Y 2020-05-13 04:11:54 ? ? ? ? ?0
? ? ? ? ? 1 ? ? ? ?��ȭ ? ? ? ?2020-05-12 04:02:35 ? ? ? ? ?8 ? ? ? ? ? 1 ���� ? ? ? ? ?5 Y 2020-05-13 04:12:20 ? ? ? ? ?0


SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE categrpno=1
ORDER BY seqno ASC;

-- contents �߰������� ��ϵ� �ۼ��� ����
UPDATE cate 
SET cnt = cnt + 1 
WHERE cateno=1;

-- contents �߰������� ��ϵ� �ۼ��� ����
UPDATE cate 
SET cnt = cnt - 1 
WHERE cateno=1;
 
 
 
 
 
 








