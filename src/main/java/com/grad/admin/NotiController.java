package com.grad.admin;

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
import com.grad.admin.service.NotiService;
import com.grad.admin.vo.ApndngFileVo;
import com.grad.admin.vo.CodeForm;
import com.grad.admin.vo.NotiVo;

@Controller
@RequestMapping("/noti")
public class NotiController {

	@Autowired
	NotiService notiService;
	
	
	@Autowired
	ApndngFileService apndngFileService;
	
	

	/*
	 * 허규준, 모집공고 리스트 불러오기
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String notiAllList(Model model) {
		model.addAttribute("notiList", notiService.getNotiList("%"));
		return "/noti/list";
	}

	/*
	 * 허규준, 대학원 모집공고 리스트 불러오기
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/grad", method = RequestMethod.GET)
	public String notiGradList(@RequestParam(value = "page", required = true, defaultValue = "1") int page,
			Model model) {
		model.addAttribute("notiList", notiService.getNotiList("대학원"));
		return "/noti/gradlist";
	}

	/*
	 * 허규준, 연구실 모집공고 리스트 불러오기
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/lab", method = RequestMethod.GET)
	public String notiLabList(Model model) {
		model.addAttribute("notiList", notiService.getNotiList("연구실"));
		return "/noti/lablist";
	}

	/*
	 * 정예린, 모집공고 입력 기능
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/insert")
	public String insertNoti(@RequestParam("type") String type) {

		if (type.equals("대학원")) {
			type = "grad";
		} else if (type.equals("연구실")) {
			type = "lab";
		}

		return "noti/insert" + type;
	}

	/*
	 * 정예린, 모집공고 입력 기능
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertNoti(@ModelAttribute NotiVo notiVo, @RequestParam String type,
			@ModelAttribute CodeForm codeForm, @RequestParam(value = "attachFile", required = false) MultipartFile[] attachFile) {

		
		if(type.equals("연구실")) {
			type="lab";
		}else if(type.equals("대학원")) {
			type="grad";
		}
		
		notiService.insertNoti(notiVo, type);

		int lastId = notiService.lastInsertId();

		if (codeForm == null) {
			
		} else {
			notiService.setNotiInfo(lastId,codeForm);
		}
		
		/*
		 * 박가혜, 모집공고 파일첨부 기능
		 */	
		
		ApndngFileVo vo = null;
		
		
		
		if (attachFile != null) {
			for (int i = 0; i < attachFile.length; i++) {

				if (!attachFile[i].isEmpty()) {
					apndngFileService.restore(attachFile[i]);
					vo = apndngFileService.getFileVo();
					vo.setPrntsDstnct("모집공고");
					vo.setPrntsNo(lastId);
					apndngFileService.insert(vo);
				}
			}
		}

		return "redirect:/noti/list";
	}

	/*
	 * 정예린, 박가혜, 모집공고 수정 기능
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/update")
	public String notiDetail(@RequestParam("no") int no, @RequestParam("tabnm") String tabnm, Model model) {

		model.addAttribute("vo", notiService.getNoti(tabnm, no));
		if (tabnm.equals("대학원")) {
			tabnm = "grad";
		} else if (tabnm.equals("연구실")) {
			tabnm = "lab";
		}

		return "/noti/update" + tabnm;
	}

	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String notiDetail(@ModelAttribute NotiVo notiVo, @RequestParam("tabnm") String tabnm) {

		notiService.updateNoti(tabnm, notiVo);

		return "redirect:/noti/list";
	}

}
