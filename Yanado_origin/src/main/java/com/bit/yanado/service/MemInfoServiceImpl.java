package com.bit.yanado.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yanado.model.dao.MemInfoMapper;
import com.bit.yanado.model.dto.BookMark;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.LoginUtil;
import com.bit.yanado.model.dto.MemInfo;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.QNA;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.WatchingReco;

@Service("MeminfoServiceImpl")
public class MemInfoServiceImpl implements MemInfoService {

	@Autowired
	MemInfoMapper memInfoMapper;

	@Override
	public void insertMem(MemInfo mem) {
		memInfoMapper.insertMem(mem);
	}

	@Override
	public List<MemInfo> listMem(MemInfo mem) {
		return memInfoMapper.listMem(mem);
	}

	@Override
	public int idCheck(String id) {
		return memInfoMapper.idCheck(id);
	}

	@Override
	public MemInfo selectMem(MemInfo mem) {
		return memInfoMapper.selectMem(mem);
	}

	@Override
	public MemInfo loginMem(MemInfo mem) {
		return memInfoMapper.loginMem(mem);
	}

	@Override
	public List<QNA> listQna(Criteria cri) {
		return memInfoMapper.listQna(cri);
	}

	@Override
	public int countQna(Criteria cri) {
		return memInfoMapper.countQna(cri);
	}

	@Override
	public void insertBookMark(BookMark book) {
		memInfoMapper.insertBookMark(book);
	}

	@Override
	public void bookmark(Map<String, Object> map) {
		memInfoMapper.bookmark(map);
	}

	@Override
	public void delBookMark(Map<String, Object> map) {
		memInfoMapper.delBookMark(map);
	}

	@Override
	public int checkBookMark(Map<String, Object> map) {
		return memInfoMapper.checkBookMark(map);

	}

	@Override
	public List<Map<String, Object>> selectBookMark(String id) {
		return memInfoMapper.selectBookMark(id);
	}

	@Override
	public void videoRecord(WatchingReco rec) {
		memInfoMapper.videoRecord(rec);
	}

	@Override
	public int checkRecord(Map<String, Object> map) {
		return memInfoMapper.checkRecord(map);
	}

	@Override
	public void updateRecord(WatchingReco rec) {
		memInfoMapper.updateRecord(rec);

	}

	@Override
	public List<Map<String, Object>> selectwatchReco(String id) {
		return memInfoMapper.selectwatchReco(id);
	}

	@Override
	public VideoInfo selectVideo(VideoInfo video) {
		return memInfoMapper.selectVideo(video);
	}

	@Override
	public WatchingReco playReco(String id, int uniqueNo) {
		return memInfoMapper.playReco(id, uniqueNo);
	}

	@Override
	public List<Map<String, Object>> listReco(String id, int uniqueNo) {
		return memInfoMapper.listReco(id, uniqueNo);
	}

	@Override
	public List<QNA> myQna(String id) {
		return memInfoMapper.myQna(id);
	}

	@Override
	public void writeQna(QNA qna) {
		memInfoMapper.writeQna(qna);
	}

	@Override
	public void modifyMem(MemInfo mem) {
		memInfoMapper.modifyMem(mem);
	}

	@Override
	public void leavingMem(MemInfo mem) {
		memInfoMapper.leavingMem(mem);
	}

	@Override
	public void replyQna(QNA qna) {
		memInfoMapper.replyQna(qna);
	}

	@Override
	public List<BookMark> getBookmark(String id) {
		return memInfoMapper.getBookmark(id);
	}

	@Override
	public void loginData(String id) {
		memInfoMapper.loginData(id);
	}

}
