package com.bit.yanado.model.dao;

import java.util.List;
import java.util.Map;

import com.bit.yanado.model.dto.BookMark;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.MemInfo;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.QNA;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.WatchingReco;

public interface MemInfoMapper {

	public void insertMem(MemInfo mem);

	public List<MemInfo> listMem(MemInfo mem);

	public MemInfo selectMem(MemInfo mem);

	public MemInfo loginMem(MemInfo mem);
	
	/* update login data */
	public void loginData(String id);

	public int idCheck(String id);

	public void modifyMem(MemInfo mem);
	
	public void leavingMem(MemInfo mem);

	public List<QNA> listQna(Criteria cri);

	public int countQna(Criteria cri);

	public List<QNA> myQna(String id);

	public void writeQna(QNA qna);
	
	/* admin reply Qna */
	public void replyQna(QNA qna);

	public void insertBookMark(BookMark book);

	public void bookmark(Map<String, Object> map);

	/* member to bookmark for watching the video */
	public List<BookMark> getBookmark(String id);
	
	public void delBookMark(Map<String, Object> map);

	public int checkBookMark(Map<String, Object> map);

	public List<Map<String, Object>> selectBookMark(String id);

	public List<Map<String, Object>> selectwatchReco(String id);

	public void videoRecord(WatchingReco rec);

	public int checkRecord(Map<String, Object> map);

	public void updateRecord(WatchingReco rec);

	public VideoInfo selectVideo(VideoInfo video);

	public List<Map<String, Object>> listReco(String id, int uniqueNo);

	public List<Map<String, Object>> playReco(WatchingReco rec);

	public WatchingReco playReco(String id, int uniqueNo);

}
