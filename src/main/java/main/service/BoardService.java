package main.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<?> selectBoardList(Map<String, Object> map);
    int selectBoardTotalCount(Map<String, Object> map);
    void insertBoard(BoardVO vo);
    BoardVO selectBoardDetail(int unq);
    void updateBoard(BoardVO vo);
    void deleteBoard(int unq);
}
