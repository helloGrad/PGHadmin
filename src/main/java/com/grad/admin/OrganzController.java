package com.grad.admin;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.grad.admin.security.Auth;
import com.grad.admin.service.ApndngFileService;
import com.grad.admin.service.OrganzService;
import com.grad.admin.vo.ApndngFileVo;
import com.grad.admin.vo.CodeForm;
import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;
import org.apache.commons.lang3.StringUtils;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/organz")
public class OrganzController {

	@Autowired
	OrganzService organzService;

	@Autowired
	ApndngFileService apndngFileService;


	/*
	 * 허주한, 대학교 리스트 
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/unilist")
	public String uniList(Model model) {

		model.addAttribute("list", organzService.getOrgnzList("대학교"));
		return "/organz/list";
	}

	/*
	 * 허주한, 대학원 리스트
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping({ "/list", "/gradlist" })
	public String gradList(Model model) {

		model.addAttribute("list", organzService.getOrgnzList("대학원"));
		return "/organz/list";
	}

	/*
	 * 허주한, 학과 리스트
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/deptlist")
	public String deptList(Model model) {

		model.addAttribute("list", organzService.getOrgnzList("학과"));
		return "/organz/list";
	}

	/*
	 * 박가혜, 연구실 리스트
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/lablist") 
	public String lablist(Model model) {

		model.addAttribute("list", organzService.getOrganzLabList());

		return "organz/list";
	}

	/*
	 * 박가혜, 연구실적 리스트
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/resrchlist") 
	public String resrchlist(Model model, @RequestParam(value = "no", required = true, defaultValue = "") int orgnzNo) {

		List<ResrchAcrsltVo> resrchAcrsltList = organzService.getResrchList(orgnzNo);
		model.addAttribute("resrchAcrsltList", resrchAcrsltList);

		return "organz/resrchlist";
	}



	/*
	 * 허주한, 대학원, 대학교 , 학과 입력
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/insertform")
	public String insertGradForm(Model model, @RequestParam String type) {

		if (type.equals("대학원") || type.equals("대학교") || type.equals("학과")) {
			return "/organz/insertgrad";
		} else {
			return "organz/insertlab";
		}

	}

	/*
	 * 허주한,박가혜 ,정예린, 대학원, 대학교 , 학과 입력
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertGrad(Model model, @ModelAttribute OrganzVo organzVo,
			@RequestParam(value = "prntsOrgnzStr", required = true, defaultValue = "") String prntsOrgnzStr,
			@ModelAttribute ResrchAcrsltVo resrchAcrsltVo,
			@RequestParam(value = "tabnm", required = true, defaultValue = "") String tabnm,
			@RequestParam(value = "attachFile", required = false) MultipartFile[] attachFile,
			@RequestParam(value = "cdlist", required = true, defaultValue = "") List<String> cdlist,
			@ModelAttribute("codeForm") CodeForm codeForm) {

		int lastId = 0;
		ApndngFileVo vo = null;


		List<String> infoList = new ArrayList<String>();
		
		

		if (codeForm.getCodes().get(0).getCdId().equals("-1") && codeForm.getCodes2().get(0).getCdId().equals("-1")) {
			

		} else {

			for (int i = 0; i < codeForm.getCodes().size(); i++) {

				infoList.add(i, codeForm.getCodes().get(i).getCdId());
			}

		}

		if (organzVo.getOrgnzDstnct().equals("연구실")) {

			if (resrchAcrsltVo.getResrchText() == null) { 
				System.out.println("연구실 입력");
				organzService.insertLab(organzVo);
			}

			if (organzVo.getOrgnzNm() == null) {
				organzService.insertResrch(resrchAcrsltVo);
			}

		} else {
			
		}

		lastId = organzService.lastInsertId();

	
		if (organzVo.getOrgnzDstnct().equals("학과") && codeForm.getCodes().size() != 0) {
			organzService.setOrganzInfo(lastId, codeForm);
		}
		if (cdlist.size() != 0) {
			organzService.setOrganzInfo(lastId, cdlist);
		}
		
		
		if (infoList.size() != 0 && organzVo.getOrgnzDstnct().equals("연구실")) {
			
			
			organzService.setOrganzInfo(lastId,infoList);
		
		}
		

		/*
		 * 허주한, 기관 첨부파일 등록(대학교 로고)
		 */

		if (attachFile != null) {
			for (int i = 0; i < attachFile.length; i++) {

				if (!attachFile[i].isEmpty()) {
					apndngFileService.restore(attachFile[i]);
					vo = apndngFileService.getFileVo();
					vo.setPrntsDstnct(organzVo.getOrgnzDstnct());
					vo.setPrntsNo(lastId);
					apndngFileService.insert(vo);
				}
			}
		}

