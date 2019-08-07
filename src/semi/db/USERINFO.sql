
DROP TABLE USERINFO;
DROP SEQUENCE USERINFOSEQ;

CREATE SEQUENCE USERINFOSEQ;

--유저 기본정보 입니다. 
--가입순서, 기능번호, 이름,닉네임, 아이디 , 비밀번호 ,성별, 나이, 핸드폰번호, 이메일, 가입일자, 유저 조회수(필요없음), 유저 추천수(FAVORITEMUSICIAN TABLE에서 산출 가능), 활성화여부, 보유 캐쉬
CREATE TABLE USERINFO(
	USERINFO_SEQ NUMBER PRIMARY KEY,
	USERINFO_CONTROLNO NUMBER(1) NOT NULL CONSTRAINT CONTROLNOCHECK CHECK (USERINFO_CONTROLNO IN ('0', '1', '2')),
	USERINFO_NAME VARCHAR2(30) NOT NULL,
	USERINFO_NICKNAME VARCHAR2(30) NOT NULL CONSTRAINT NICNAMECHECK UNIQUE,
	USERINFO_ID VARCHAR2(30) NOT NULL CONSTRAINT IDCHECK UNIQUE,
	USERINFO_PASSWORD VARCHAR2(30) NOT NULL,
	USERINFO_SEX CHAR(1) NOT NULL CONSTRAINT SEXCHECK CHECK (USERINFO_SEX IN ('M','F','X')),
	USERINFO_AGE NUMBER(4) NOT NULL,
	USERINFO_PHONENUMBER VARCHAR2(20) NOT NULL,
	USERINFO_EMAIL VARCHAR2(30),
	USERINFO_SIGNDATE DATE DEFAULT SYSDATE CONSTRAINT SIGNDATE NOT NULL,
	USERINFO_ENABLE CHAR(1) DEFAULT 'Y' CONSTRAINT ENABLECHECK CHECK (USERINFO_ENABLE IN ('Y','N')),
	USERINFO_CASH NUMBER DEFAULT '0',
	USERINFO_VIDEOID VARCHAR2(450) DEFAULT ''
);

SELECT USERINFO_SEQ, USERINFO_CONTROLNO, USERINFO_NAME, USERINFO_NICKNAME, USERINFO_ID, USERINFO_PASSWORD, USERINFO_SEX, USERINFO_AGE, USERINFO_PHONENUMBER, USERINFO_EMAIL, USERINFO_SIGNDATE, USERINFO_ENABLE, USERINFO_CASH, USERINFO_VIDEOID FROM USERINFO;

INSERT INTO USERINFO 
	VALUES(USERINFOSEQ.NEXTVAL,'0','조영찬','메롱캬르르','zongyeng','1234','M','27','010-3495-0424','zongyeng1@navre.com',SYSDATE,'Y','0','');

INSERT INTO USERINFO (USERINFO_SEQ, USERINFO_CONTROLNO, USERINFO_NAME, USERINFO_NICKNAME, USERINFO_ID, USERINFO_PASSWORD, USERINFO_SEX, USERINFO_AGE, USERINFO_PHONENUMBER, USERINFO_EMAIL) 
	VALUES(USERINFOSEQ.NEXTVAL,'1','박훈성','pigstar0000','pigstar','12345','M','29','010-1234-5678','pigstar0000@navre.com');

INSERT INTO USERINFO (USERINFO_SEQ, USERINFO_CONTROLNO, USERINFO_NAME, USERINFO_NICKNAME, USERINFO_ID, USERINFO_PASSWORD, USERINFO_SEX, USERINFO_AGE, USERINFO_PHONENUMBER, USERINFO_EMAIL) 
	VALUES(USERINFOSEQ.NEXTVAL,'2','지광현1','ghang0000','ghang','123456','M','26','010-1234-5910','ghang0000@navre.com');
	
DROP SEQUENCE ALBUMSEQ;
DROP TABLE ALBUM;

CREATE SEQUENCE ALBUMSEQ;

