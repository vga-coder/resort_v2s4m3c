/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE attachfile;
DROP TABLE contents CASCADE CONSTRAINTS;
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)	 NOT NULL ,
		cateno                        		NUMBER(10)		 NOT NULL ,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB         		 NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		web                           		VARCHAR2(500)		 NULL ,
		map                           		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
		mp3                           		VARCHAR2(1000)		 NULL ,
		mp4                           		VARCHAR2(1000)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		ip                            	     	VARCHAR2(15)		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
		grpno                         		NUMBER(8)		 DEFAULT 0		 NOT NULL,
		indent                        		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		ansnum                        		NUMBER(3)		 DEFAULT 0		 NOT NULL,
		word                          		VARCHAR2(300)		 NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE contents is '������';
COMMENT ON COLUMN contents.contentsno is '������ ��ȣ';
COMMENT ON COLUMN contents.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN contents.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN contents.title is '����';
COMMENT ON COLUMN contents.content is '����';
COMMENT ON COLUMN contents.recom is '��õ��';
COMMENT ON COLUMN contents.cnt is '��ȸ��';
COMMENT ON COLUMN contents.replycnt is '��ۼ�';
COMMENT ON COLUMN contents.web is '���ͳ� �ּ�';
COMMENT ON COLUMN contents.map is '����';
COMMENT ON COLUMN contents.youtube is 'Youtube';
COMMENT ON COLUMN contents.mp3 is 'MP3';
COMMENT ON COLUMN contents.mp4 is 'MP4';
COMMENT ON COLUMN contents.visible is '��� ���';
COMMENT ON COLUMN contents.ip is 'IP';
COMMENT ON COLUMN contents.passwd is '�н�����';
COMMENT ON COLUMN contents.grpno is '�׷��ȣ';
COMMENT ON COLUMN contents.indent is '�鿩����/�亯����';
COMMENT ON COLUMN contents.ansnum is '�亯����';
COMMENT ON COLUMN contents.word is '�˻���';
COMMENT ON COLUMN contents.rdate is '�����';
COMMENT ON COLUMN contents.file1 is '���� �̹���';
COMMENT ON COLUMN contents.thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN contents.size1 is ' ���� �̹��� ũ��';

DROP SEQUENCE contents_seq;
CREATE SEQUENCE contents_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
1) �� ���(�̹��� ���� �÷� �߰�)
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);
            
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);

SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate, file1, thumb1, size1
FROM contents 
ORDER BY contentsno ASC;    

COMMIT;

-- ���� sequence�� Ȯ��
SELECT contents_seq.nextval FROM dual;
SELECT contents_seq.currval FROM dual;

2) ��ü���
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate, file1, thumb1, size1 
FROM contents 
ORDER BY contentsno DESC;

2-1) cateno�� ���
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate, file1, thumb1, size1
FROM contents 
WHERE cateno = 29
ORDER BY contentsno DESC;

2-2) cateno�� �˻� ���
1) �˻�
�� cateno�� �˻� ���
SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%������%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%���ǽ�%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%���ǽ�%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%swiss%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%����%'
ORDER BY contentsno DESC;

-- title, content, word column search
SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND (title LIKE '%����%' OR content LIKE '%����%' OR word LIKE '%����%')
ORDER BY contentsno DESC;


�� �˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=25;

-- cateno �� �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=25 AND word LIKE '%������%';

SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=25 AND (title LIKE '%����%' OR content LIKE '%����%' OR word LIKE '%����%')


3) 1�� ��ȸ
SELECT contentsno, memberno, cateno, title, content, recom, web, map, youtube, mp3, mp4, ip, passwd,
          word, rdate, file1, thumb1, size1
FROM contents
WHERE contentsno = 1;

4) ����
UPDATE contents 
SET title='����', content='����', web='http://', word='�˻���'
WHERE contentsno = 5;

COMMIT;

5) �н����� �˻�
SELECT COUNT(*) as passwd_cnt
FROM contents
WHERE contentsno=5 AND passwd='1234';

SELECT contentsno, passwd
FROM contents 
ORDER BY contentsno DESC;    

6) ����
-- ��ü ���ڵ� ����
DELETE FROM contents;
COMMIT;  

DELETE FROM contents
WHERE contentsno=1;

COMMIT;  


7) ��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents;
 
 COUNT
 -----
     5
     
8) Ư�� ȸ���� �ۼ��� �۸� ���: cate + contents + member
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate,
          m.memberno as m_memberno, m.mname as m_mname          
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

-- ANSI
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate,
          m.memberno as m_memberno, m.mname as m_mname          
FROM cate c
INNER JOIN contents t
ON c.cateno = c.cateno
INNER JOIN member m
ON t.memberno = m.memberno
WHERE m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

-- Ư�� ȸ���� �� ����� ���� cate, contents join
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate        
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

9) map
-- map                           		VARCHAR2(1000)		 NULL ,
UPDATE contents
SET map='��â ������ ����'
WHERE contentsno=1 AND passwd='123'; 
  
SELECT contentsno, memberno, cateno, web, map
FROM contents 
ORDER BY contentsno ASC;    

10) Youtube
-- map                                   VARCHAR2(1000)         NULL ,
UPDATE contents
SET youtube='youtube URL'
WHERE contentsno=13; 

SELECT contentsno, memberno, cateno, web, map, youtube
FROM contents 
WHERE contentsno=1 AND passwd='123'; 

11) MP3
UPDATE contents
SET mp3='mp3 file name'
WHERE contentsno=1 AND passwd='123'; 
  
SELECT contentsno, memberno, cateno, web, map, youtube, mp3
FROM contents 
ORDER BY contentsno ASC;    

12) �˻� + ����¡
-- step 1
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%������%'
ORDER BY contentsno DESC;

-- step 2
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
FROM (
          SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
          FROM contents
          WHERE cateno=25 AND word LIKE '%������%'
          ORDER BY contentsno DESC
);

-- step 3, 1 page
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, r
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
                     FROM contents
                     WHERE cateno=29 AND word LIKE '%������%'
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, r
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word
                     FROM contents
                     WHERE cateno=25 AND word LIKE '%������%'
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 11 AND r <= 20;

----------------------------------------------------------------------------------------------
�亯 ���� ����
----------------------------------------------------------------------------------------------
-- 1���� ���� �亯 ��Ͽ�: grpno: 1, indent: 1, ansnum: 1
SELECT * FROM member;
SELECT * FROM categrp;
SELECT * FROM cateno;
 
�� ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
-- ��� ���� �켱 ������ 1�� ������, 1�� -> 2��
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 0;
 
-- 2����� �켱 ������ 1�� ������, 2�� -> 3��
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 1;
 
-- 3����� �켱 ������ 1�� ������, 3�� -> 4��
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 2;
 
-- 6����� �켱 ������ 1�� ������, 6�� -> 7��
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 5;
 
 
�� �亯 ���
- catenono: FK, mno: FK
 
INSERT INTO contents(contentsno,
                          cateno, mno, title, content, good, thumbs, files, sizes, cnt, replycnt, rdate, 
                          grpno, indent, ansnum, word)  
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM contents),
            1, 1, '����', '����',0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1,'');
 
 
�� �亯�� ���� ���� ���� ����    
-- ORDER BY grpno DESC, ansnum ASC
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, r
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
                     FROM contents
                     WHERE cateno=29 AND word LIKE '%������%'
                     ORDER BY grpno DESC, ansnum ASC
           )          
)
WHERE r >= 1 AND r <= 10;        
   
----------------------------------------------------------------------------------------------
�亯 ���� ����
----------------------------------------------------------------------------------------------
   
   
