package org.kh.dajob.itinfo.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.itinfo.model.vo.Itinfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("itinfoDao")
public class ItinfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("Itinfo.getListCount");
	}
	
	public ArrayList<Itinfo> selectR5List() {
		return new ArrayList<Itinfo>(sqlSession.selectList("Itinfo.selectRecentFive"));
	}

	public ArrayList<Itinfo> selectList(int currentPage, int limit) {
		RowBounds rows = new RowBounds(((currentPage-1)*limit), limit);
		return new ArrayList<Itinfo>(sqlSession.selectList("Itinfo.selectList",null,rows));
	}

	public Itinfo selectOne(String itinfo_no) {
		return sqlSession.selectOne("Itinfo.selectOne",itinfo_no);
	}

	public int insertItinfo(Itinfo itinfo) {
		return sqlSession.insert("Itinfo.insertItinfo", itinfo);
	}

	public int updateItinfo(Itinfo itinfo) {
		return sqlSession.update("Itinfo.updateItinfo", itinfo);
	}

	public int deleteItinfo(String itinfo_no) {
		return sqlSession.delete("Itinfo.deleteItinfo", itinfo_no);
	}
}