--앨범 정보를 입력합니다. 앨범에 속한 노래는 MUSICIANSONG TABLE의 SONGALBUM colum으로 판별합니다.(=앨범이름)
--0번은 싱글곡을 위한 저장소입니다.
--앨범 고유번호, 뮤지션 고유번호, 앨범순서, 앨범 제목, 앨범 곡 수, 앨범 총 런타임, 앨범 설명, 앨범 추가 일자, 앨범 태그, 앨범 활성화 여부. 
CREATE TABLE ALBUM(
	ALBUM_SEQ NUMBER PRIMARY KEY,
	ALBUM_ARTIST NUMBER,
	ALBUM_NO NUMBER,
	ALBUM_TITLE VARCHAR2(100) NOT NULL,
	ALBUM_TRACKS NUMBER NOT NULL,
	ALBUM_LENGTH NUMBER NOT NULL,
	ALBUM_CONTENT VARCHAR2(300) DEFAULT '없음' NOT NULL,
	ALBUM_REGDATE DATE DEFAULT SYSDATE NOT NULL,
	ALBUM_TAG VARCHAR2(300) DEFAULT '미지정' NOT NULL,
	ALBUM_ENABLE CHAR(1) DEFAULT 'Y' CONSTRAINT ALBUM_CHECK CHECK (ALBUM_ENABLE IN ('Y','N')),
	CONSTRAINT ALBUM_FK FOREIGN KEY(ALBUM_ARTIST) REFERENCES USERINFO(USERINFO_SEQ)
);

SELECT ALBUM_SEQ, ALBUM_ARTIST, ALBUM_NO, ALBUM_TITLE, ALBUM_TRACKS, ALBUM_LENGTH, ALBUM_CONTENT, ALBUM_REGDATE, ALBUM_TAG, ALBUM_ENABLE
	FROM ALBUM WHERE ALBUM_ARTIST = '1' ORDER BY ALBUM_NO ASC;

INSERT INTO ALBUM VALUES('0','1','0','SINGLE','0','0','SINGLEMUSIC',SYSDATE,'미지정','N');

INSERT INTO ALBUM VALUES(ALBUMSEQ.NEXTVAL,'2','1','펑키','1','0350','FUNCKYMUSIC',SYSDATE,'FUNCK','Y');

DROP TABLE MUSIC;
DROP SEQUENCE MUSICSEQ;

CREATE SEQUENCE MUSICSEQ;

--뮤지션 노래 정보 입니다. 노래 이름을 '고유번호_노래이름'으로 잡아주세요.
--노래 고유번호, 뮤지션고유번호, 노래등록순서번호, 노래이름, 파일용량, 파일길이, 하이라이트 시작 시간, 노래설명, 작곡가, 작사가, 등록일자, 총조회수(SONGSTATISTICS TABLE에서 확인 가능), 총추천수(FAVORITEMUSIC TABLE에서 산출 가능), 태그, 활성화여부, 앨범 속함 여부 
CREATE TABLE MUSIC(
	MUSIC_SEQ NUMBER PRIMARY KEY,
	MUSIC_ARTIST NUMBER,
	MUSIC_NO NUMBER,
	MUSIC_TITLE VARCHAR2(100) NOT NULL,
	MUSIC_SIZE NUMBER NOT NULL,
	MUSIC_LENGTH NUMBER NOT NULL,
	MUSIC_HL_TIME NUMBER DEFAULT '0' NOT NULL,
	MUSIC_CONTENT VARCHAR2(300) DEFAULT '없음' NOT NULL,
	MUSIC_COMPOSER VARCHAR2(100) DEFAULT '미상'  NOT NULL,
	MUSIC_LYRICIST VARCHAR2(100) DEFAULT '미상' NOT NULL,
	MUSIC_REGDATE DATE DEFAULT SYSDATE NOT NULL,
	MUSIC_TAG VARCHAR2(300) DEFAULT '미지정',
	MUSIC_ENABLE CHAR(1) DEFAULT 'Y' CONSTRAINT MUSIC_CHECK CHECK (MUSIC_ENABLE IN ('Y','N')),
	MUSIC_ALBUM NUMBER DEFAULT '0',
	CONSTRAINT MUSIC_FK FOREIGN KEY(MUSIC_ARTIST) REFERENCES USERINFO(USERINFO_SEQ),
	CONSTRAINT MUSIC_ALBUM_FK FOREIGN KEY(MUSIC_ALBUM) REFERENCES ALBUM(ALBUM_SEQ)
);

