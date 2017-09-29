package com.grad.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.NotiVo;

@Repository
public class NotiDao {

	@Autowired
	private SqlSession sqlSession;

	
	public List<NotiVo> getNotiList(String type) {
		return sqlSession.selectList("noti.getNotiList", type);
	}

	public NotiVo getByNo(String tabnm, int no) {
		NotiVo vo = new NotiVo();

	
		if (tabnm.equals("대학원")) {
			vo = sqlSession.selectOne("noti.getGradByNo", no);
		
		}
	
		else if (tabnm.equals("연구실")) {
			vo = sqlSession.selectOne("noti.getLabByNo", no);
		}

		return vo;
	}
	
	
	public void insertNoti(Map<String, Object> map) {
		sqlSession.insert("noti.insertNoti", map);		
	}
	
	
	public void updateNoti(Map<String, Object> map) {
		sqlSession.update("noti.updateNoti", map);		
	}

	public int lastInsertId() {
		return sqlSession.selectOne("noti.lastInsertId");
	}


	public void setNotiInfo(CodeVo codeVo) {
		sqlSession.insert("noti.insertNotiInfo", codeVo);
		
	}

}
