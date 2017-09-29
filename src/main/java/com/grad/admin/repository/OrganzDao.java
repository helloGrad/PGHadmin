package com.grad.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;



@Repository
public class OrganzDao {

	@Autowired
	SqlSession sqlSession;


	public List<OrganzVo> getOrgnzList(String type) {
		return sqlSession.selectList("organz.getOrgnzList", type);
	}

	public OrganzVo getOrgnzByNo(Map<String, Object> map) {
		if (map.get("type").equals("대학교")) {
			return sqlSession.selectOne("organz.getUniByNo", map);
		} else {
			return sqlSession.selectOne("organz.getOrgnzByNo", map);
		}

	}


	public OrganzVo getByNo(int no) {
		OrganzVo vo = sqlSession.selectOne("organz.getByNo", no);
		return vo;
	}

	
	public List<OrganzVo> getOrganzLabList() {
		return sqlSession.selectList("organz.selectOrganzLabList");
	}


	public List<ResrchAcrsltVo> getResrchList(int orgnzNo) {
		return sqlSession.selectList("organz.getResrchList", orgnzNo);
	}

	
	public ResrchAcrsltVo getResrchNo(int resrchAcrsltNo) {
		return sqlSession.selectOne("organz.getResrchNo", resrchAcrsltNo);
	}

	
	public List<CodeVo> selectOrganzInfo(int orgnzNo) {
		return sqlSession.selectList("organz.selectOrganzInfo", orgnzNo);
	}
	
	public List<CodeVo> selectOrganzInfo(Map<String, Object> map) {
		return sqlSession.selectList("organz.selectOrganzInfo2", map);
	}



	public boolean insertGrad(OrganzVo organzVo) {
		return (1 == sqlSession.insert("organz.insertGrad", organzVo));
	}


	public void insertLab(OrganzVo organzVo) {
		sqlSession.insert("organz.insertLab", organzVo);
	}


	public void insertResrch(ResrchAcrsltVo resrchAcrsltVo) {
		sqlSession.insert("organz.insertResrch", resrchAcrsltVo);
	}


	public void update(OrganzVo vo) {
		sqlSession.update("organz.updateGrad", vo);
	}

	
	public void updateOrganz(OrganzVo organzVo) {
		sqlSession.update("organz.updateOrganz", organzVo);
	}

	
	public void updateResrch(ResrchAcrsltVo resrchAcrsltVo) {
		sqlSession.update("organz.updateResrch", resrchAcrsltVo);
	}


	public void deleteOrganzInfo(int orgnzNo) {
		sqlSession.delete("organz.deleteOrganzInfo", orgnzNo);
	}

	public void deleteOrganzInfo(Map<String, Object> map) {
		
		sqlSession.delete("organz.deleteOrganzInfo2", map);
	}

	

	public int lastInsertId() {
		return sqlSession.selectOne("organz.lastInsertId");
	}

	
	public List<OrganzVo> getListByChar(Map<String, Object> map) {
		return sqlSession.selectList("organz.getListByChar", map);
	}


	public List<OrganzVo> getResultList(Map<String, Object> map) {
		if (map.get("type2") != null) {
			return sqlSession.selectList("organz.getResultList2", map);

		} else {

			return sqlSession.selectList("organz.getResultList", map);
		}

	}

	

	public void setOgranzInfo(CodeVo codeVo) {

		sqlSession.insert("organz.insertOrganzInfo2", codeVo);

	}

	public void insertOrganzInfo(Map<String, Object> map) {
		sqlSession.insert("organz.insertOrganzInfo", map);
	}


	public List<CodeVo> getCode(String dstnct) {
		
		return sqlSession.selectList("organz.getCode", dstnct);
	}



}