		return "redirect:/organz/list";
	}


	/*
	 * 허주한,박가혜 ,정예린, 대학원, 대학교 , 학과 수정
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/updateform")
	public String updateGradForm(Model model, @RequestParam int no, @RequestParam String type) {

		
		List<CodeVo> codeList = organzService.getOrganzInfo(no);
		List<CodeVo> codeList1 = organzService.getOrganzInfo(no, "학과");
		List<CodeVo> codeList2 = organzService.getOrganzInfo(no, "전공");
		model.addAttribute("codeList", codeList);
		model.addAttribute("codeList1", codeList1);
		model.addAttribute("codeList2", codeList2);
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("codeList", jsonArray.fromObject(codeList));
		model.addAttribute("codeList1", jsonArray.fromObject(codeList1));
		model.addAttribute("codeList2", jsonArray.fromObject(codeList2));

		
		if (type.equals("연구실")) { 

			model.addAttribute("organzLabList", organzService.getOrganz(no));
			return "organz/labupdatedetail";

		} else {

			model.addAttribute("vo", organzService.getOrgnzByNo(no, type));
			model.addAttribute("fileList", apndngFileService.getFileList(no, type));
			return "organz/updategrad";

		}
	}

	/*
	 * 허주한,박가혜 ,정예린,대학원, 대학교 , 학과 수정
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateGrad(Model model, @ModelAttribute OrganzVo organzVo, @RequestParam String type,
			@RequestParam(value = "prntsOrgnzStr", required = true, defaultValue = "") String prntsOrgnzStr,
			@RequestParam(value = "cdlist", required = true, defaultValue = "") List<String> cdlist,
			@ModelAttribute("codeForm") CodeForm codeForm) {
		
		

		
		List<String> infoList = new ArrayList<String>();

		int index = 0;
		

		if (codeForm.getCodes() != null) {

			for (int i = 0; i < codeForm.getCodes().size(); i++) {

				if (codeForm.getCodes().get(i).getCdId() == null) {

				} else {

					infoList.add(index, codeForm.getCodes().get(i).getCdId());
					index++;
				}
			}
		}


		if (cdlist.size() != 0 || codeForm.getCodes() != null || codeForm.getCodes2() != null) {
			organzService.deleteOrganzInfo(organzVo.getOrgnzNo());
			organzService.setOrganzInfo(organzVo.getOrgnzNo(), cdlist);			
			
			if(organzVo.getOrgnzDstnct().equals("연구실")) {
				organzService.setOrganzInfo(organzVo.getOrgnzNo(), infoList);
			}			

		} else {

			organzService.deleteOrganzInfo(organzVo.getOrgnzNo());
		}
		
		if (type.equals("연구실")) {

			organzService.updateOrganz(organzVo);
			
			return "redirect:/organz/lablist";

		} else {
			
		
			organzService.update(organzVo, type, prntsOrgnzStr);
			if (type.equals("학과")) {
				organzService.deleteOrganzInfo(organzVo.getOrgnzNo(), "학과");
				if (codeForm.getCodes() != null || codeForm.getCodes2() != null) {
					organzService.setOrganzInfo(organzVo.getOrgnzNo(), codeForm);
				}

			}
			return "redirect:/organz/list";
		}
	}

	/*
	 * 박가혜, 연구실적 
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/resrchdetail") 
	public String resrchdetail(Model model,
			@RequestParam(value = "no", required = true, defaultValue = "") int resrchAcrsltNo) {

		ResrchAcrsltVo resrchAcrsltVo = organzService.getResrchNo(resrchAcrsltNo);
		model.addAttribute("resrchAcrsltVo", resrchAcrsltVo);

		return "organz/resrchupdate";
	}

	/*
	 * 박가혜, 연구실적 수정
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/resrchupdate", method = RequestMethod.POST) // 연구실적 수정폼
	public String resrchupdate(Model model, @ModelAttribute ResrchAcrsltVo resrchAcrsltVo) {

		organzService.updateResrch(resrchAcrsltVo);
		return "redirect:/organz/lablist";
	}



	/*
	 * 정예린 , 기관 검색하기 기능
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/search")
	public String search(@RequestParam(value = "stext", required = true, defaultValue = "**") String stext,
			@RequestParam(value = "type", required = true, defaultValue = "") String type, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("type", type);
		map.put("stext", stext);

		if (type.equals("연구실업데이트")) {
			map.put("type2", "대학원");
			map.put("type", "학과");
		}

		model.addAttribute("list", organzService.getResultList(map));
		return "/organz/search";
	}

}
