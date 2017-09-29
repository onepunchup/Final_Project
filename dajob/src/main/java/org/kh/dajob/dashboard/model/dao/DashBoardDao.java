package org.kh.dajob.dashboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.dashboard.model.vo.DashBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dashboardDao")
public class DashBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<DashBoard> selectMonTot() {
		RowBounds row = new RowBounds(0, 5);
		return new ArrayList<DashBoard>(sqlSession.selectList("DashBoard.selectList", "", row));
	}

	public int totProfit() {
		return sqlSession.selectOne("DashBoard.totalProfit");
	}

	public ArrayList<DashBoard> areaTop5() {
		return new ArrayList<DashBoard>(sqlSession.selectList("DashBoard.areaTop5"));
	}

	public ArrayList<DashBoard> monTop5() {
		RowBounds row = new RowBounds(0, 5);
		return new ArrayList<DashBoard>(sqlSession.selectList("DashBoard.monTop5", "", row));
	}

}
