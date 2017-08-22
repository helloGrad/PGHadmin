package com.grad.admin;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.admin.security.Auth;
import com.grad.admin.service.OrganzService;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;


@Controller
@RequestMapping("/organz")
public class OrganzController {

	/*
	 * 정예린 : admin으로 옮김
	 */
	@Autowired
	OrganzService organzService;


	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/list")
	public String Organzlist(Model model) {

		return "organz/list";
	}

	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/lablist") // 연구실 리스트
	public String lablist(Model model) {

		List<OrganzVo> organzVo = organzService.getOrganzLabList();

		model.addAttribute("organzLabList", organzVo);

		return "organz/lablist";
	}
	
	
	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/updateform") // 수정하기
	public String updateform(Model model, @RequestParam(value = "no", required = true, defaultValue = "") int orgnzNo,
			@RequestParam(value = "type", required = true, defaultValue = "") String type) {

		if (type.equals("lab")) {

			OrganzVo organzVo = organzService.getOrganz(orgnzNo);

			model.addAttribute("organzLabList", organzVo);

		}

		return "organz/labupdatedetail";
	}

	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, @ModelAttribute OrganzVo organzVo, @RequestParam String type) {

		if (type.equals("lab")) {

			organzService.updateOrganz(organzVo);

		}

		return "redirect:/organz/lablist";
	}
	
	
	
	
	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/insert")
	public String insert(Model model, @RequestParam(value = "type", required = true, defaultValue = "") String type) {

		if (type.equals("lab")) {

		}

		return "organz/labdetail";
	}

	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute OrganzVo organzVo, @ModelAttribute ResrchAcrsltVo resrchAcrsltVo,
			@RequestParam(value = "prntsOrgnzStr", required = true, defaultValue = "") String prntsOrgnzStr,
			@RequestParam(value = "type", required = true, defaultValue = "") String type) {

		if (type.equals("lab")) {

			if (resrchAcrsltVo.getResrchText() == null) { // 연구실입력인 경우
				organzService.insertLab(organzVo);
			}

			if (organzVo.getOrgnzNm() == null) { // 연구실적입력인 경우
				organzService.insertResrch(resrchAcrsltVo);
			}

		}

		return "redirect:/organz/lablist";
	}
	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/resrchlist") //연구실적리스트
	public String resrchlist(Model model, @RequestParam(value = "no", required = true, defaultValue = "") int orgnzNo) {

		List<ResrchAcrsltVo> resrchAcrsltList = organzService.getResrchList(orgnzNo);
		model.addAttribute("resrchAcrsltList", resrchAcrsltList);

		return "organz/resrchlist";
	}
	
	

	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/resrchdetail") //연구실적 수정폼
	public String resrchdetail(Model model, @RequestParam(value = "no", required = true, defaultValue = "") int resrchAcrsltNo) {

		
		
		ResrchAcrsltVo resrchAcrsltVo = organzService.getResrchNo(resrchAcrsltNo);
		model.addAttribute("resrchAcrsltVo", resrchAcrsltVo);
	
		
		return "organz/resrchupdate";
	}
	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/resrchupdate" ,method = RequestMethod.POST)//연구실적 수정폼
	public String resrchupdate(Model model, @ModelAttribute ResrchAcrsltVo resrchAcrsltVo) {

		
		
		organzService.updateResrch(resrchAcrsltVo);
	
		
		return "redirect:/organz/lablist";
	}
	

}
