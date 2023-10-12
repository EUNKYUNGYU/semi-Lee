DROP TABLE REPORT;
DROP TABLE REPORT_BOARD;
DROP TABLE REPORT_COMMENT;
DROP TABLE REPORT_MESSAGE;
DROP TABLE REPORT_TYPE;
DROP TABLE TB_BOARD_TYPE;
DROP TABLE TB_BOOKMARK;
DROP TABLE TB_CLI;
DROP TABLE TB_CLI_CATE;
DROP TABLE TB_CLI_DATE;
DROP TABLE TB_CLI_RES;
DROP TABLE TB_CLI_REV;
DROP TABLE TB_CLI_TIME;
DROP TABLE TB_COMMENT;
DROP TABLE TB_COU;
DROP TABLE TB_COU_CATE;
DROP TABLE TB_COU_DATE;
DROP TABLE TB_COU_RES;
DROP TABLE TB_COU_REV;
DROP TABLE TB_COU_TIME;
DROP TABLE TB_COU_VIDEO;
DROP TABLE TB_CUS_SER;
DROP TABLE TB_DISEASE;
DROP TABLE TB_DOCTOR;
DROP TABLE TB_FAMILY;
DROP TABLE TB_FILE;
DROP TABLE TB_FM_DIARY;
DROP TABLE TB_GUEST;
DROP TABLE TB_HOS_REVIEW;
DROP TABLE TB_MED_MAN;
DROP TABLE TB_MED_NOTI;
DROP TABLE TB_MY_DIARY;
DROP TABLE TB_POINT;
DROP TABLE TB_PRE_MED;
DROP TABLE TB_PRESCRIPTION;
DROP TABLE TB_QUIZE_BOARD;
DROP TABLE TB_QUIZE_CHOICE;
DROP TABLE TB_REC_MED;
DROP TABLE TB_RESERVATION;
DROP TABLE TB_TEST;
DROP TABLE TB_TEST_O;
DROP TABLE TB_TEST_Q;
DROP TABLE TB_TEST_R;
DROP TABLE TB_TEST_SCORE;
DROP TABLE TB_TREAT_DEPARTMENT;
DROP TABLE TB_COU_CAR;
DROP TABLE TB_LIKE;
DROP TABLE TB_MESSAGE;
DROP TABLE TB_ALLERGY;
DROP TABLE TB_MED;
DROP TABLE TB_HOSPITAL;
DROP TABLE TB_MEMBER;
DROP TABLE TB_BOARD;


DROP SEQUENCE SEQ_CCAR_NO;
DROP SEQUENCE SEQ_CCATE_NO;
DROP SEQUENCE SEQ_CLI_CATE_NO;
DROP SEQUENCE SEQ_CLI_DATE_NO;
DROP SEQUENCE SEQ_CLI_NO;
DROP SEQUENCE SEQ_CLI_RES_NO;
DROP SEQUENCE SEQ_CLI_REV_NO;
DROP SEQUENCE SEQ_CLI_TIME_NO;
DROP SEQUENCE SEQ_COU_DATE_NO;
DROP SEQUENCE SEQ_COU_NO;
DROP SEQUENCE SEQ_COU_RES_NO;
DROP SEQUENCE SEQ_COU_REV_NO;
DROP SEQUENCE SEQ_COU_TIME_NO;
DROP SEQUENCE SEQ_CVIDEO_NO;
DROP SEQUENCE SEQ_TEST_NO;
DROP SEQUENCE SEQ_TQNO;
DROP SEQUENCE SEQ_TSCORE_NO;
DROP SEQUENCE SEQ_DOC_NO;
DROP SEQUENCE SEQ_GUEST_RSVT_NO;
DROP SEQUENCE SEQ_HOS_NO;
DROP SEQUENCE SEQ_HOS_RV_NO;
DROP SEQUENCE SEQ_RSVT_NO;
DROP SEQUENCE SEQ_TREAT_NO;
DROP SEQUENCE SEQ_QUIZE_NO;

CREATE SEQUENCE SEQ_DOC_NO;
CREATE SEQUENCE SEQ_GUEST_RSVT_NO;
CREATE SEQUENCE SEQ_HOS_NO;
CREATE SEQUENCE SEQ_HOS_RV_NO;
CREATE SEQUENCE SEQ_RSVT_NO;
CREATE SEQUENCE SEQ_TREAT_NO;

CREATE TABLE  TB_MEMBER  (
	 MEM_NO 	NUMBER	NOT NULL,
	 MEM_ID 	VARCHAR2(20)	NOT NULL,
	 MEM_PWD 	VARCHAR2(16)	NOT NULL,
	 MEM_NAME 	VARCHAR2(16)	NOT NULL,
	 NICKNAME 	VARCHAR2(20)	NOT NULL,
	 PHONE 	VARCHAR2(11)	NOT NULL,
	 INUM 	VARCHAR2(13)	NOT NULL,
	 EMAIL 	VARCHAR2(50)	NULL,
	 GENDER 	VARCHAR2(1)	NULL,
	 HEIGHT 	NUMBER	NULL,
	 WEIGHT 	NUMBER	NULL,
	 CREATE_DATE 	DATE		DEFAULT SYSDATE NOT NULL,
	 MODIFY_DATE 	DATE		DEFAULT SYSDATE NOT NULL,
	 STATUS 	VARCHAR2(1)		DEFAULT 'Y' NOT NULL
);

CREATE TABLE  TB_HOSPITAL  (
	 HOS_NO 	NUMBER	NOT NULL,
	 HOS_ID 	VARCHAR2(30)	NOT NULL,
	 HOS_PWD 	VARCHAR2(100)	NOT NULL,
	 HOS_NAME 	VARCHAR2(1000)	NOT NULL,
	 HOS_ADDRESS 	VARCHAR2(300)	NOT NULL,
	 TREAT_DEP 	NUMBER	NOT NULL,
	 TREAT_DATE 	VARCHAR2(70)	NOT NULL,
	 TREAT_BEGIN 	VARCHAR2(40)	NOT NULL,
	 TREAT_END 	VARCHAR2(40)	NOT NULL,
	 HOS_TEL 	VARCHAR2(30)	NOT NULL,
	 HOS_INFO 	VARCHAR2(2000)	NULL,
	 CREATE_DATE 	DATE	DEFAULT SYSDATE NOT NULL,
	 MODITY_DATE 	DATE DEFAULT SYSDATE NULL,
	 STATUS 	VARCHAR2(1)	NOT NULL
);

CREATE TABLE  TB_TREAT_DEPARTMENT  (
	 TREAT_NO 	NUMBER	NOT NULL,
	 TREAT_NAME 	VARCHAR2(100)	NOT NULL
);

