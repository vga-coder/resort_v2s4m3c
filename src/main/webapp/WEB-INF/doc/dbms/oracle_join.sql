-- FK�� �����ϰ� �θ� ���̺� ����
-- DROP TABLE categrp CASCADE CONSTRAINTS;

1) �θ� ���̺� ���� �� SELECT ���
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-05-12 04:02:35
         2 ����                                                        2 Y 2020-05-12 04:02:35
         3 ķ��                                                        3 Y 2020-05-12 04:02:35

2) �ڽ� ���̺� ���� �� SELECT ���         
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;     

    CATENO  CATEGRPNO NAME              SEQNO V RDATE                      CNT
---------- ---------- ------------------------- ---------- - ------------------- ----------
         1          1              SF                    1 Y 2020-04-27 12:16:37          0
         2          1              ���              1 Y 2020-04-27 12:16:37          0
         3          1              ������              1 Y 2020-04-27 12:16:37          0
         
3) Cross Join
- �����μ� ��ġ�� ����.
- �θ����̺� ���ڵ� 3 �� x �ڽ� ���̺� ���ڵ� 3�� = 9��
SELECT categrp.categrpno, categrp.name, categrp.seqno,
           cate.cateno, cate.name, cate.seqno
FROM categrp, cate
ORDER BY categrp.categrpno ASC, cate.cateno ASC;

-- ���̺� ����
SELECT r.categrpno, r.name, r.seqno,
           c.cateno, c.name, c.seqno
FROM categrp r, cate c
ORDER BY r.categrpno ASC, c.cateno ASC;

-- �÷� ����
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
ORDER BY r.categrpno ASC, c.cateno ASC;

4) Equal JOIN(INNER JOIN)
- 2���� ���̺��� categrpno �÷��� ���� ��ġ�ϴ� ���ڵ常 ���յǾ� ���
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;

R_CATEGRPNO R_NAME           R_SEQNO   C_CATENO C_NAME       C_SEQNO
-----------       ------------------ ----------    ----------   -------------- ----------
          1         ��ȭ                    1          1                 SF                  1
          1         ��ȭ                    1          2                 ���            1
          1         ��ȭ                    1          3                 ������            1
          
-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r
INNER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;

-- ANSI + WHERE
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r
INNER JOIN cate c
ON r.categrpno = c.categrpno
WHERE c.name = 'SF'
ORDER BY r.categrpno ASC, c.cateno ASC;

R_CATEGRPNO R_NAME           R_SEQNO   C_CATENO C_NAME       C_SEQNO
-----------       ------------------ ----------    ----------   -------------- ----------
          1         ��ȭ                    1          1                 SF                  1
          
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE (r.categrpno = c.categrpno) AND c.name = 'SF'
ORDER BY r.categrpno ASC, c.cateno ASC;


5. LEFT Outer join
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno(+)
ORDER BY r.categrpno ASC, c.cateno ASC;

R_CATEGRPNO R_NAME           R_SEQNO   C_CATENO C_NAME       C_SEQNO
-----------       ------------------ ----------    ----------   -------------- ----------
          1         ��ȭ                    1             1                 SF                  1
          1         ��ȭ                    1             2                 ���            1
          1         ��ȭ                    1             3                 ������            1
          2         ����                    2           null               null              null
          3         ķ��                    3           null               null              null
          
-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r
LEFT OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;

6. RIGHT Outer join
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno(+) = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;

R_CATEGRPNO R_NAME           R_SEQNO   C_CATENO C_NAME       C_SEQNO
-----------       ------------------ ----------    ----------   -------------- ----------
          1         ��ȭ                    1          1                 SF                  1
          1         ��ȭ                    1          2                 ���            1
          1         ��ȭ                    1          3                 ������            1
         
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r
RIGHT OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
         
7. FULL Outer join
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
           c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r
FULL OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;

R_CATEGRPNO R_NAME           R_SEQNO   C_CATENO C_NAME       C_SEQNO
-----------       ------------------ ----------    ----------   -------------- ----------
          1         ��ȭ                    1             1                 SF                  1
          1         ��ȭ                    1             2                 ���            1
          1         ��ȭ                    1             3                 ������            1
          2         ����                    2           null               null              null
          3         ķ��                    3           null               null              null
          
          
         