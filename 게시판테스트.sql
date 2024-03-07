

-- 게시판 페이지 처리
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
							(SELECT * FROM community  ORDER BY idx DESC) f)
WHERE r BETWEEN #{start} AND #{end}

-- step 1 : idx 내림차순 정렬
SELECT * FROM community  ORDER BY idx DESC;


-- step 2 : rownum 컬럼값 사용
SELECT rownum r ,f.* 
FROM
	(SELECT * FROM community  ORDER BY idx DESC) f;

-- step 3 : 범위를 지정합니다 1페이지에 글이 10개, 20개 보이므로 start에서 end에 따라 값을 지정하기
SELECT * FROM 
	(
		SELECT rownum r ,f.* FROM
		(SELECT * FROM community  ORDER BY idx DESC) f
	) 
WHERE r BETWEEN 1 AND 10 SELECT * FROM COMMUNITY;		-- 1 페이지	

SELECT * FROM 
	(SELECT rownum r ,f.* FROM
						(SELECT * FROM community  ORDER BY idx DESC) f)
WHERE r BETWEEN 11 AND 20 SELECT * FROM COMMUNITY;		-- 2 페이지	

SELECT * FROM 
	(SELECT rownum r ,f.* FROM
			(SELECT * FROM community  ORDER BY idx DESC)
	)f
WHERE r BETWEEN 101 AND 110;		-- 10 페이지	


						
-- 새글 저장
INSERT INTO community
	(idx,writer,title,content,ip) 
VALUES 
	(community_idx_seq.nextval,'wonder','자비를 배푸소서(외전증보증판) 1','재밌게 잘 읽었습니다. 다음 편이 궁금해지네요','127.0.0.1')
;


SELECT community_idx_seq.currval 
FROM dual;

-- 글 수정
UPDATE community
SET 
	title='자비를 배푸소서(번역판) 1', content='좋은 글입니다.' ,ip='13.0.0.3'
WHERE 
	idx=222;

-- 글 1개 가져오기 
SELECT * FROM COMMUNITY c  WHERE  IDX = 222;

-- 글 삭제
DELETE FROM 
	community 
WHERE 
	idx=#{idx}
	
-- 글 갯수
SELECT count(*) FROM community;
	
-- 글 조회수 증가
UPDATE community 
SET 
	READCOUNT = READCOUNT +1 
WHERE 
	idx = 222;

	
-- 메인글의 댓글 갯수 조회 : 댓글 테이블 가서 메인글 번호 idx를 확인 후 실행
SELECT count(*) 
FROM communityComments 
WHERE 
	mref=107;

SELECT * FROM COMMUNITYCOMMENTS;


-- 메인 글의 댓글 갯수 업데이트 (동시성을 고려)
UPDATE community 
SET COMMENTCOUNT = 
	(SELECT count(*) 
	 FROM communityComments 
	 WHERE mref=222)
WHERE idx = 222;

SELECT * FROM community WHERE IDX =222;
		
-- 메인 글의 댓글 목록 가져오기 
SELECT * 
FROM community;
	
-- idx의 max값 구하기
SELECT max(idx) FROM community;

-- 
SELECT * 
FROM communityComments 
WHERE 
	mref=#{mref}
	
	

	