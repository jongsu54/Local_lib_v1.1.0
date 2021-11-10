--테이블 삭제 및 생성
DROP TABLE RENT_RECORD;
DROP TABLE BOOK;
DROP TABLE USER_INFO;
DROP TABLE MESSAGE;

DROP SEQUENCE BOOK_SEQ;
DROP SEQUENCE RENT_RECORD_SEQ;

--시퀀스 생성
CREATE SEQUENCE BOOK_SEQ;
CREATE SEQUENCE RENT_RECORD_SEQ;
CREATE SEQUENCE MESSAGE_SEQ;



--계정 테이블
CREATE TABLE USER_INFO
(
USER_ID VARCHAR2(20) PRIMARY KEY ,
PW VARCHAR2(30) NOT NULL,
NAME VARCHAR2(20) NOT NULL,
NICKNAME VARCHAR2(20),
PHONE VARCHAR2(13) UNIQUE NOT NULL,
PHONE_AUTH NUMBER(1) DEFAULT 0,
POSTCODE VARCHAR2(6),
ADDR1 VARCHAR2(100),
ADDR2 VARCHAR2(100),
EMAIL VARCHAR2(50) NOT NULL,
BIRTHDAY DATE ,
GENDER NUMBER(1),
USER_GB NUMBER(1)  DEFAULT 2 NOT NULL ,
JOIN_DATE DATE  DEFAULT SYSDATE NOT NULL,
STATE_GB NUMBER(1)  DEFAULT 1 NOT NULL
);


--도서 테이블
CREATE TABLE BOOK
(
BOOK_ID NUMBER PRIMARY KEY ,
BOOK_NAME VARCHAR2(500) NOT NULL,
AUTHOR VARCHAR2(100) NOT NULL,
PUBLISHER VARCHAR2(50) NOT NULL,
ISBN VARCHAR2(13) NOT NULL,
KDC NUMBER(3),
INDATE DATE DEFAULT SYSDATE NOT NULL,
OWNER_ID VARCHAR2(20) CONSTRAINT BOOK_FK
REFERENCES USER_INFO(USER_ID) NOT NULL,
STATE_GB NUMBER(1) DEFAULT 1 NOT NULL
);

--대여이력 테이블
CREATE TABLE RENT_RECORD
(
RENT_ID NUMBER PRIMARY KEY,
USER_ID VARCHAR2(20) NOT NULL ,
BOOK_ID NUMBER NOT NULL,
RENT_DATE DATE DEFAULT SYSDATE NOT NULL ,
RETURN_DATE DATE ,
EXTEND_GB NUMBER(1),
EXTEND_DATE DATE,
OWNER_RENT_CK NUMBER(1),
OWNER_RENT_CK_DATE DATE, 
RENT_CK NUMBER(1),
RENT_CK_DATE DATE,
OWNER_RETURN_CK NUMBER(1),
OWNER_RETURN_CK_DATE DATE,
RETURN_CK NUMBER(1),
RETURN_CK_DATE DATE
);
--안내메세지 및 채팅메세지
CREATE TABLE MESSAGE
(
MESSAGE_ID NUMBER PRIMARY KEY,
ROOM NUMBER NOT NULL,
SENDER_ID VARCHAR2(20) CONSTRAINT MESSAGE_S_FK 
REFERENCES USER_INFO(USER_ID) NOT NULL,
RECEIVER_ID VARCHAR2(20) CONSTRAINT MESSAGE_R_FK
REFERENCES USER_INFO(USER_ID) NOT NULL,
CONTEXT VARCHAR2(4000) NOT NULL ,
TYPE NUMBER(1) DEFAULT 1 NOT NULL,
ISBN NUMBER(13),
SEND_DATE DATE DEFAULT SYSDATE,
RECEIVE_DATE DATE,
BOOK_ID NUMBER CONSTRAINT BOOK_ID_FK REFERENCES BOOK(BOOK_ID),
RENT_ID NUMBER
);



/*
--�޽��� ���̺�
CREATE TABLE MESSAGE
(
MESSAGE_ID NUMBER PRIMARY KEY,
SENDER_ID VARCHAR2(20) CONSTRAINT MESSAGE_S_FK REFERENCES USER_INFO(USER_ID) NOT NULL,
RECEIVER_ID VARCHAR2(20) CONSTRAINT MESSAGE_R_FK REFERENCES USER_INFO(USER_ID) NOT NULL,
CONTEXT VARCHAR2(4000) NOT NULL ,
TYPE NUMBER(1) DEFAULT 1 NOT NULL,
ISBN NUMBER(13),
SEND_DATE DATE DEFAULT SYSDATE,
RECEIVE_DATE DATE,
BOOK_ID NUMBER CONSTRAINT BOOK_ID_FK REFERENCES BOOK(BOOK_ID),
RENT_ID NUMBER
);
*/
--���̺� ���� Ȯ��
SELECT * FROM USER_INFO;
SELECT * FROM BOOK;
SELECT * FROM RENT_RECORD;
SELECT * FROM MESSAGE;


