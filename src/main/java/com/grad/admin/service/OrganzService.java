package com.grad.admin.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.OrganzDao;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;


/*
 * 정예린 : admin으로 옮김
 */

@Service
public class OrganzService {
	
	@Autowired
	OrganzDao organzDao;
	
	/*
	 * 박가혜
	 */
	public void insertLab(OrganzVo organzVo) {
		
		organzDao.insertLab(organzVo);

	}

	/*
	 * 박가혜
	 */
	public void insertResrch(ResrchAcrsltVo resrchAcrsltVo) {
		
		organzDao.insertResrch(resrchAcrsltVo);

	}
	
	/*
	 * 허주한
	 * */
	public boolean insertGrad(OrganzVo organzVo, String tabnm, String prntsOrgnzStr) {
		if(prntsOrgnzStr.isEmpty() || prntsOrgnzStr.equals(null)) {
			organzVo.setPrntsOrgnzNo(-1);
		} else {
			organzVo.setPrntsOrgnzNo(Integer.parseInt(prntsOrgnzStr));
		}
		
		return organzDao.insertGrad(organzVo);
	}
	
	/*
	 * 허주한
	 * */
	public  OrganzVo getOrganz(int no) {
		return organzDao.getByNo(no);
	}
	
	/*
	 * 박가혜
	 * */
	public List<OrganzVo> getOrganzLabList(){
		return organzDao.getOrganzLabList();
	}

	
	public void updateOrganz(OrganzVo organzVo) {

		
		organzDao.updateOrganz(organzVo);
		
	}
	
	public List<ResrchAcrsltVo> getResrchList(int orgnzNo){
		
		return organzDao.getResrchList(orgnzNo);
	}
	
	
	public ResrchAcrsltVo getResrchNo(int resrchAcrsltNo){
		
		return organzDao.getResrchNo(resrchAcrsltNo);
	}
	
	
	
	public void updateResrch(ResrchAcrsltVo resrchAcrsltVo) {

		
		organzDao.updateResrch(resrchAcrsltVo);
		
	}
	
}
