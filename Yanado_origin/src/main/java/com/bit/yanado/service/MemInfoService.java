package com.bit.yanado.service;

import java.util.List;
import java.util.Map;

import com.bit.yanado.model.dto.BookMark;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.MemInfo;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.QNA;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.WatchingReco;

public interface MemInfoService {

	public void insertMem(MemInfo mem);

	public List<MemInfo> listMem(MemInfo mem);

	public MemInfo selectMem(MemInfo mem);

	public MemInfo loginMem(MemInfo mem);

	/* updqte login data */
	public void loginData(String id);
	
	/* join id check */
	public int idCheck(String id);

	/* meminfo modify */
	public void modifyMem(MemInfo mem);

	/* leaving mem */
	public void leavingMem(MemInfo mem);

	/* qna paging + searching */
	public List<QNA> listQna(Criteria cri);

	/* qna total count */
	public int countQna(Criteria cri);

	/* my qna list */
	public List<QNA> myQna(String id);

	/* write qna */
	public void writeQna(QNA qna);
	
	/* admin reply qna */
	public void replyQna(QNA qna);

	/* member to bookmark for watching the video */
	public List<BookMark> getBookmark(String id);
	
	void insertBookMark(BookMark book);

	public void bookmark(Map<String, Object> map);

	public void delBookMark(Map<String, Object> map);

	public int checkBookMark(Map<String, Object> map);

	public List<Map<String, Object>> selectBookMark(String id);

	public List<Map<String, Object>> selectwatchReco(String id);

	public void videoRecord(WatchingReco rec);

	public int checkRecord(Map<String, Object> map);

	public void updateRecord(WatchingReco rec);

	public VideoInfo selectVideo(VideoInfo video);

	public List<Map<String, Object>> listReco(String id, int uniqueNo);

//	public List<Map<String, Object>> playReco(WatchingReco rec);

	public WatchingReco playReco(String id, int uniqueNo);
}
