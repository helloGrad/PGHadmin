package com.grad.admin.vo;

import java.util.List;

public class CodeForm {
	private List<CodeVo> codes;

	public List<CodeVo> getCodes() {
		return codes;
	}

	public void setCodes(List<CodeVo> codes) {
		this.codes = codes;
	}

	@Override
	public String toString() {
		return "CodeForm [codes=" + codes + "]";
	}
	
	
	
	
	
}
