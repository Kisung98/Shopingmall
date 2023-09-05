-- 회원번호 시퀀스
CREATE SEQUENCE mem_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;


-- 예약번호 시퀀스
CREATE SEQUENCE res_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;


-- 문의글번호 시퀀스
CREATE SEQUENCE qna_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;


SELECT DISTINCT table_name
FROM all_tables;


-- 회원테이블
CREATE TABLE member2 (
  mem_no NUMBER PRIMARY KEY, --시퀀스사용
  mem_id VARCHAR2(50) NOT NULL , 
  mem_password VARCHAR2(50) NOT NULL ,
  mem_name VARCHAR2(30)NOT NULL ,
  mem_phone VARCHAR2(30)NOT NULL ,
  mem_email VARCHAR2(100)NOT NULL ,
  mem_score NUMBER  ,
  mem_gender VARCHAR2(10)NOT NULL ,
  mem_type NUMBER NOT NULL 
);
SELECT * FROM "MEMBER" m ;

--예약테이블
CREATE TABLE reservation (
  res_no NUMBER  PRIMARY KEY, --시퀀스사용
  mem_no NUMBER NOT NULL ,
  res_date varchar2(50) NOT NULL,   --sysdate로 현재날짜값 입력
  pay_amount NUMBER ,
  res_roomno varchar2(50),
  res_time varchar2(50),
  res_ptotal varchar2(50)
);

DROP TABLE RESERVATION ;


	r.RES_NO ,
		r.RES_DATE ,
		r.pay_amount,
		r.res_ptotal,
		r.RES_ROOMNO,
		r.res_time,


SELECT * FROM RESERVATION r ;

-- 문의 테이블
CREATE TABLE qna1 (
  qna_no NUMBER PRIMARY KEY, --시퀀스사용
  mem_no NUMBER NOT NULL ,
  qna_title VARCHAR2(100)  NOT NULL ,
  qna_date varchar2(50)  NOT NULL ,  --sysdate로 현재날짜값 입력
  qna_content VARCHAR2(1000)  NOT NULL 
);
SELECT * FROM QNA q  ;

-- 공지글번호 시퀀스
CREATE SEQUENCE notice_no
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;


-- 공지 테이블
CREATE TABLE notice1 (
  notice_no NUMBER PRIMARY KEY , -- 시퀀스사용
  notice_title VARCHAR2(100)  NOT NULL ,
  notice_date varchar2(50) NOT NULL,  -- sysdate로 현재날짜값 입력
  notice_content VARCHAR2(1000)  NOT NULL
);
INSERT INTO NOTICE n  VALUES (notice_no.nextval,'제목',TO_CHAR(SYSDATE, 'YYYY-MM-DD'),'내용입니다');
INSERT INTO NOTICE n  VALUES (notice_no.nextval,'제목2',TO_CHAR(SYSDATE, 'YYYY-MM-DD'),'내용입니다');
INSERT INTO NOTICE n  VALUES (notice_no.nextval,'제목3',TO_CHAR(SYSDATE, 'YYYY-MM-DD'),'내용입니다');

SELECT * FROM NOTICE n  ;
DROP TABLE NOTICE ;


-- 댓글 테이블
CREATE TABLE qnacomment (
  qna_no NUMBER,
  mem_no NUMBER,
  cmt_content VARCHAR2(1000),
  cmt_date varchar2(50) -- sysdate로 현재날짜값 입력
);
SELECT * FROM QNACOMMENT ;


-- 결제테이블
CREATE TABLE pay1 (
  mem_no NUMBER NOT NULL ,
  reservation_no NUMBER NOT NULL ,
  pay_price NUMBER NOT NULL ,
  pay_date varchar2(50) NOT NULL  --sysdate로 현재날짜값 입력
);

SELECT * FROM PAY p  ;

Drop sequence