SELECT MUSIC_SEQ, MUSIC_ARTIST, MUSIC_NO, MUSIC_TITLE, MUSIC_SIZE, MUSIC_LENGTH, MUSIC_HL_TIME, MUSIC_CONTENT, MUSIC_COMPOSER, MUSIC_LYRICIST, MUSIC_REGDATE, MUSIC_TAG, MUSIC_ENABLE, MUSIC_ALBUM 
	FROM MUSIC WHERE MUSIC_ARTIST='2' ORDER BY MUSIC_NO;

INSERT INTO MUSIC
	VALUES(MUSICSEQ.NEXTVAL,'2','1','2_FUNKEYMUSIC','13','0350','0123','펑키뮤직!','박훈성','조영찬',SYSDATE,'funky','Y','1');

INSERT INTO MUSIC (MUSIC_SEQ, MUSIC_ARTIST, MUSIC_NO, MUSIC_TITLE, MUSIC_SIZE, MUSIC_LENGTH)
	VALUES(MUSICSEQ.NEXTVAL,'2','2','2_SMILEDAY','12.23','0401');

DROP TABLE SONGSTATISTICS;

--노래의 조회수와 추천수를 계산하고 기간별 통계낼 수 있는 테이블입니다.
--노래 고유번호, 조회 일자, 추천여부(추천 통계 지원 안하겠음.)
CREATE TABLE SONGSTATISTICS(
	SONGSTATISTICS_SONGSEQ NUMBER,
	SONGSTATISTICS_SONGVIEW DATE DEFAULT SYSDATE NOT NULL,
	CONSTRAINT SONGSEQFK FOREIGN KEY(SONGSTATISTICS_SONGSEQ) REFERENCES MUSIC(MUSIC_SEQ) ON DELETE CASCADE
);

INSERT INTO SONGSTATISTICS (SONGSTATISTICS_SONGSEQ) VALUES('1');

INSERT INTO SONGSTATISTICS (SONGSTATISTICS_SONGSEQ) VALUES('1');

INSERT INTO SONGSTATISTICS (SONGSTATISTICS_SONGSEQ) VALUES('1');

INSERT INTO SONGSTATISTICS (SONGSTATISTICS_SONGSEQ) VALUES('2');

INSERT INTO SONGSTATISTICS (SONGSTATISTICS_SONGSEQ) VALUES('2');

INSERT INTO SONGSTATISTICS (SONGSTATISTICS_SONGSEQ) VALUES('2');



DROP SEQUENCE TIMELINENOSEQ;
DROP TABLE TIMELINE;

CREATE SEQUENCE TIMELINENOSEQ;

--타임라인과 댓글기능을 따로 만듭니다.
--타임라인개시물 고유번호, 뮤지션 고유번호, 타임라인개시물 순서, 제목, 내용, 기록일자
--타임라인 내용을 삭제하면 유지하지 않습니다. 비공개도 제공하지 않습니다. 
CREATE TABLE TIMELINE(
	TIMELINE_SEQ NUMBER PRIMARY KEY,
	TIMELINE_MUSICIANSEQ NUMBER,
	TIMELINE_NO NUMBER,
	TIMELINE_TTITLE VARCHAR2(2000) NOT NULL,
	TIMELINE_CONTENT VARCHAR2(4000) NOT NULL,
	TIMELINE_REGDATE DATE NOT NULL,
	CONSTRAINT TIMELINEFK FOREIGN KEY(TIMELINE_MUSICIANSEQ) REFERENCES USERINFO(USERINFO_SEQ)
);

SELECT TIMELINE_SEQ, TIMELINE_MUSICIANSEQ, TIMELINE_NO, TIMELINE_TTITLE, TIMELINE_CONTENT, TIMELINE_REGDATE FROM TIMELINE WHERE TIMELINE_MUSICIANSEQ='2' ORDER BY TIMELINE_NO DESC;

INSERT INTO TIMELINE VALUES(TIMELINENOSEQ.NEXTVAL,'2','1','기부니가 너무 좋소.','아름다운 19년 7월 23일 18시49분이야~',SYSDATE);

INSERT INTO TIMELINE VALUES(TIMELINENOSEQ.NEXTVAL,'2','2','담배피고와서 기부니가 너무 좋소.','꽃같이 아름다운 19년 7월 23일 19시04분이야~',SYSDATE);


