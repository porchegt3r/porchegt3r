1) 테이블 구조 
DROP TABLE member2 PURGE; 
 
-- version 3.0  
CREATE TABLE member22 ( 
    id       VARCHAR(10) NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   VARCHAR(20) NOT NULL, -- 패스워드, 영숫자 조합 
    mname    VARCHAR(20) NOT NULL, -- 성명, 한글 10자 저장 가능 
    tel      VARCHAR(14)     NULL, -- 전화번호 
    email    VARCHAR(50) NOT NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode  VARCHAR(7)      NULL, -- 우편번호, 101-101 
    address1 VARCHAR(150)     NULL, -- 주소 1 
    address2 VARCHAR(50)     NULL, -- 주소 2 
    job      VARCHAR(20) NOT NULL, -- 직업 
    mdate    DATE        NOT NULL, -- 가입일     
    fname    VARCHAR(50) DEFAULT 'member2.jpg', -- 회원 사진
    grade    CHAR(1)     DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 
 
 
※ 제약 조건 
- NOT NULL: INSERT SQL에서 필수 입력. 
- UNIQUE  : 컬럼에 중복된 값이 올 수 없음. 
- PRIMARY KEY (id): 기본적으로 UNIQUE의 성질을 포함하면서 레코드를 
  구분하는 기준 컬럼의 값. 
 
 select *from member2
 
2) 기초 데이터 추가 
       
DELETE FROM member2; 
       
INSERT INTO member2(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'member.jpg', 'H'); 
 
INSERT INTO member2(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',  
'123-123','광명시','남동구' ,'A01', sysdate, 'member.jpg', 'H'); 
 
INSERT INTO member2(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user3', '1234', '개발자3', '123-1234', 'email3@mail.com',  
'123-123','용인시','남동구' ,'A01', sysdate, 'member.jpg', 'H'); 

INSERT INTO member2(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('admin', '1234', '관리자', '123-1234', 'admin@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'member.jpg', 'A'); 

 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade 
FROM member2 
ORDER BY id ASC; 
 
   
3) 중복 아이디 검사 관련 SQL 
    -- 0: 중복 아님, 1: 중복  
 
SELECT COUNT(id)  
FROM member2  
WHERE id='user1'; 
 
 COUNT(ID)
 ---------
         1
 
         
SELECT COUNT(id) as cnt  
FROM member2  
WHERE id='user1'; 
 
 CNT
 ---
   1
   
   
   
4) 이메일 중복 확인
   SELECT COUNT(email) as cnt  
   FROM member2  
   WHERE email='email1@mail.com'; 
 
 
   
5) 회원 전체 목록 
- LIKE    : 정확하게 일치하지 않아도 출력 
- =(equal): 정확하게 일치해야 출력 
 
- 검색을 하지 않는 경우, 전체 목록 출력 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member2 
ORDER BY id ASC;   -- id 컬럼값으로 오름차순 정렬, DESC: 내림 차순 
 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member2 
WHERE id LIKE '%%' -- 검색어가 없음으로 전체 레코드 출력 
ORDER BY id ASC;   -- id 컬럼값으로 오름차순 정렬, DESC: 내림 차순 
 


SELECT id,  mname, tel, email, job, mdate, fname, r
from(
	SELECT id,  mname, tel, email, job, mdate, fname, rownum as r
	from(
		SELECT id,  mname, tel, email, job, mdate, fname
			FROM member2  
	where id like '%user1%'
	ORDER BY mdate DESC
) ) where r>=1 and r <= 5
 

select * from member2


delete from member2
where id = 'user11'
 
 
6) user1 회원 정보 보기 
 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member2  
WHERE id='user1'; 
 
 
 
7) 회원 이미지의 수정
UPDATE member2 
SET fname='' 
WHERE id='user1'; 
 
 
 
8) 패스워드 변경
UPDATE member2
SET passwd='1234'
WHERE id='';
 
SELECT id, mname, passwd
FROM member2
ORDER BY id DESC;
 
 
 
9) 회원 정보 수정 
 
UPDATE member2  
SET passwd='TEST',mname='TEST', tel='123-123', email='email10',zipcode='TEST',  
    address1='수원', address2='팔달구', job='TEST', grade = 'C' 
WHERE id = 'user3'; 
 
 
-- 모든 컬럼 전부 출력, 개발시는 비권장
SELECT * FROM member2; 
 
- 이미지 수정 
UPDATE member2 
SET fname = '' 
WHERE id=''; 
 
 
 
10) 'user3' 회원 삭제 
 
DELETE FROM member2 WHERE id='user3'; 
 
SELECT * FROM member2; 
 
 
 
11) 모든 회원 삭제(권장 아님) 
   - DELETE는 항상 대부분 WHERE 조건을 같이 사용합니다. 
 
DELETE FROM member2; 
 
 
 
12) 로그인 관련 SQL 
  
SELECT COUNT(id) as cnt 
FROM member2 
WHERE id = 'user1' AND passwd = '1234';  