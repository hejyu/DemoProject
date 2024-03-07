-- 책장 : 판매 도서
CREATE TABLE bookcase (
    bcode char(7) NOT NULL,
    title varchar2(100) NOT NULL,
    writer varchar2(100) NOT NULL,
	publisher varchar2(100) NOT NULL,
	pubdate char(10) ,  -- yyyy-mm-dd  string
	saleuser varchar2(100) NOT NULL,
	price number(7) NOT NULL,
	cover varchar2(100) NOT NULL,
	status char(1) DEFAULT 'Y',		--'Y' 판매중 , 'N' 판매완료
	PRIMARY KEY (bcode),
	FOREIGN KEY (saleuser) REFERENCES demo_member(userid)
);

INSERT INTO bookcase VALUES 
   ('AB10011','불편한 편의점','김호연','나무와의자','2022-05-11','kevin',2000,'불편한편의점.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AB10012','빅사이클','레이달리오','한빛비즈','2021-04-01','chchch',2300,'빅사이클.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AB10301','유럽도시기행2','유시민','생각의길','2020-05-22','maru080818',3000,'유럽도시기행.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AC10011','이상한과자가게 전청당','히로시마 레이코','전청당','2020-12-11','seri111',1500,'이상한가게.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AB10014','파친코','이민진','인프루엔셜','2020-04-20','minkr',4000,'파친코.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AC10012','흔한남매','백난도','아이세움','2022-05-05','minkr',1000,'흔한남매.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AB10015','삶의격','페터비에리','은행나무','2021-09-03','nara34',3000,'삶의격.jpg','Y');
INSERT INTO bookcase VALUES 
   ('AB10016','부자아빠','로버트기요사키','예스24','2022-11-22','wonder',3000,'부자아빠.jpg','Y');

COMMIT;  
  -- 판매 내역
CREATE TABLE sale_details(
	bcode char(7) NOT NULL,
	orderId varchar2(30) NOT NULL,
	amount number(7) NOT NULL,
	paydate TIMESTAMP,
	buyuser varchar2(100),
	paytype varchar2(100),
	paymentKey varchar2(50),
	FOREIGN KEY (bcode) REFERENCES bookcase(bcode),
	FOREIGN KEY (buyuser) REFERENCES demo_member(userid)
);

INSERT INTO sale_details VALUES ('AB10015_221011121234','2022-06-08 15:40:49','minkr','신용 카드','sx78adg7799');
UPDATE bookcase SET status='N' WHERE bcode='AB10015';
COMMIT;  

-- 첨부파일명 저장 컬럼
ALTER TABLE notice ADD "ATTACHFILE" varchar2(200);
ALTER TABLE notice ADD "UPLOADFILE" varchar2(200);