DROP SEQUENCE BOARDNOSEQ;
DROP SEQUENCE GROUPNOSEQ;
DROP TABLE TIMELINECOMMENT;

CREATE SEQUENCE BOARDNOSEQ;
CREATE SEQUENCE GROUPNOSEQ;

--어떤 타임라인(모든 타임라인중)의 댓글인가만 구분하여 뽑아내세요. 테이블의 데이터가 굉장히 많아질 수 있겠네요 ㅜㅜ... 하지만 테이블이 많아지는것 보다는 확실히 좋은것 같습니다.
--타임라인개시물 고유번호, 댓글 개수, 댓글 번호, 댓글 번호안의 댓글 순서, 댓글 깊이(0:본문 1:0의 댓글 2:1의 댓글), 제목, 내용, 작성자, 작성일 
CREATE TABLE TIMELINECOMMENT(
	TIMELINECOMMENT_TIMELINESEQ NUMBER,
	TIMELINECOMMENT_BOARDNO NUMBER PRIMARY KEY,
	TIMELINECOMMENT_GROUPNO NUMBER NOT NULL,
	TIMELINECOMMENT_GROUPSQ NUMBER NOT NULL,
	TIMELINECOMMENT_TITLETAB NUMBER NOT NULL,
	TIMELINECOMMENT_TITLE VARCHAR2(60) NOT NULL,
	TIMELINECOMMENT_CONTENT VARCHAR2(1000) NOT NULL,
	TIMELINECOMMENT_WRITER VARCHAR2(30) NOT NULL,
	TIMELINECOMMENT_REGDATE DATE NOT NULL,
	CONSTRAINT TIMELINECOMMENTFK FOREIGN KEY(TIMELINECOMMENT_TIMELINESEQ) REFERENCES TIMELINE(TIMELINE_SEQ)
);

SELECT TIMELINECOMMENT_TIMELINESEQ,TIMELINECOMMENT_BOARDNO,TIMELINECOMMENT_GROUPNO,TIMELINECOMMENT_GROUPSQ,TIMELINECOMMENT_TITLETAB,TIMELINECOMMENT_TITLE,TIMELINECOMMENT_CONTENT,TIMELINECOMMENT_WRITER,TIMELINECOMMENT_REGDATE FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_TIMELINESEQ='1' ORDER BY TIMELINECOMMENT_GROUPNO DESC, TIMELINECOMMENT_GROUPSQ;

INSERT INTO TIMELINECOMMENT VALUES('1',BOARDNOSEQ.NEXTVAL, GROUPNOSEQ.NEXTVAL,1,0,'1번글','1번글 내용','1번',SYSDATE);
INSERT INTO TIMELINECOMMENT VALUES('1',BOARDNOSEQ.NEXTVAL, GROUPNOSEQ.NEXTVAL,1,0,'2번글','2번글 내용','2번',SYSDATE);
INSERT INTO TIMELINECOMMENT VALUES('1',BOARDNOSEQ.NEXTVAL, GROUPNOSEQ.NEXTVAL,1,0,'3번글','3번글 내용','3번',SYSDATE);
INSERT INTO TIMELINECOMMENT VALUES('1',BOARDNOSEQ.NEXTVAL, GROUPNOSEQ.NEXTVAL,1,0,'4번글','4번글 내용','4번',SYSDATE);
INSERT INTO TIMELINECOMMENT VALUES('1',BOARDNOSEQ.NEXTVAL, GROUPNOSEQ.NEXTVAL,1,0,'5번글','5번글 내용','5번',SYSDATE);

INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=5),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=5)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=5)+1,
	'RE:5번글-1','5번글-1 답변 내용','6유저',SYSDATE
);


UPDATE TIMELINECOMMENT SET TIMELINECOMMENT_GROUPSQ = TIMELINECOMMENT_GROUPSQ+1 
	WHERE TIMELINECOMMENT_GROUPNO = (SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 5) 
	AND TIMELINECOMMENT_GROUPSQ > (SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 5);
INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=5),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=5)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=5)+1,
	'RE:5번글-2','5번글-2 답변 내용','7유저',SYSDATE
);

