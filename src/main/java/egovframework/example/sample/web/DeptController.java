package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	
	@Resource(name="deptService")
	private DeptService deptService;
    
    @RequestMapping(value = "/deptWrite.do")
    public String deptWrite() {
        System.out.println("deptWrite.do");
        return "/dept/deptWrite";
    }	
    
    @RequestMapping(value="/deptWriteSave.do")
    public String InsertDept(DeptVO vo) throws Exception {
    	
    	System.out.println("deptWriteSave.do");
    	System.out.println(vo.getDeptno());
    	System.out.println(vo.getDname());
    	System.out.println(vo.getLoc());
    	
    	String result = deptService.InsertDept(vo);
    	if ( result == null ) { 
    		System.out.println("저장 완료");
    	} else {
    		System.out.println("저장 실패");
    	}
    	
    	return "";
    }
    
    
    @RequestMapping(value="/deptList.do")
    public String selectDeptList(DeptVO vo, ModelMap model) throws Exception{
    	
    	List<?> list = deptService.SelectDeptList(vo);
    	System.out.println(list);
    	model.addAttribute("resultList", list);
    	
    	return "/dept/deptList";
    }
    
    @RequestMapping(value="/deptDetail.do")
    public String selectDeptDetail(int deptno, ModelMap model) throws Exception{
    	DeptVO vo = deptService.selectDeptDetail(deptno);
    	System.out.println("(deptDetail) 부서번호:"+vo.getDeptno());
    	
    	model.addAttribute("deptVO",vo);
    	return "dept/deptDetail";
    }
    
    @RequestMapping(value="/deptDelete.do")
    public String deptDelete(int deptno, RedirectAttributes redirectAttributes) throws Exception {
        int result = deptService.deleteDept(deptno);
        System.out.println("result:" + result);
        
        if (result == 1) {
            System.out.println("삭제 완료");
        } else {
            System.out.println("삭제 실패");
            redirectAttributes.addFlashAttribute("errorMessage", "삭제에 실패했습니다. 다시 시도해주세요.");
        }
        return "redirect:/deptList.do";  // 리다이렉트하여 리스트 페이지로 이동
    }
    

    @RequestMapping(value="/deptModifyWrite.do")
    public String selectDeptModify(int deptno, ModelMap model) throws Exception {

    	DeptVO vo = deptService.selectDeptDetail(deptno);
    	System.out.println("(deptModifyWrite) 부서번호:"+vo.getDeptno());
    	
    	model.addAttribute("vo",vo);    			
    	return "dept/deptModifyWrite";
    }
 
    
    @RequestMapping(value="/deptModifySave.do")
    public String updateDept(DeptVO vo) throws Exception {
    	
    	int result = deptService.updateDept(vo);
    	if (result == 1 ) {
    		System.out.println("수정완료");
    	}else {
    		System.out.println("수정실패");
    	}

    	return "redirect:deptList.do";
    }
    
}
