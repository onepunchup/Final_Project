package org.kh.dajob.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.member.model.vo.Company;
import org.kh.dajob.member.model.vo.CompanyType;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.member.model.vo.User;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberDao(){}

	public Member selectMember(Member m) {		
		return sqlSession.selectOne("Member.selectMember", m);
	}

	public ArrayList<Member> selectMemberAll() {
		return  new ArrayList<Member>(sqlSession.selectList("Member.selectMemberAll"));
	}
	
	public User selectUser(Member m) {
		return sqlSession.selectOne("User.selectUser", m);
	}

	public Company selectCompany(Member m) {
		return sqlSession.selectOne("Company.selectCompany", m);
	}
	public int checkIdDup(String userid) {
		return sqlSession.selectOne("Member.checkDupId", userid);
	}
	
	public int insertMember(Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}

	public int insertUser(User u) {
		return sqlSession.insert("User.insertUser", u);
	}

	public int insertCompany(Company c) {
		return sqlSession.insert("Company.insertCompany", c);
	}
	
	public int updateMember(Member m) {
		return sqlSession.update("Member.updateMember", m);
	}
	
	public int deleteMember(String userid) {
		return sqlSession.delete("Member.deleteMember", userid);
	}

	public ArrayList<CompanyType> selectCompanyList() {
		return new ArrayList<CompanyType>(sqlSession.selectList("Company.selectComType"));
	}

	public ArrayList<WorkBoard> likeCompList(String memberId, int page) {
		int limit = 10;
		int startPage = (page - 1) * limit;
		int endPage = page * limit;
		RowBounds rowBounds = new RowBounds(startPage, endPage);
		return new ArrayList<WorkBoard>(sqlSession.selectList("WorkBoard.selectList", memberId, rowBounds));
	}

	public int getListCount(String memberId) {
		return sqlSession.selectOne("WorkBoard.getListCount", memberId);
	}

	public int updateResumeFiles(User user) {
		return sqlSession.update("User.updateResumeFiles",user);
	}
	
	public int updateUser(User user) {
		return sqlSession.update("User.updateMember", user);
	}

	public int updateCompany(Company company) {
		return sqlSession.update("Company.updateCompany",company);
	}

	public int insertResumeData(User user) {
		return sqlSession.update("insertResumeData", user);
	}

	public int selectUserAll() {
		return sqlSession.selectOne("Member.selectUserAll");
	}

	public int selectCompanyAll() {
		return sqlSession.selectOne("Member.selectCompanyAll");
	}

	public ArrayList<Company> selectPowerLinkComp() {
		return new ArrayList<Company>(sqlSession.selectList("Company.selectPowerLinkComp"));
	}
	
	public int deleteFile(String userid, int fileno) {
		int result = 0;
		if(fileno == 1) {
			result = sqlSession.update("User.deleteFile1", userid);
		}else if(fileno == 2) {
			result = sqlSession.update("User.deleteFile2", userid);
		}else if(fileno == 3) {
			result = sqlSession.update("User.deleteFile3", userid);
		}
		return result;
	}

	public User selectUserResume(String member_id) {
		return sqlSession.selectOne("User.selectUserResume", member_id);
	}
}