CREATE TABLE  TB_DOCTOR  (
	 DOCTOR_NO 	NUMBER	NOT NULL,
	 TREAT_DEP 	NUMBER	NOT NULL,
	 DOCTOR_NAME 	VARCHAR2(15)	NOT NULL,
	 TREAT_DATE 	VARCHAR2(100)	NOT NULL,
	 TREAT_TIME 	VARCHAR2(100)	NOT NULL
);

CREATE TABLE  TB_RESERVATION  (
	 RSVT_NO 	NUMBER	NOT NULL,
	 RSVT_HOS 	NUMBER	NOT NULL,
	 RSVT_DOCTOR 	NUMBER	NOT NULL,
	 RSVT_MEM 	NUMBER	NOT NULL,
	 RSVT_DATE 	VARCHAR2(100)	NULL,
	 RSVT_TIME 	VARCHAR2(100)	NULL
);

CREATE TABLE  TB_GUEST  (
	 RES_NO 	NUMBER	NOT NULL,
	 DOCTOR_NO 	NUMBER	NOT NULL,
	 NM_NAME 	VARCHAR2(30)	NULL,
	 NM_INUM 	VARCHAR2(14)	NULL,
	 PHONE 	VARCHAR2(13)	NULL,
	 RSVT_DATE 	DATE	NULL,
	 RSVT_TIME 	VARCHAR(255)	NULL
);

CREATE TABLE  TB_HOS_REVIEW  (
	 REVIEW_NO 	NUMBER	NOT NULL,
	 REVIEW_HOS 	NUMBER	NOT NULL,
	 REVIEW_WRITER 	NUMBER	NOT NULL,
	 CONTENT 	VARCHAR2(4000)	NOT NULL,
	 SCOPE 	NUMBER	DEFAULT 0	NOT NULL,
	 CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	 STATUS  VARCHAR2(1) DEFAULT 'Y'	NULL
);


CREATE TABLE  TB_BOOKMARK  (
	 HOS_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 ADD_DATE 	DATE DEFAULT SYSDATE NULL	
);

CREATE TABLE  TB_COU_VIDEO  (
	 VIDEO_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 VIDEO_TITLE 	VARCHAR2(400)	NOT NULL,
	 CHANNEL_NAME 	VARCHAR2(400)	NOT NULL,
	 VIDEO_ADDRESS 	VARCHAR2(4000)	NOT NULL
);

COMMENT ON COLUMN TB_COU_VIDEO.VIDEO_NO IS '영상번호';
COMMENT ON COLUMN TB_COU_VIDEO.MEM_NO IS '작성자 회원번호';
COMMENT ON COLUMN TB_COU_VIDEO.VIDEO_TITLE IS '영상 제목';
COMMENT ON COLUMN TB_COU_VIDEO.CHANNEL_NAME IS '채널명';
COMMENT ON COLUMN TB_COU_VIDEO.VIDEO_ADDRESS IS '영상주소';

CREATE SEQUENCE SEQ_CVIDEO_NO;


CREATE TABLE  TB_COU  (
	 COU_NO 	NUMBER	NOT NULL,
	 HOS_NO 	NUMBER	NOT NULL,
	 COU_NAME 	VARCHAR2(20)	NOT NULL,
	 PHONE 	VARCHAR2(13)	NULL,
	 ORIGIN_NAME 	VARCHAR2(255)	NOT NULL,
	 CHANGE_NAME 	VARCHAR2(255)	NOT NULL,
	 PROFILE_PATH 	VARCHAR2(1000)	NOT NULL
);

COMMENT ON COLUMN TB_COU.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU.HOS_NO IS '병원번호(소속)';
COMMENT ON COLUMN TB_COU.COU_NAME IS '상담사 이름';
COMMENT ON COLUMN TB_COU.PHONE IS '전화번호';
COMMENT ON COLUMN TB_COU.ORIGIN_NAME IS '프로필 사진 원본명';
COMMENT ON COLUMN TB_COU.CHANGE_NAME IS '프로필 사진 수정명';
COMMENT ON COLUMN TB_COU.PROFILE_PATH IS '프로필 사진 경로';

CREATE SEQUENCE SEQ_COU_NO;


CREATE TABLE  TB_COU_CAR  (
	 CAR_NO 	NUMBER	NOT NULL,
	 COU_NO 	NUMBER	NOT NULL,
	 CAR_CONTENT 	VARCHAR2(500)	NOT NULL
);

COMMENT ON COLUMN TB_COU_CAR.CAR_NO IS '경력 번호';
COMMENT ON COLUMN TB_COU_CAR.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU_CAR.CAR_CONTENT IS '경력 및 자격';

CREATE SEQUENCE SEQ_CCAR_NO;


