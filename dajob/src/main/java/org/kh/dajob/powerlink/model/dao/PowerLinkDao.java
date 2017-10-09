package org.kh.dajob.powerlink.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.powerlink.model.vo.PowerLink;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("powerlinkDao")
public class PowerLinkDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public PowerLink selectId(String memberId) {
		return sqlSession.selectOne("PowerLink.selectId", memberId);
	}

	public int updateCnt(String member_id) {
		int result = 0;
		System.out.println("member_id in DAO : "+member_id);
		int count = sqlSession.selectOne("PowerLink.selectTodate", member_id);
		System.out.println("PowerLink select in DAO : "+count);
		if(count > 0){
			result = sqlSession.update("PowerLink.updateCnt", member_id);
		}else{
			result = sqlSession.insert("PowerLink.insertPl", member_id);
		}
		return result;
	}

	public ArrayList<PowerLink> selectPowerLinkAll() {
		return new ArrayList<PowerLink>(sqlSession.selectList("PowerLink.selectPowerLinkAll"));
	}

	public ArrayList<PowerLink> selectPercentage() {
		return new ArrayList<PowerLink>(sqlSession.selectList("PowerLink.selectPercentage"));
	}

	public ArrayList<PowerLink> selectMyPw(String memberId) {
		RowBounds row = new RowBounds(0, 5);
		return new ArrayList<PowerLink>(sqlSession.selectList("PowerLink.selectMyPowerLink", memberId, row));
	}
	
}
