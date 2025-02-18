DROP TABLE ATTACHMENT;
DROP TABLE REPLY;
DROP TABLE BOARD;
DROP TABLE CATEGORY;
DROP TABLE NOTICE;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_UNO; -- 회원번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_NNO; -- 공지사항번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_BNO; -- 게시판번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_RNO; -- 댓글번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_FNO; -- 첨부파일번호 발생시킬 시퀀스

--------------------------------------------------------------------------
------------------------ MEMBER 관련 ---------------------------
--------------------------------------------------------------------

CREATE TABLE MEMBER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(100) NOT NULL,
    USER_NAME VARCHAR2(15) NOT NULL,
    EMAIL VARCHAR2(100),
    BIRTHDAY VARCHAR2(6),
    GENDER VARCHAR2(1) CHECK (GENDER IN ('M','F')),
    PHONE VARCHAR(13),
    ADDRESS VARCHAR2(100),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', 'admin@kh.or.kr','800918','F',  '010-1111-2222','서울시 강남구 역삼동', '2022-02-10', '2022-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user01', 'pass01', '홍길동', 'user01@kh.or.kr','900213','M',  '010-3333-4444','서울시 관악구 신림동', '2024-04-01', '2024-09-04', 'Y');

--------------------------------------------------------------------------
------------------------ BOARD 관련 ---------------------------
--------------------------------------------------------------------

CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_WRITER NUMBER,
    COUNT NUMBER DEFAULT 0,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBER(USER_NO)
);

CREATE SEQUENCE SEQ_BNO
NOCACHE;

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '첫번째 게시판 서비스 시작', '안녕하세요. 1 게시판입니다.', 1, DEFAULT, '20200321', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '두번째 게시판 서비스 시작', '안녕하세요. 2 게시판입니다.', 1, DEFAULT, '20200322', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '하이 게시판 시작할게', '안녕하세요. 3 게시판입니다.', 1, DEFAULT, '20200323', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '안녕 마이바티스는 처음이지?', '안녕하세요. 첫 게시판입니다.', 2, DEFAULT, '20200324', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '어서와 ㅎㅎ', '반갑습니다', 1, DEFAULT, '20200325', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '페이징 처리...해야지...샘플데이터 구욷', '안녕하십니까?', 1, DEFAULT, '20200326', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '게시판 서비스', '안녕하세요. 게시판입니다.', 1, DEFAULT, '20200327', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '샘플데이터', '안녕하세요. 샘플이에요', 2, DEFAULT, '20200328', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '모두 화이팅!!', '화이팅합시다', 1, DEFAULT, '20200329', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '힘내세요!!', '안모두 힘내기~', 1, DEFAULT, '20200330', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '힘내세요 거의다왔어', '프레임워크 시작?', 1, DEFAULT, '20200401', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '시작하겠습니다', '시작해볼까요?', 2, DEFAULT, '20200402', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '마지막게시판입니다.', '안녕하세요 마지막게시판입니다.', 1, DEFAULT, '20200403', DEFAULT);

--------------------------------------------------------------------------
------------------------ REPLY 관련 ---------------------------
--------------------------------------------------------------------

CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    REPLY_CONTENT VARCHAR2(400),
    REF_BNO NUMBER,
    REPLY_WRITER NUMBER,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y','N')),
    FOREIGN KEY (REF_BNO) REFERENCES BOARD(BOARD_NO),
    FOREIGN KEY (REPLY_WRITER) REFERENCES MEMBER(USER_NO)
);

CREATE SEQUENCE SEQ_RNO
NOCACHE;

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '첫번재 댓글입니다.', 1, 2, '20201225', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '첫번재 댓글입니다.', 13, 2, '20210412', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '두번재 댓글입니다.', 13, 2, '20210413', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '마지막 댓글입니다.', 13, 2, '20210414', DEFAULT);

COMMIT;