CREATE TABLE TB_COU_CATE (
	CATE_NO	NUMBER	NOT NULL,
	COU_NO	NUMBER	CHECK(COU_NO IN(1, 2)) NOT NULL ,
	PRICE	NUMBER	NULL,
	COU_CATE	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_COU_CATE.CATE_NO IS '입력 순서';
COMMENT ON COLUMN TB_COU_CATE.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU_CATE.PRICE IS '가격';
COMMENT ON COLUMN TB_COU_CATE.COU_CATE IS '카테고리 번호';

CREATE SEQUENCE SEQ_CCATE_NO;

CREATE TABLE  TB_COU_REV  (
	 REV_NO 	NUMBER	NOT NULL,
	 COU_NO 	NUMBER	NOT NULL,
	 COU_CATE 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 REV_CONTENT 	VARCHAR2(4000)	NULL,
	 CREATE_DATE 	DATE DEFAULT SYSDATE	NULL,
	 COU_SCOPE 	NUMBER DEFAULT 0	NOT NULL	
);

COMMENT ON COLUMN TB_COU_REV.REV_NO IS '리뷰 번호';
COMMENT ON COLUMN TB_COU_REV.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU_REV.COU_CATE IS '상담 카테고리 번호';
COMMENT ON COLUMN TB_COU_REV.MEM_NO IS '예약 회원 번호';
COMMENT ON COLUMN TB_COU_REV.REV_CONTENT IS '리뷰내용';
COMMENT ON COLUMN TB_COU_REV.CREATE_DATE IS '작성일';
COMMENT ON COLUMN TB_COU_REV.COU_SCOPE IS '평점';

CREATE SEQUENCE SEQ_COU_REV_NO;

CREATE TABLE  TB_COU_DATE  (
	 DATE_NO 	NUMBER	NOT NULL,
	 COU_NO 	NUMBER	NOT NULL,
	 COU_DATE 	DATE	NOT NULL
);

COMMENT ON COLUMN TB_COU_DATE.DATE_NO IS '날짜 번호';
COMMENT ON COLUMN TB_COU_DATE.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU_DATE.COU_DATE IS '날짜';

CREATE SEQUENCE SEQ_COU_DATE_NO;


CREATE TABLE  TB_COU_TIME  (
	 TIME_NO 	NUMBER	NOT NULL,
	 COU_NO 	NUMBER	NOT NULL,
	 COU_TIME 	VARCHAR2(10)	NOT NULL
);

COMMENT ON COLUMN TB_COU_TIME.TIME_NO IS '시간 번호';
COMMENT ON COLUMN TB_COU_TIME.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU_TIME.COU_TIME IS '시간';

CREATE SEQUENCE SEQ_COU_TIME_NO;


CREATE TABLE  TB_COU_RES  (
	 RES_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 COU_NO 	NUMBER	NOT NULL,
	 COU_CATE 	NUMBER	NOT NULL,
	 DATE_NO 	NUMBER	NOT NULL,
	 TIME_NO 	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_COU_RES.RES_NO IS '예약 번호';
COMMENT ON COLUMN TB_COU_RES.MEM_NO IS '예약 회원 번호';
COMMENT ON COLUMN TB_COU_RES.COU_NO IS '상담사 번호';
COMMENT ON COLUMN TB_COU_RES.COU_CATE IS '상담 카테고리';
COMMENT ON COLUMN TB_COU_RES.DATE_NO IS '예약 날짜 번호';
COMMENT ON COLUMN TB_COU_RES.TIME_NO IS '예약 시간 번호';

CREATE SEQUENCE SEQ_COU_RES_NO;


CREATE TABLE  TB_CLI_CATE  (
	 CATE_NO 	NUMBER	NOT NULL,
	 CLI_CATE 	VARCHAR2(100)	NULL
);

COMMENT ON COLUMN TB_CLI_CATE.CATE_NO IS '카테고리 번호';
COMMENT ON COLUMN TB_CLI_CATE.CLI_CATE IS '카테고리명';

CREATE SEQUENCE SEQ_CLI_CATE_NO;

CREATE TABLE  TB_CLI  (
	 CLI_NO 	NUMBER	NOT NULL,
	 HOS_NO 	NUMBER	NOT NULL,
	 CATE_NO 	NUMBER	NOT NULL,
	 CLI_NAME 	VARCHAR2(100)	NOT NULL,
	 CLI_PRICE 	NUMBER	NULL,
	 ORIGIN_NAME 	VARCHAR2(255)	NOT NULL,
	 CHANGE_NAME 	VARCHAR2(255)	NOT NULL,
	 DES_PATH 	VARCHAR2(1000)	NOT NULL
);

COMMENT ON COLUMN TB_CLI.CLI_NO IS '클리닉 번호';
COMMENT ON COLUMN TB_CLI.HOS_NO IS '병원 번호(소속)';
COMMENT ON COLUMN TB_CLI.CATE_NO IS '클리닉 카테고리 번호';
COMMENT ON COLUMN TB_CLI.CLI_NAME IS '클리닉명';
COMMENT ON COLUMN TB_CLI.CLI_PRICE IS '클리닉 가격';
COMMENT ON COLUMN TB_CLI.ORIGIN_NAME IS '상세정보 원본명';
COMMENT ON COLUMN TB_CLI.CHANGE_NAME IS '상세정보 수정명';
COMMENT ON COLUMN TB_CLI.DES_PATH IS '상세정보 경로';

CREATE SEQUENCE SEQ_CLI_NO;


CREATE TABLE  TB_CLI_DATE  (
	 DATE_NO 	NUMBER	NOT NULL,
	 CLI_NO 	NUMBER	NOT NULL,
	 CLI_DATE 	DATE	NOT NULL
);

COMMENT ON COLUMN TB_CLI_DATE.DATE_NO IS '날짜 번호';
COMMENT ON COLUMN TB_CLI_DATE.CLI_NO IS '클리닉 번호';
COMMENT ON COLUMN TB_CLI_DATE.CLI_DATE IS '날짜';

CREATE SEQUENCE SEQ_CLI_DATE_NO;


CREATE TABLE  TB_CLI_TIME  (
	 TIME_NO 	NUMBER	NOT NULL,
	 CLI_NO 	NUMBER	NOT NULL,
	 CLI_TIME 	VARCHAR2(10)	NOT NULL
);

COMMENT ON COLUMN TB_CLI_TIME.TIME_NO IS '시간 번호';
COMMENT ON COLUMN TB_CLI_TIME.CLI_NO IS '클리닉 번호';
COMMENT ON COLUMN TB_CLI_TIME.CLI_TIME IS '시간';

CREATE SEQUENCE SEQ_CLI_TIME_NO;

CREATE TABLE  TB_CLI_RES  (
	 RES_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 CLI_NO 	NUMBER	NOT NULL,
	 DATE_NO 	NUMBER	NOT NULL,
	 TIME_NO 	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_CLI_RES.RES_NO IS '예약 번호';
COMMENT ON COLUMN TB_CLI_RES.MEM_NO IS '예약 회원 번호';
COMMENT ON COLUMN TB_CLI_RES.CLI_NO IS '클리닉 번호';
COMMENT ON COLUMN TB_CLI_RES.DATE_NO IS '날짜 번호';
COMMENT ON COLUMN TB_CLI_RES.TIME_NO IS '시간 번호';

CREATE SEQUENCE SEQ_CLI_RES_NO;


CREATE TABLE  TB_CLI_REV  (
	 REV_NO 	NUMBER	NOT NULL	,
	 CLI_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 REV_CONTENT 	VARCHAR2(4000)	NULL,
	 CREATE_DATE 	DATE DEFAULT SYSDATE	NULL	,
	 CLI_SCOPE 	NUMBER	DEFAULT 0 NULL
);


COMMENT ON COLUMN TB_CLI_REV.REV_NO IS '리뷰 번호';
COMMENT ON COLUMN TB_CLI_REV.CLI_NO IS '클리닉 번호';
COMMENT ON COLUMN TB_CLI_REV.MEM_NO IS '예약 회원 번호';
COMMENT ON COLUMN TB_CLI_REV.REV_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN TB_CLI_REV.CREATE_DATE IS '작성일';
COMMENT ON COLUMN TB_CLI_REV.CLI_SCOPE IS '평점';

CREATE SEQUENCE SEQ_CLI_REV_NO;

CREATE TABLE  TB_BOARD  (
    BOARD_NO    NUMBER   NOT NULL,
    BOARD_TYPE    NUMBER   NOT NULL,
    WRITER    NUMBER   NOT NULL,
    BOARD_TITLE    VARCHAR2(200)   NOT NULL,
    BOARD_CONTENT    VARCHAR2(4000)   NOT NULL,
    CREATE_DATE    DATE DEFAULT SYSDATE NOT NULL,
    VIEW_COUNT    NUMBER DEFAULT 0 NOT NULL,
    STATUS    VARCHAR2(1) DEFAULT 'N'   NOT NULL,
    FILE_NO    NUMBER   NULL
);

CREATE TABLE  TB_TEST  (
	 TEST_NO 	NUMBER	NOT NULL,
	 TEST_TITLE 	VARCHAR2(100)	NOT NULL,
	 TEST_DES 	VARCHAR2(200)	NULL,
	 ORIGIN_NAME 	VARCHAR2(255)	NOT NULL,
	 CHANGE_NAME 	VARCHAR2(255)	NOT NULL,
	 THUM_PATH 	VARCHAR2(1000)	NOT NULL
);

CREATE SEQUENCE SEQ_TEST_NO;

COMMENT ON COLUMN TB_TEST.TEST_NO IS '테스트 번호';
COMMENT ON COLUMN TB_TEST.TEST_TITLE IS '테스트명';
COMMENT ON COLUMN TB_TEST.TEST_DES IS '테스트 간단 소개';
COMMENT ON COLUMN TB_TEST.ORIGIN_NAME IS '표지 원본명';
COMMENT ON COLUMN TB_TEST.CHANGE_NAME IS '표지 수정명';
COMMENT ON COLUMN TB_TEST.THUM_PATH IS '표지 경로';

CREATE TABLE  TB_TEST_Q  (
	 QUE_NO 	NUMBER	NOT NULL,
	 TEST_NO 	NUMBER	NOT NULL,
	 QUE_CONTENT 	VARCHAR2(200)	NOT NULL
);

CREATE SEQUENCE SEQ_TQNO;

COMMENT ON COLUMN TB_TEST_Q.QUE_NO IS '질문 번호';
COMMENT ON COLUMN TB_TEST_Q.TEST_NO IS '테스트 번호';
COMMENT ON COLUMN TB_TEST_Q.QUE_CONTENT IS '질문 내용';


CREATE TABLE  TB_TEST_O  (
	 QUE_NO 	NUMBER	NOT NULL,
     OPT_NO NUMBER CHECK(OPT_NO IN(1, 2)) NOT NULL,
	 SCORE 	NUMBER	NOT NULL,
	 OPT_CONTENT 	VARCHAR2(200)	NOT NULL
);

COMMENT ON COLUMN TB_TEST_O.QUE_NO IS '질문 번호';
COMMENT ON COLUMN TB_TEST_O.SCORE IS '선택지 점수';
COMMENT ON COLUMN TB_TEST_O.OPT_CONTENT IS '선택지 내용';
COMMENT ON COLUMN TB_TEST_O.OPT_NO IS '선택지 번호';


CREATE TABLE  TB_TEST_R  (
	 TEST_NO 	NUMBER	NOT NULL,
     RES_NO 	NUMBER CHECK(RES_NO < 8) NOT NULL,
	 ORIGIN_NAME 	VARCHAR2(255)	NOT NULL,
	 CHANGE_NAME 	VARCHAR2(255)	NOT NULL,
	 RES_PATH 	VARCHAR2(1000)	NOT NULL
);

COMMENT ON COLUMN TB_TEST_R.TEST_NO IS '테스트 번호';
COMMENT ON COLUMN TB_TEST_R.ORIGIN_NAME IS '결과지 원본명';
COMMENT ON COLUMN TB_TEST_R.CHANGE_NAME IS '결과지 수정명';
COMMENT ON COLUMN TB_TEST_R.RES_PATH IS '결과지 경로';
COMMENT ON COLUMN TB_TEST_R.RES_NO IS '결과 번호';

CREATE TABLE  TB_TEST_SCORE  (
	 SCORE_NO 	NUMBER	NOT NULL,
	 TEST_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 TEST_SCORE 	NUMBER DEFAULT 0	NULL	
);

CREATE SEQUENCE SEQ_TSCORE_NO;

COMMENT ON COLUMN TB_TEST_SCORE.SCORE_NO IS '점수 번호';
COMMENT ON COLUMN TB_TEST_SCORE.TEST_NO IS '테스트 번호';
COMMENT ON COLUMN TB_TEST_SCORE.MEM_NO IS '회원 번호';
COMMENT ON COLUMN TB_TEST_SCORE.TEST_SCORE IS '점수';

CREATE TABLE  TB_BOARD_TYPE  (
	 BOARD_TYPE 	NUMBER	NOT NULL,
	 BOARD_NAME 	VARCHAR2(30)	NOT NULL
);

CREATE TABLE  TB_FILE  (
	 FILE_NO 	NUMBER	NOT NULL,
	 REF_BNO 	NUMBER	NULL,
	 ORIGIN_NAME 	VARCHAR2(255)	NULL,
	 CHANGE_NAME 	VARCHAR2(255)	NULL,
	 FILE_PATH 	VARCHAR2(1000)	NOT NULL,
	 UPLOAD_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	 FILE_LEVEL 	NUMBER	NULL,
	 STATUS 	VARCHAR2(1)	NULL
);

CREATE TABLE  TB_COMMENT  (
	 COMMENT_NO 	NUMBER	NOT NULL	,
	 BOARD_NO 	NUMBER	NOT NULL,
	 TOP_COMMENT_NO 	NUMBER	NULL,
	 WRITER 	NUMBER	NOT NULL,
	 COMMENT_CONTENT 	VARCHAR2(1000)	NOT NULL,
	 CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	 STATUS  VARCHAR2(1) DEFAULT 'Y'	NOT NULL	
);

CREATE TABLE  TB_LIKE  (
	 BOARD_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 LIKE_DATE 	DATE DEFAULT SYSDATE NOT NULL	
);


CREATE TABLE  TB_QUIZE_BOARD  (
	 QUIZE_NO 	NUMBER	NOT NULL,
	 QUIZE_TITLE 	VARCHAR2(150)	NOT NULL,
	 QUIZE_CONTENT 	VARCHAR2(2000)	NOT NULL,
	 CREATE_DATE 	DATE	NOT NULL,
	 END_DATE 	DATE	NOT NULL,
	 VOTE 	NUMBER	NOT NULL,
	 CHOICE1 	VARCHAR2(200)	NOT NULL,
	 CHOICE2 	VARCHAR2(200)	NOT NULL,
	 CHOICE3 	VARCHAR2(200)	NULL,
	 CHOICE4 	VARCHAR2(200)	NULL
);

CREATE TABLE  TB_QUIZE_ANSWER  (
	 QUIZE_NO 	NUMBER	NOT NULL,
     ANSWER 	NUMBER	NOT NULL,
     ANSWER_DETAIL VARCHAR2(2000) NOT NULL
);


CREATE TABLE  TB_QUIZE_CHOICE  (
	 QUIZE_NO 	NUMBER	NOT NULL	,
	 MEM_NO 	NUMBER	NOT NULL	,
	 CHOICE 	NUMBER	NOT NULL
);

CREATE TABLE  TB_POINT  (
	 MEM_NO 	NUMBER	NOT NULL,
	 POINT 	NUMBER	NULL
);

CREATE TABLE  TB_MESSAGE  (
	 MESSAGE_NO 	NUMBER	NOT NULL,
	 SNEDER 	NUMBER	NOT NULL,
	 RECEIVER 	NUMBER	NOT NULL,
	 SEND_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	 MESSAGE_CONTENT 	VARCHAR2(2000)	NOT NULL,
	 READ_STATUS VARCHAR2(1) DEFAULT 'N' NOT NULL,
	 STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL	
);

CREATE TABLE  TB_DISEASE  (
	 ALLERGY_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL
);

CREATE TABLE  TB_ALLERGY  (
	 ALLERGY_NO 	NUMBER	NOT NULL,
	 ALLERGY_NAME 	VARCHAR2(50)	NOT NULL
);

CREATE TABLE  TB_REC_MED  (
	 MED_NO 	NUMBER	NOT NULL,
	 ALLERGY_NO 	NUMBER	NOT NULL,
	 MED_NAME 	VARCHAR2(100)	NULL,
	 MED_DES 	VARCHAR2(4000)	NULL
);

CREATE TABLE  TB_CUS_SER  (
	 INQ_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 INQ_TYPE 	NUMBER	NOT NULL,
	 INQ_TITLE 	VARCHAR2(100)	NOT NULL,
	 INQ_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	 DEL_STATUS 	VARCHAR2(1)	NOT NULL
);

CREATE TABLE  TB_MED  (
	 MED_NO 	NUMBER	NOT NULL,
	 MED_NAME 	VARCHAR2(50)	NULL,
	 PRE_INFO 	VARCHAR2(100)	NULL,
	 CAUCTION 	VARCHAR2(200)	NULL
);

CREATE TABLE  TB_MED_MAN  (
	 PRE_NO 	NUMBER	NOT NULL,
	 RSVT_NO 	NUMBER	NOT NULL,
	 USER_NO 	NUMBER	NOT NULL,
	 HOS_NAME 	VARCHAR2(50)	NOT NULL,
	 TREAT_DATE 	DATE	NULL,
	 PRE_DATE 	DATE	NULL
);

CREATE TABLE  TB_MED_NOTI  (
	 NOTI_NO 	NUMBER	NOT NULL,
	 PRE_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 READ_OR_NOT 	VARCHAR2(1)	NOT NULL,
	 CREATE_DATE 	DATE	NULL
);

CREATE TABLE  TB_PRESCRIPTION  (
	 PRE_NO 	NUMBER	NOT NULL,
	 RSVT_NO 	NUMBER	NOT NULL,
	 PRE_DATE 	DATE	NULL,
	 TREAT_DATE 	DATE	NULL
);

CREATE TABLE  TB_PRE_MED  (
	 MED_NO 	NUMBER	NOT NULL,
	 PRE_NO 	NUMBER	NOT NULL,
	 RSVT_NO 	NUMBER	NOT NULL
);

CREATE TABLE  TB_MY_DIARY  (
	 DIARY_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	 DIARY_TITLE 	VARCHAR2(100)	NOT NULL,
	 DIARY_CONTENT 	VARCHAR2(4000)	NOT NULL
);

CREATE TABLE  TB_FAMILY  (
	 MEM_NO 	NUMBER	NOT NULL,
	 FAM_REL 	VARCHAR2(10)	NOT NULL,
	 FAM_NAME 	VARCHAR2(15)	NOT NULL,
	 ALLERGY 	VARCHAR2(50)	NULL,
	 MED_HIS 	VARCHAR2(500)	NULL,
	 HEIGHT 	NUMBER	NULL,
	 WEIGHT 	NUMBER	NULL
);

CREATE TABLE  TB_FM_DIARY  (
	 FAM_DIR_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 CREATE_DATE 	DATE	NOT NULL,
	 FAM_DIR_TITLE 	VARCHAR2(100)	NOT NULL,
	 FAM_DIR_CONTENT 	VARCHAR2(4000)	NOT NULL
);

CREATE TABLE  REPORT  (
	 REPORT_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 REPORT_TYPE 	NUMBER	NOT NULL
);

CREATE TABLE  REPORT_TYPE  (
	 REPORT_TYPE 	NUMBER	NOT NULL,
	 REPORT_DTL 	VARCHAR2(40)	NOT NULL
);

CREATE TABLE  REPORT_BOARD  (
	 REPORT_NO 	NUMBER	NOT NULL,
	 BOARD_NO 	NUMBER	NOT NULL
);

CREATE TABLE  REPORT_COMMENT  (
	 REPORT_NO2 	NUMBER	NOT NULL,
	 COMMENT_NO 	NUMBER	NOT NULL
);

CREATE TABLE  REPORT_MESSAGE  (
	 REPORT_NO 	NUMBER	NOT NULL,
	 MESSAGE_NO 	NUMBER	NOT NULL
);



--------------------CREATE TABLE--------------------

ALTER TABLE  TB_MEMBER  ADD CONSTRAINT  PK_TB_MEMBER  PRIMARY KEY (
	 MEM_NO 
);

ALTER TABLE  TB_HOSPITAL  ADD CONSTRAINT  PK_TB_HOSPITAL  PRIMARY KEY (
	 HOS_NO 
);

ALTER TABLE  TB_QUIZE_BOARD  ADD CONSTRAINT  PK_TB_QUIZE_BOARD  PRIMARY KEY (
	 QUIZE_NO 
);

ALTER TABLE  TB_MESSAGE  ADD CONSTRAINT  PK_TB_MESSAGE  PRIMARY KEY (
	 MESSAGE_NO 
);

ALTER TABLE  TB_HOS_REVIEW  ADD CONSTRAINT  PK_TB_HOS_REVIEW  PRIMARY KEY (
	 REVIEW_NO 
);

ALTER TABLE  TB_MED  ADD CONSTRAINT  PK_TB_MED  PRIMARY KEY (
	 MED_NO 
);

ALTER TABLE  TB_PRESCRIPTION  ADD CONSTRAINT  PK_TB_PRESCRIPTION  PRIMARY KEY (
	 PRE_NO ,
	 RSVT_NO 
);

ALTER TABLE  TB_DOCTOR  ADD CONSTRAINT  PK_TB_DOCTOR  PRIMARY KEY (
	 DOCTOR_NO 
);

ALTER TABLE  TB_BOOKMARK  ADD CONSTRAINT  PK_TB_BOOKMARK  PRIMARY KEY (
	 HOS_NO ,
	 MEM_NO 
);

ALTER TABLE  TB_RESERVATION  ADD CONSTRAINT  PK_TB_RESERVATION  PRIMARY KEY (
	 RSVT_NO 
);

ALTER TABLE  REPORT  ADD CONSTRAINT  PK_REPORT  PRIMARY KEY (
	 REPORT_NO 
);

ALTER TABLE  TB_COU  ADD CONSTRAINT  PK_TB_COU  PRIMARY KEY (
	 COU_NO 
);

ALTER TABLE  TB_GUEST  ADD CONSTRAINT  PK_TB_GUEST  PRIMARY KEY (
	 RES_NO 
);

ALTER TABLE  TB_COU_CAR  ADD CONSTRAINT  PK_TB_COU_CAR  PRIMARY KEY (
	 CAR_NO 
);

ALTER TABLE  TB_COU_CATE  ADD CONSTRAINT  PK_TB_COU_CATE  PRIMARY KEY (
	 COU_CATE 
);

ALTER TABLE  TB_COMMENT  ADD CONSTRAINT  PK_TB_COMMENT  PRIMARY KEY (
	 COMMENT_NO 
);

ALTER TABLE  TB_CUS_SER  ADD CONSTRAINT  PK_TB_CUS_SER  PRIMARY KEY (
	 INQ_NO 
);

ALTER TABLE  TB_COU_TIME  ADD CONSTRAINT  PK_TB_COU_TIME  PRIMARY KEY (
	 TIME_NO 
);

ALTER TABLE  TB_COU_DATE  ADD CONSTRAINT  PK_TB_COU_DATE  PRIMARY KEY (
	 DATE_NO 
);

ALTER TABLE  TB_CLI  ADD CONSTRAINT  PK_TB_CLI  PRIMARY KEY (
	 CLI_NO 
);

ALTER TABLE  TB_CLI_TIME  ADD CONSTRAINT  PK_TB_CLI_TIME  PRIMARY KEY (
	 TIME_NO 
);

ALTER TABLE  TB_MY_DIARY  ADD CONSTRAINT  PK_TB_MY_DIARY  PRIMARY KEY (
	 DIARY_NO 
);

ALTER TABLE  TB_MED_MAN  ADD CONSTRAINT  PK_TB_MED_MAN  PRIMARY KEY (
	 PRE_NO ,
	 RSVT_NO 
);

ALTER TABLE  TB_PRE_MED  ADD CONSTRAINT  PK_TB_PRE_MED  PRIMARY KEY (
	 MED_NO 
);

ALTER TABLE  TB_FM_DIARY  ADD CONSTRAINT  PK_TB_FM_DIARY  PRIMARY KEY (
	 FAM_DIR_NO 
);

ALTER TABLE  TB_TEST  ADD CONSTRAINT  PK_TB_TEST  PRIMARY KEY (
	 TEST_NO 
);

ALTER TABLE  TB_TEST_Q  ADD CONSTRAINT  PK_TB_TEST_Q  PRIMARY KEY (
	 QUE_NO 
);

ALTER TABLE  TB_CLI_CATE  ADD CONSTRAINT  PK_TB_CLI_CATE  PRIMARY KEY (
	 CATE_NO 
);

ALTER TABLE  TB_CLI_DATE  ADD CONSTRAINT  PK_TB_CLI_DATE  PRIMARY KEY (
	 DATE_NO 
);

ALTER TABLE  REPORT_TYPE  ADD CONSTRAINT  PK_REPORT_TYPE  PRIMARY KEY (
	 REPORT_TYPE 
);

ALTER TABLE  TB_LIKE  ADD CONSTRAINT  PK_TB_LIKE  PRIMARY KEY (
	 BOARD_NO ,
	 MEM_NO 
);

ALTER TABLE  TB_MED_NOTI  ADD CONSTRAINT  PK_TB_MED_NOTI  PRIMARY KEY (
	 NOTI_NO 
);



ALTER TABLE  TB_BOARD  ADD CONSTRAINT  PK_TB_BOARD  PRIMARY KEY (
	 BOARD_NO 
);

ALTER TABLE  TB_ALLERGY  ADD CONSTRAINT  PK_TB_ALLERGY  PRIMARY KEY (
	 ALLERGY_NO 
);

ALTER TABLE  TB_QUIZE_CHOICE  ADD CONSTRAINT  PK_TB_QUIZE_CHOICE  PRIMARY KEY (
	 QUIZE_NO ,
	 MEM_NO 
);

ALTER TABLE  TB_BOARD_TYPE  ADD CONSTRAINT  PK_TB_BOARD_TYPE  PRIMARY KEY (
	 BOARD_TYPE 
);

ALTER TABLE  TB_DISEASE  ADD CONSTRAINT  PK_TB_DISEASE  PRIMARY KEY (
	 ALLERGY_NO ,
	 MEM_NO 
);

ALTER TABLE  TB_TREAT_DEPARTMENT  ADD CONSTRAINT  PK_TB_TREAT_DEPARTMENT  PRIMARY KEY (
	 TREAT_NO 
);

ALTER TABLE  TB_COU_REV  ADD CONSTRAINT  PK_TB_COU_REV  PRIMARY KEY (
	 REV_NO 
);

ALTER TABLE  TB_CLI_REV  ADD CONSTRAINT  PK_TB_CLI_REV  PRIMARY KEY (
	 REV_NO 
);

ALTER TABLE  TB_REC_MED  ADD CONSTRAINT  PK_TB_REC_MED  PRIMARY KEY (
	 MED_NO 
);

ALTER TABLE  TB_COU_RES  ADD CONSTRAINT  PK_TB_COU_RES  PRIMARY KEY (
	 RES_NO 
);

ALTER TABLE  TB_POINT  ADD CONSTRAINT  PK_TB_POINT  PRIMARY KEY (
	 MEM_NO 
);

ALTER TABLE  TB_CLI_RES  ADD CONSTRAINT  PK_TB_CLI_RES  PRIMARY KEY (
	 RES_NO 
);

ALTER TABLE  TB_COU_VIDEO  ADD CONSTRAINT  PK_TB_COU_VIDEO  PRIMARY KEY (
	 VIDEO_NO 
);

ALTER TABLE  TB_TEST_SCORE  ADD CONSTRAINT  PK_TB_TEST_SCORE  PRIMARY KEY (
	 SCORE_NO ,
	 TEST_NO 
);

ALTER TABLE  TB_PRESCRIPTION  ADD CONSTRAINT  FK_TB_MED_MAN_TO_TB_PRESCRIPTION_1  FOREIGN KEY (
	 PRE_NO 
)
REFERENCES  TB_MED_MAN  (
	 PRE_NO 
);

ALTER TABLE  TB_PRESCRIPTION  ADD CONSTRAINT  FK_TB_MED_MAN_TO_TB_PRESCRIPTION_2  FOREIGN KEY (
	 RSVT_NO 
)
REFERENCES  TB_MED_MAN  (
	 RSVT_NO 
);

ALTER TABLE  TB_BOOKMARK  ADD CONSTRAINT  FK_TB_HOSPITAL_TO_TB_BOOKMARK  FOREIGN KEY (
	 HOS_NO 
)
REFERENCES  TB_HOSPITAL  (
	 HOS_NO 
);

ALTER TABLE  TB_BOOKMARK  ADD CONSTRAINT  FK_TB_MEMBER_TO_TB_BOOKMARK  FOREIGN KEY (
	 MEM_NO 
)
REFERENCES  TB_MEMBER  (
	 MEM_NO 
);

ALTER TABLE  TB_MED_MAN  ADD CONSTRAINT  FK_TB_RESERVATION_TO_TB_MED_MAN_1  FOREIGN KEY (
	 RSVT_NO 
)
REFERENCES  TB_RESERVATION  (
	 RSVT_NO 
);

ALTER TABLE  TB_PRE_MED  ADD CONSTRAINT  FK_TB_MED_TO_TB_PRE_MED_1  FOREIGN KEY (
	 MED_NO 
)
REFERENCES  TB_MED  (
	 MED_NO 
);

ALTER TABLE  TB_LIKE  ADD CONSTRAINT  FK_TB_BOARD_TO_TB_LIKE_1  FOREIGN KEY (
	 BOARD_NO 
)
REFERENCES  TB_BOARD  (
	 BOARD_NO 
);

ALTER TABLE  TB_LIKE  ADD CONSTRAINT  FK_TB_MEMBER_TO_TB_LIKE_1  FOREIGN KEY (
	 MEM_NO 
)
REFERENCES  TB_MEMBER  (
	 MEM_NO 
);

ALTER TABLE  TB_QUIZE_CHOICE  ADD CONSTRAINT  FK_TB_QUIZE_BOARD_TO_TB_QUIZE_CHOICE_1  FOREIGN KEY (
	 QUIZE_NO 
)
REFERENCES  TB_QUIZE_BOARD  (
	 QUIZE_NO 
);

ALTER TABLE  TB_QUIZE_CHOICE  ADD CONSTRAINT  FK_TB_MEMBER_TO_TB_QUIZE_CHOICE_1  FOREIGN KEY (
	 MEM_NO 
)
REFERENCES  TB_MEMBER  (
	 MEM_NO 
);

ALTER TABLE  TB_DISEASE  ADD CONSTRAINT  FK_TB_ALLERGY_TO_TB_DISEASE_1  FOREIGN KEY (
	 ALLERGY_NO 
)
REFERENCES  TB_ALLERGY  (
	 ALLERGY_NO 
);

ALTER TABLE  TB_DISEASE  ADD CONSTRAINT  FK_TB_MEMBER_TO_TB_DISEASE_1  FOREIGN KEY (
	 MEM_NO 
)
REFERENCES  TB_MEMBER  (
	 MEM_NO 
);

ALTER TABLE  TB_POINT  ADD CONSTRAINT  FK_TB_MEMBER_TO_TB_POINT_1  FOREIGN KEY (
	 MEM_NO 
)
REFERENCES  TB_MEMBER  (
	 MEM_NO 
);

ALTER TABLE  TB_TEST_SCORE  ADD CONSTRAINT  FK_TB_TEST_TO_TB_TEST_SCORE_1  FOREIGN KEY (
	 TEST_NO 
)
REFERENCES  TB_TEST  (
	 TEST_NO 
);

CREATE SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_QUIZE_NO;
CREATE SEQUENCE SEQ_FILE_NO;
CREATE SEQUENCE SEQ_MESSAGE_NO;
CREATE SEQUENCE SEQ_REPORT_NO;


INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) VALUES (SEQ_QUIZE_NO.NEXTVAL, '퀴즈 1 제목입니다', '퀴즈 1 내용입니다~~~~~~~~~~~~ 1 + 1 은 몇일까요????',0, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), '1입니다~~~~', '2입니다~~~~', '3입니다~~~~', '4입니다~~~~');
INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) VALUES (SEQ_QUIZE_NO.NEXTVAL, '퀴즈 2 제목입니다', '퀴즈 2 내용입니다~~~~~~~~~~~~ 1 + 1 은 몇일까요????',0, TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), '1입니다~~~~', '2입니다~~~~', '3입니다~~~~', '4입니다~~~~');
INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) VALUES (SEQ_QUIZE_NO.NEXTVAL, '퀴즈 3 제목입니다', '퀴즈 3 내용입니다~~~~~~~~~~~~ 1 + 1 은 몇일까요????',0, TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), '1입니다~~~~', '2입니다~~~~', '3입니다~~~~', '4입니다~~~~');
INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) VALUES (SEQ_QUIZE_NO.NEXTVAL, '퀴즈 4 제목입니다', '퀴즈 4 내용입니다~~~~~~~~~~~~ 1 + 1 은 몇일까요????',0, TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), '1입니다~~~~', '2입니다~~~~', '3입니다~~~~', '4입니다~~~~');
INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) VALUES (SEQ_QUIZE_NO.NEXTVAL, '퀴즈 5 제목입니다', '퀴즈 5 내용입니다~~~~~~~~~~~~ 1 + 1 은 몇일까요????',0, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), '1입니다~~~~', '2입니다~~~~', '3입니다~~~~', '4입니다~~~~');

INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(6, 1, '1번이 답입니다~~~~ 이유는 몰라요~~~~~');
INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(7, 2, '2번이 답입니다~~~~ 이유는 몰라요~~~~~');
INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(8, 3, '3번이 답입니다~~~~ 이유는 몰라요~~~~~');
INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(9, 4, '4번이 답입니다~~~~ 이유는 몰라요~~~~~');
INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(10, 3, '3번이 답입니다~~~~ 이유는 몰라요~~~~~');
INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(11, 2, '2번이 답입니다~~~~ 이유는 몰라요~~~~~');


commit;


SELECT 
        QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4, TO_CHAR(TRUNC(SYSDATE - END_DATE)) DEADLINE

FROM
        TB_QUIZE_BOARD 
    ORDER BY
        CREATE_DATE DESC;
        
        
SELECT 
        ANSWER, ANSWER_DETAIL, QUIZE_TITLE
    FROM 
        TB_QUIZE_ANSWER
    JOIN 
        TB_QUIZE_BOARD USING(QUIZE_NO) 
    WHERE 
        QUIZE_NO = 6;
        
INSERT INTO TB_BOARD_TYPE (BOARD_TYPE, BOARD_NAME) VALUES (10, '공지사항');
INSERT INTO TB_BOARD_TYPE (BOARD_TYPE, BOARD_NAME) VALUES (20, '자유게시판');
INSERT INTO TB_BOARD_TYPE (BOARD_TYPE, BOARD_NAME) VALUES (30, '정보게시판');
INSERT INTO TB_BOARD_TYPE (BOARD_TYPE, BOARD_NAME) VALUES (40, '익명게시판');
INSERT INTO TB_BOARD_TYPE (BOARD_TYPE, BOARD_NAME) VALUES (50, '건강매거진');

