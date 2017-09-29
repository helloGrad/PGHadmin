package com.grad.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.OrganzDao;
import com.grad.admin.vo.CodeForm;
import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;

@Service
public class OrganzService {

	@Autowired
	OrganzDao organzDao;


	public List<OrganzVo> getOrgnzList(String type) {
		return organzDao.getOrgnzList(type);
	}


	public OrganzVo getOrgnzByNo(int no, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("no", no);
		return organzDao.getOrgnzByNo(map);
	}


	public OrganzVo getOrganz(int no) {
		return organzDao.getByNo(no);
	}

	
	public List<OrganzVo> getOrganzLabList() {
		return organzDao.getOrganzLabList();
	}


	public List<ResrchAcrsltVo> getResrchList(int orgnzNo) {

		return organzDao.getResrchList(orgnzNo);
	}


	public ResrchAcrsltVo getResrchNo(int resrchAcrsltNo) {

		return organzDao.getResrchNo(resrchAcrsltNo);
	}


	public List<CodeVo> getOrganzInfo(int orgnzNo) {
		return organzDao.selectOrganzInfo(orgnzNo);
	}



	public List<CodeVo> getOrganzInfo(int no, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("type", type);
		return organzDao.selectOrganzInfo(map);
	}


	public boolean insert(OrganzVo organzVo, String prntsOrgnzStr) {
		if (prntsOrgnzStr.isEmpty() || prntsOrgnzStr.equals(null)) {
			organzVo.setPrntsOrgnzNo(-1);
		} else {
			organzVo.setPrntsOrgnzNo(Integer.parseInt(prntsOrgnzStr));
		}

		if (organzVo.getOrgnzDstnct().equals("대학원") || organzVo.getOrgnzDstnct().equals("학과")
				|| organzVo.getOrgnzDstnct().equals("대학교")) {
			return organzDao.insertGrad(organzVo);
		}
		return false;
	}


	public void insertLab(OrganzVo organzVo) {

		organzDao.insertLab(organzVo);

	}

	
	public void insertResrch(ResrchAcrsltVo resrchAcrsltVo) {

		organzDao.insertResrch(resrchAcrsltVo);

	}

	
	public void setOrganzInfo(int lastId, List<String> cdlist) {

		CodeVo codeVo = new CodeVo();
		Integer id = lastId;

		for (int i = 0; i < cdlist.size(); i++) {
			codeVo.setOrgnzNo(id.longValue());
			codeVo.setCdId(cdlist.get(i));
			organzDao.setOgranzInfo(codeVo);
		}
	}



	public void setOrganzInfo(int lastId, CodeForm codeForm) {

		CodeVo codeVo = new CodeVo();
		Integer id = lastId;
		codeVo.setOrgnzNo(id.longValue());

		if (codeForm.getCodes2() != null) {
			for (int i = 0; i < codeForm.getCodes2().size(); i++) {
				if (codeForm.getCodes2().get(i).getCdId() != null) {
					codeVo.setCdId(codeForm.getCodes2().get(i).getCdId());
					organzDao.setOgranzInfo(codeVo);
				}
			}

		}

		if (codeForm.getCodes() != null) {
			
			for (int i = 0; i < codeForm.getCodes().size(); i++) {
				if (codeForm.getCodes().get(i).getCdId() != null) {
					codeVo.setCdId(codeForm.getCodes().get(i).getCdId());
					organzDao.setOgranzInfo(codeVo);
				}

			}

		}

	}


	public void update(OrganzVo organzVo, String type, String prntsOrgnzStr) {

		if (prntsOrgnzStr.isEmpty() || prntsOrgnzStr.equals(null) || prntsOrgnzStr.equals("0")) {
			organzVo.setPrntsOrgnzNo(-1);
		} else {
			organzVo.setPrntsOrgnzNo(Integer.parseInt(prntsOrgnzStr));
		}

		organzDao.update(organzVo);

	}

	
	public void updateOrganz(OrganzVo organzVo) {

		organzDao.updateOrganz(organzVo);

	}

	
	public void updateResrch(ResrchAcrsltVo resrchAcrsltVo) {

		organzDao.updateResrch(resrchAcrsltVo);

	}

	
	public void deleteOrganzInfo(int orgnzNo) {
		organzDao.deleteOrganzInfo(orgnzNo);

	}

	
	public void deleteOrganzInfo(int orgnzNo, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", orgnzNo);
		map.put("type", type);
		organzDao.deleteOrganzInfo(map);

	}


	public int lastInsertId() {
		return organzDao.lastInsertId();
	}

	public List<OrganzVo> getListByChar(String type, String start, String end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		return organzDao.getListByChar(map);
	}



	public List<OrganzVo> getResultList(Map<String, Object> map) {
		return organzDao.getResultList(map);
	}

	
	public List<CodeVo> getCode(String type) {
		
		String dstnct = null;

		if (type.equals("학과")) {
			dstnct = "학과";
		} else if (type.equals("연구실")) {
			dstnct = "연구분야";
		} else if (type.equals("전공")) {
			dstnct = "전공";
		}else if (type.equals("대학원")) {
			dstnct = "학문";
		}

		return organzDao.getCode(dstnct);
	}

}