UPDATE TIMELINECOMMENT SET TIMELINECOMMENT_GROUPSQ = TIMELINECOMMENT_GROUPSQ+1 
	WHERE TIMELINECOMMENT_GROUPNO = (SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 7) 
	AND TIMELINECOMMENT_GROUPSQ > (SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 7);
INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=7),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=7)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=7)+1,
	'RE:RE:5번글-2','5번글-2 답변 내용','8유저',SYSDATE
);

INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=4),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=4)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=4)+1,
	'RE:4번글-1','4번글-1 답변 내용','9유저',SYSDATE
);

UPDATE TIMELINECOMMENT SET TIMELINECOMMENT_GROUPSQ = TIMELINECOMMENT_GROUPSQ+1 
	WHERE TIMELINECOMMENT_GROUPNO = (SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 9) 
	AND TIMELINECOMMENT_GROUPSQ > (SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 9);
INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=9),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=9)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=9)+1,
	'RE:RE:4번글-1','4번글-1 답변 내용','10유저',SYSDATE
);

UPDATE TIMELINECOMMENT SET TIMELINECOMMENT_GROUPSQ = TIMELINECOMMENT_GROUPSQ+1 
	WHERE TIMELINECOMMENT_GROUPNO = (SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 4) 
	AND TIMELINECOMMENT_GROUPSQ > (SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 4);
INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=4),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=4)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=4)+1,
	'RE:4번글-2','4번글-2 답변 내용','11유저',SYSDATE
);

UPDATE TIMELINECOMMENT SET TIMELINECOMMENT_GROUPSQ = TIMELINECOMMENT_GROUPSQ+1 
	WHERE TIMELINECOMMENT_GROUPNO = (SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 11) 
	AND TIMELINECOMMENT_GROUPSQ > (SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO = 11);
INSERT INTO TIMELINECOMMENT VALUES(
	'1',
	BOARDNOSEQ.NEXTVAL,
	(SELECT TIMELINECOMMENT_GROUPNO FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=11),
	(SELECT TIMELINECOMMENT_GROUPSQ FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=11)+1,
	(SELECT TIMELINECOMMENT_TITLETAB FROM TIMELINECOMMENT WHERE TIMELINECOMMENT_BOARDNO=11)+1,
	'RE:RE:4번글-2','4번글-2 답변 내용','12유저',SYSDATE
);


DROP TABLE FAVORITEMUSICIAN;
DROP TABLE FAVORITEMUSIC;
DROP TABLE MYMUSICLIST;

--USERSEQ가 MUSICIANSEQ추천.
--내 고유번호, 상대 고유번호.
CREATE TABLE FAVORITEMUSICIAN(
	FAVORITEMUSICIAN_USERSEQ NUMBER NOT NULL,
	FAVORITEMUSICIAN_MUSICIANSEQ NUMBER NOT NULL,
	CONSTRAINT FAVORITEMUSICIANFK FOREIGN KEY(FAVORITEMUSICIAN_MUSICIANSEQ) REFERENCES USERINFO(USERINFO_SEQ)
);

--USERSEQ가 MUSICIANSEQ추천.
--내 고유번호, 노래의 고유번호.
CREATE TABLE FAVORITEMUSIC(
	FAVORITEMUSIC_USERSEQ NUMBER NOT NULL,
	FAVORITEMUSIC_MUSICIANSONGSEQ NUMBER NOT NULL,
	FAVORITEMUSIC_DATE DATE DEFAULT SYSDATE NOT NULL,
	CONSTRAINT FAVORITEMUSICFK FOREIGN KEY(FAVORITEMUSIC_MUSICIANSONGSEQ) REFERENCES MUSIC(MUSIC_SEQ)
);

INSERT INTO FAVORITEMUSIC VALUES('1','1',SYSDATE);
INSERT INTO FAVORITEMUSIC VALUES('1','2',SYSDATE);

--USERSEQ가 MUSICIANSEQ추천.
--내 고유번호, 노래의 고유번호.
CREATE TABLE MYMUSICLIST(
	MYMUSICLIST_USERSEQ NUMBER NOT NULL,
	MYMUSICLIST_MUSICIANSONGSEQ NUMBER NOT NULL,
	CONSTRAINT MYMUSICLIST FOREIGN KEY(MYMUSICLIST_MUSICIANSONGSEQ) REFERENCES MUSIC(MUSIC_SEQ)
);




