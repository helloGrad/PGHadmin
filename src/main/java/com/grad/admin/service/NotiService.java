package com.grad.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.NotiDao;
import com.grad.admin.vo.CodeForm;
import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.NotiVo;

@Service
public class NotiService {

	@Autowired
	NotiDao notiDao;


	public List<NotiVo> getNotiList(String type) {

		return notiDao.getNotiList(type);
	}

	
	public NotiVo getNoti(String tabnm, int no) {
		return notiDao.getByNo(tabnm, no);

	}


	public void insertNoti(NotiVo notiVo, String tabnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notiVo", notiVo);
		map.put("tabnm", tabnm);
		notiDao.insertNoti(map);
	}

	

	public void updateNoti(String tabnm, NotiVo notiVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notiVo", notiVo);
		map.put("tabnm", tabnm);
		notiDao.updateNoti(map);
	}

	public int lastInsertId() {
		return notiDao.lastInsertId();

	}

	public void setNotiInfo(int lastId, CodeForm codeForm) {
		
		
		CodeVo codeVo = new CodeVo();
		Integer id = lastId;
		codeVo.setSlctnNotiNo(id.longValue());
		
		for(int i=0; i < codeForm.getCodes().size(); i++) {
			
			codeVo.setCdId(codeForm.getCodes().get(i).getCdId());	
			notiDao.setNotiInfo(codeVo);
		}

	}

}
