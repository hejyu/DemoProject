package org.iclass.vo;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iclass.dao.CommunityDao;
import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class PagingTest {

	@Test
	void test() {
		 //12 페이지의 글을 보고 싶다. 글의 전체 갯수는 222개. 1페이지 글 목록 10개
		Paging page = new Paging(12,222,10);
		log.info("page 프로퍼티 계산 결과 : {}", page);
		//Paging(currentPage=12, totalCount=222, pageSize=10, totalPage=23, 
		// 	startNo=111, endNo=120, startPage=11, endPage=20, column=null, findText=null)
	}
	
	@Test
	void getPageList() {
		// 2페이지의 글 목록 가져오기
		Paging page = new Paging(2,222,10);
		Map<String, Integer> map = new HashMap<>();
		map.put("start", page.getStartNo());
		map.put("end", page.getEndNo());
		
		CommunityDao dao =   CommunityDao.getInstance();
		List<Community> list = dao.pagelist(map);
		
		log.info("2 페이지 글 목록 : {}", list);
	}

	
	@Test
	void getArticle() {
		// idx 222 글 1 개 가져오기 
		CommunityDao dao =   CommunityDao.getInstance();
		Community com = dao.selectByIdx(222);
		log.info("222 번 글 : {}", com);
	}
	

}
