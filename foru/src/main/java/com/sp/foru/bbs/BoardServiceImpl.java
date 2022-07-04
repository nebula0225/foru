package com.sp.foru.bbs;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.foru.bbs.Board;
import com.sp.foru.bbs.Reply;
import com.sp.foru.common.FileManager;
import com.sp.foru.common.dao.CommonDAO;

@Service("bbs.boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertBoard(Board dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			dao.insertData("bbs.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Board> list = null;
		
		try {
			list = dao.selectList("bbs.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Board readBoard(int num) {
		// TODO Auto-generated method stub
		Board dto = null;
		
		try {
			dto = dao.selectOne("bbs.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		// 조회수 증가
		try {
			dao.updateData("bbs.updateHitCount", num);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;

		try {
			dto = dao.selectOne("bbs.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;

		try {
			dto = dao.selectOne("bbs.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateBoard(Board dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}

				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}

			dao.updateData("bbs.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoard(int num, String pathname, String userId, int membership) throws Exception {
		// TODO Auto-generated method stub
		try {
			Board dto = readBoard(num);
			if (dto == null || (membership == 0 && ! dto.getUserId().equals(userId))) {
				return;
			}

			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dao.deleteData("bbs.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.insertData("bbs.insertBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.deleteData("bbs.deleteBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int boardLikeCount(int num) {
		// TODO Auto-generated method stub
		
		int result = 0;
		
		try {
			result = dao.selectOne("bbs.boardLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			Board dto = dao.selectOne("bbs.userBoardLiked", map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.insertData("bbs.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Reply> list = null;
		
		try {
			list = dao.selectList("bbs.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = 0;
		
		try {
			result = dao.selectOne("bbs.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.deleteData("bbs.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		List<Reply> list = null;
		
		try {
			list = dao.selectList("bbs.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		// TODO Auto-generated method stub
		int result = 0;
		
		try {
			result = dao.selectOne("bbs.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.insertData("bbs.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> countMap = null;
		
		try {
			countMap = dao.selectOne("bbs.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("bbs.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
