package main.servcie.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService") // controller와 연결 설정
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
    @Resource(name = "boardDAO")
    private BoardDAO boardDAO;

    public List<?> selectBoardList(Map<String, Object> map) {
        return boardDAO.selectBoardList(map);
    }

    public int selectBoardTotalCount(Map<String, Object> map) {
        return boardDAO.selectBoardTotalCount(map);
    }

    public void insertBoard(BoardVO vo) {
        boardDAO.insertBoard(vo);
    }

    public BoardVO selectBoardDetail(int unq) {
        return boardDAO.selectBoardDetail(unq);
    }

    public void updateBoard(BoardVO vo) {
        boardDAO.updateBoard(vo);
    }

    public void deleteBoard(int unq) {
        boardDAO.deleteBoard(unq);
    }

	@Override
	public void updateBoardHits(int unq) {
		boardDAO.updateBoardHits(unq);
	}

}
