package main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	private static final Logger logger = LogManager.getLogger(BoardController.class);
	
	@Resource(name = "boardService")
    private BoardService boardService;

    @RequestMapping("/boardList.do")
    public String selectBoardList(
    		@RequestParam(value = "page", required = false, defaultValue = "1") int page,
    		@RequestParam(value = "searchType", required = false) String searchType,
    	    @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
    		ModelMap model
    ) {

    	logger.info("================ boardList.do ");
        int pageSize = 10;
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
            searchType = null;
        }
        if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
        	searchKeyword = null;
        }
        
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("start", start);
        paramMap.put("end", end);
        paramMap.put("searchType", searchType);
        paramMap.put("searchKeyword", searchKeyword);

        List<?> list = boardService.selectBoardList(paramMap);
        int totalCount = boardService.selectBoardTotalCount(paramMap);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);     
        
        model.addAttribute("resultList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("searchType", searchType);
        model.addAttribute("searchKeyword", searchKeyword);
        
        return "board/boardList"; // 리스트 폼
    }

    @RequestMapping("/boardWrite.do")
    public String boardWrite() {
    	logger.info("=================== boardWrite.do ");
        return "board/boardWrite"; // 작성 폼
    }

    @RequestMapping("/boardInsert.do")
    public String boardInsert(BoardVO vo) {
    	logger.info("==================== boardInsert.do ");
        boardService.insertBoard(vo); // insert
        return "redirect:/boardList.do"; 
    }

    // 조회수만 증가
    @RequestMapping("/increaseHit.do")
    @ResponseBody
    public void increaseHit(@RequestParam("unq") int unq) {
    	logger.info("==================== increaseHit.do ");
        boardService.updateBoardHits(unq);
    }
    
    @RequestMapping("/boardDetail.do")
    public String boardDetail(@RequestParam("unq") int unq, ModelMap model) {
    	logger.info("==================== boardDetail.do ");
        model.addAttribute("result", boardService.selectBoardDetail(unq));
        return "board/boardDetail"; // 상세 폼
    }
    
    @RequestMapping("/boardModifyWrite.do")
    public String boardModifyWrite(@RequestParam("unq") int unq, ModelMap model) {
    	logger.info("==================== boardModifyWrite.do ");
        BoardVO result = boardService.selectBoardDetail(unq); // 기존 글 정보 조회
        model.addAttribute("result", result);
        return "board/boardModifyWrite"; // 수정 폼
    }
    
    @RequestMapping(value="/checkPassword.do", method=RequestMethod.POST)
    public String checkPassword(
    		@RequestParam("unq") int unq, 
    		@RequestParam("pass") String inputPass,
    		@RequestParam("mode") String inputMode,
    		RedirectAttributes redirectAttr
    ){
        logger.info("==================== checkPassword.do");

    	BoardVO boardVO = boardService.selectBoardDetail(unq);
    	if (boardVO != null && boardVO.getPass().equals(inputPass)) {    
    		if (inputMode.equals("delete")){
    			logger.debug("==================== boardDelete.do : {}", unq);
    			return "redirect:/boardDelete.do?unq=" + unq;
    		}else {
        		logger.debug("==================== boardModifyWrite.do : {}", unq);
        		return "redirect:/boardModifyWrite.do?unq=" + unq;
    		}
    	}else {
    		logger.debug("==================== (불일치) boardDetail.do : {}", unq);
    		redirectAttr.addFlashAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
    		return "redirect:/boardDetail.do?unq=" + unq;
    	}
    }
    
    @RequestMapping("/boardUpdate.do")
    public String boardUpdate(BoardVO vo) {
    	logger.info("==================== boardUpdate.do ");
        boardService.updateBoard(vo); // update
        return "redirect:/boardList.do";
    }

    @RequestMapping("/boardDelete.do")
    public String boardDelete(@RequestParam("unq") int unq,RedirectAttributes redirectAttr) {
    	logger.info("==================== boardDelete.do ");
    	boardService.deleteBoard(unq);  // delete
        redirectAttr.addFlashAttribute("deleteMsg", "삭제 되었습니다.");
        return "redirect:/boardList.do";
    }
	
}
