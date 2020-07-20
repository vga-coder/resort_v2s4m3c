- ���̺� ����
-- member �������� FK�� ����� blog ���̺� ���� �����մϴ�.
DROP TABLE attachfile;
DROP TABLE contents;
DROP TABLE member;
-- ���� ���ǰ� �Բ� ����(���� ������ �־ ������, �������� ����.)
DROP TABLE member CASCADE CONSTRAINTS; 
 
CREATE TABLE member (
  memberno NUMBER(6) NOT NULL, -- ȸ�� ��ȣ, ���ڵ带 �����ϴ� �÷� 
  id             VARCHAR(20)   NOT NULL UNIQUE, -- ���̵�, �ߺ� �ȵ�, ���ڵ带 ���� 
  passwd      VARCHAR(60)   NOT NULL, -- �н�����, ������ ����
  mname      VARCHAR(20)   NOT NULL, -- ����, �ѱ� 10�� ���� ����
  tel            VARCHAR(14)   NOT NULL, -- ��ȭ��ȣ
  zipcode     VARCHAR(5)        NULL, -- �����ȣ, 12345
  address1    VARCHAR(80)       NULL, -- �ּ� 1
  address2    VARCHAR(50)       NULL, -- �ּ� 2
  mdate       DATE             NOT NULL, -- ������    
  PRIMARY KEY (memberno)                     -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
 
COMMENT ON TABLE MEMBER is 'ȸ��';
COMMENT ON COLUMN MEMBER.MEMBERNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEMBER.ID is '���̵�';
COMMENT ON COLUMN MEMBER.PASSWD is '�н�����';
COMMENT ON COLUMN MEMBER.MNAME is '����';
COMMENT ON COLUMN MEMBER.TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.ZIPCODE is '�����ȣ';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '�ּ�1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '�ּ�2';
COMMENT ON COLUMN MEMBER.MDATE is '������';

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 
 
1. ���
 
1) id �ߺ� Ȯ��
SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';
 
 cnt
 ---
   0   �� �ߺ� ���� ����.
   
2) ���
-- ȸ�� ������ ����, Q/A �� ����
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'qnaadmin', '1234', 'QNA������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'crm', '1234', '��������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
-- ���� ȸ�� �׽�Ʈ ����
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'user1', '1234', '�մ���', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'user2', '1234', '�Ʒι�', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'user3', '1234', '������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
-- �׷캰 ���� ȸ�� ����
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'team1', '1234', '������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'team2', '1234', '���ۺ�����', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'team3', '1234', '��������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);

COMMIT;

 
2. ���
- �˻��� ���� �ʴ� ���, ��ü ��� ���
 
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
ORDER BY memberno ASC;
 
 MEMBERNO ID       PASSWD MNAME  TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- -------- ------ ------ ------------- ------- -------- -------- ---------------------
   1 qnaadmin 1234   QNA������ 000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:43.0
   2 crm      1234   ��������  000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:44.0
   3 user1    1234   �մ���    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:48.0
   4 user2    1234   �Ʒι�    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:49.0
   5 user3    1234   ������    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:50.0
   6 team1    1234   ������    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:53.0
   7 team2    1234   ���ۺ����� 000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:54.0
   8 team3    1234   ��������   000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:55.0
 
   
3. ��ȸ
 
1) user1 ��� ���� ����
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
WHERE memberno = 1;
 
 MEMBERNO ID       PASSWD MNAME  TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- -------- ------ ------ ------------- ------- -------- -------- ---------------------
   1 qnaadmin 1234   QNA������ 000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:43.0
 
    
4. ����
UPDATE member 
SET mname='�Ʒι�', tel='111-1111-1111', zipcode='00000',
      address1='��⵵', address2='���ֽ�'
WHERE memberno=1;

COMMIT;

 
5. ����
1) ��� ����
DELETE FROM member;
 
2) Ư�� ȸ�� ����
DELETE FROM member
WHERE memberno=15;

COMMIT;

 
6. �н����� ����
1) �н����� �˻�
SELECT COUNT(memberno) as cnt
FROM member
WHERE memberno=1 AND passwd='1234';
 
2) �н����� ����
UPDATE member
SET passwd='0000'
WHERE memberno=1;

COMMIT;
 
 
7. �α���
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0
   
8. id�� �̿��� ȸ�� ���� ��ȸ
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
WHERE id = 'user1';
 
 MEMBERNO ID    PASSWD MNAME TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- ----- ------ ----- ------------- ------- -------- -------- ---------------------
   3 user1 1234   �մ���   000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:48.0
   
 








 