CREATE SEQUENCE SEQ_BOARD;
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS) VALUES (SEQ_BOARD.NEXTVAL, 10, 1, '공지제목1', '공지내용1', TO_DATE('2023-09-01 01:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y');
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 10, 1, '공지제목2', '공지내용2', TO_DATE('2023-09-02 02:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 10, 1, '공지제목3', '공지내용3', TO_DATE('2023-09-03 03:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 10, 2, '자유제목1', '자유내용1', TO_DATE('2023-09-04 04:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 20, 3, '자유제목2', '자유내용2', TO_DATE('2023-09-05 05:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 20, 4, '자유제목3', '자유내용3', TO_DATE('2023-09-06 06:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 20, 5, '정보제목1', '정보내용1', TO_DATE('2023-09-07 07:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 30, 5, '정보제목2', '정보내용2', TO_DATE('2023-09-08 08:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 30, 4, '정보제목3', '정보내용3', TO_DATE('2023-09-09 09:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 30, 3, '익명제목1', '익명내용1', TO_DATE('2023-09-10 10:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 40, 2, '익명제목2', '익명내용2', TO_DATE('2023-09-11 11:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 40, 2, '익명제목3', '익명내용3', TO_DATE('2023-09-12 12:01:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 50, 3, '건강제목1', '건강내용1', TO_DATE('2023-09-13 12:11:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 50, 4, '건강제목2', '건강내용2', TO_DATE('2023-09-14 12:21:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TYPE, WRITER, BOARD_TITLE, BOARD_CONTENT, CREATE_DATE, VIEWS, STATUS, FILE_NO) VALUES (SEQ_BOARD.NEXTVAL, 50, 5, '건강제목3', '건강내용3', TO_DATE('2023-09-15 12:31:01', 'YYYY-MM-DD HH:MI:SS'), 0, 'Y', NULL);
commit;
        
ALTER TABLE TB_BOARD RENAME COLUMN VIEW_COUNT TO VIEWS;

    

SELECT 
	BOARD_NO, BOARD_TITLE, CREATE_DATE, CREATE_DATE, VIEWS, FILE_NO,
    BOARD_NAME
FROM 
	TB_BOARD B 
JOIN TB_BOARD_TYPE USING(BOARD_TYPE)
WHERE 
	B.STATUS = 'Y'
ORDER BY 
	B.CREATE_DATE DESC;        


 	INSERT 
 		INTO 	
 			TB_POINT 
 					(
 					MEM_NO
 					, POINT
 					) 
 			VALUES
 					(
 					2
 					, 500
 					);
                    
    rollback;
 
INSERT 
		INTO 
			TB_QUIZE_CHOICE 
							(
							QUIZE_NO
							, MEM_NO
							, CHOICE
							) 
					VALUES
							(
							11
							,2
							,2
							);

	SELECT 
        ANSWER
    FROM 
        TB_QUIZE_ANSWER
    WHERE 
        QUIZE_NO = 11  
        
    AND    
        ANSWER = 2;
        
DELETE FROM TB_POINT;
DELETE FROM TB_QUIZE_CHOICE;

COMMIT;


ALTER   TABLE TB_MEMBER ADD	 POINT 	NUMBER  DEFAULT 0 NOT NULL;

UPDATE TB_MEMBER SET POINT = POINT + 500 WHERE MEM_NO = 2;
UPDATE TB_MEMBER SET POINT = 0 WHERE MEM_NO = 2;

UPDATE TB_QUIZE_BOARD SET VOTE = VOTE + 1 WHERE QUIZE_NO = 11;

SELECT MEM_NO FROM TB_QUIZE_CHOICE WHERE QUIZE_NO = 11;

INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) 
VALUES (SEQ_QUIZE_NO.NEXTVAL, '퀴즈퀴즈~~', '백조의 호수를 작곡한 차이코프스키는 어느나라의 작고가일까요?',0, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), '1. 러시아', '2. 오스트리아', '3. 독일', '4. 미국');

INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(21, 1, '러시아입니다~~~ 거기서 태어났대요~~');

INSERT INTO TB_QUIZE_BOARD (QUIZE_NO, QUIZE_TITLE, QUIZE_CONTENT, VOTE, CREATE_DATE, END_DATE, CHOICE1, CHOICE2, CHOICE3, CHOICE4) 
VALUES (SEQ_QUIZE_NO.NEXTVAL, '동계올림픽', '다음 중 ''동계올림픽''의 종목이 아닌것은?',0, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), '1. 스키점프', '2. 트라이애슬론', '3. 스켈레톤', '4. 노르딕복합');

INSERT INTO TB_QUIZE_ANSWER (QUIZE_NO, ANSWER, ANSWER_DETAIL) VALUES(22, 2, '트라이애슬론은 하계입니다~~');

DROP TABLE TB_MESSAGE;

ALTER TABLE TB_MESSAGE RENAME COLUMN SNEDER TO SENDER;

CREATE SEQUENCE SEQ_MESSAGE;

INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 2, 3, 'user01이 user02한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 1, 2, 'admin이 user01한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 3, 4, 'user02이 user03한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 2, 6, 'user01이 guswo한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 6, 2, 'guswo이 user02한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 5, 4, 'user04이 user03한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 2, 3, 'user01이 user02한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 2, 4, 'user01이 user03한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 2, 5, 'user01이 user04한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 2, 6, 'user01이 user05한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 1, 2, 'admin이 user02한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 3, 2, 'user02이 user01한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 4, 2, 'user03이 user01한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 5, 2, 'user04이 user01한테 보낸 메세지 내용입니다.', 'N', 'Y');
INSERT INTO TB_MESSAGE (MESSAGE_NO, SENDER, RECEIVER, MESSAGE_CONTENT, READ_STATUS, STATUS)
VALUES (SEQ_MESSAGE.NEXTVAL, 6, 2, 'user05이 user01한테 보낸 메세지 내용입니다.', 'N', 'Y');

SELECT 
        MEM_ID, MESSAGE_CONTENT, SEND_DATE, READ_STATUS
    FROM 
        TB_MESSAGE 
    JOIN 
        TB_MEMBER ON(MEM_NO = SENDER)
    WHERE 
        RECEIVER = 2
    AND 
        TB_MESSAGE.STATUS = 'Y'
        ORDER BY SEND_DATE DESC;

SELECT 
        MEM_ID, MESSAGE_CONTENT, SEND_DATE, READ_STATUS
    FROM 
        TB_MESSAGE 
    JOIN 
        TB_MEMBER ON(MEM_NO = SENDER)
    WHERE 
        SENDER = 2
    AND 
        TB_MESSAGE.STATUS = 'Y'
        ORDER BY SEND_DATE DESC;

ROLLBACK;
COMMIT;


















