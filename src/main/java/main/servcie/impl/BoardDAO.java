package main.servcie.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

    public List<?> selectBoardList(Map<String, Object> map) {
        return list("BoardDAO.selectBoardList", map);
    }

    public int selectBoardTotalCount(Map<String, Object> map) {
        return (Integer) select("BoardDAO.selectBoardTotalCount", map);
    }

    public void insertBoard(BoardVO vo) {
        insert("BoardDAO.insertBoard", vo);
    }

    public BoardVO selectBoardDetail(int unq) {
        return (BoardVO) select("BoardDAO.selectBoardDetail", unq);
    }

    public void updateBoard(BoardVO vo) {
        update("BoardDAO.updateBoard", vo);
    }

    public void deleteBoard(int unq) {
        delete("BoardDAO.deleteBoard", unq);
    }
}
