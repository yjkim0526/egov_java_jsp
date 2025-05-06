package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;



@Controller
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}

	@RequestMapping(value="/codeWriteSave.do")
	public String insertCodes(CodeVO vo) throws Exception {
		
		// String result = null; 성공일 경우 null
		String result = codeService.insertCodes(vo);
		if (result == null ) {
			System.out.println("insert 성공");
		}else {
			System.out.println("insert 실패");
		}
		return "redirect:codeList.do";
	}
	
	@RequestMapping(value="/codeList.do")
	public String selectCodeList(CodeVO vo, ModelMap model) throws Exception{
		
		int total = codeService.selectCodesCount(vo);
		
		List<?> list = codeService.selectCodesList(vo);
    	// System.out.println(list);
    	
    	model.addAttribute("resultTotal", total);		
    	model.addAttribute("resultList", list);		
		return "code/codeList";
	}
}
