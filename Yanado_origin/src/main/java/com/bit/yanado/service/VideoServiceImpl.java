package com.bit.yanado.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Namespace;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yanado.model.dao.VideoMapper;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.Poster;
import com.bit.yanado.model.dto.Tag;
import com.bit.yanado.model.dto.TagName;
import com.bit.yanado.model.dto.Teaser;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.VideoTitle;
import com.bit.yanado.model.dto.WatchingReco;

@Service("VideoServiceImpl")
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoMapper videoMapper;


	@Override
	public void insertVideo(VideoInfo video) {
		videoMapper.insertVideo(video);

	}

	@Override
	public int deleteVideo(String uniqueNo)  {
		return videoMapper.deleteVideo(uniqueNo);

	}

	@Override
	public int countVideo(Criteria cri) {
		return videoMapper.countVideo(cri);
	}

	@Override
	public List<VideoInfo> getListWithPaging(Criteria cri) {
		return videoMapper.getListWithPaging(cri);
	}

	@Override
	public void insertPoster(Poster poster) {
		videoMapper.insertPoster(poster);
	}

	@Override
	public VideoInfo get(String uniqueNo) {
		return videoMapper.get(uniqueNo);
	}

	@Override
	public List<Map<String, Object>> posterList(Poster poster) {
		return videoMapper.posterList(poster);
	}

	@Override
	public List<Map<String, Object>> searchList(Criteria cri) {
		return videoMapper.searchList(cri);
	}

	@Override
	public VideoInfo selectVideo(VideoInfo video)  {
		return videoMapper.selectVideo(video);
	}

	@Override
	public WatchingReco selectWatch(WatchingReco record) {
		return videoMapper.selectWatch(record);
	}

	@Override
	public List<Map<String, Object>> searchList(String keyword) {
		return videoMapper.searchList(keyword);
	}


	@Override
	public List<VideoInfo> getTitle() {
		return videoMapper.getTitle();
	}

	@Override
	public List<TagName> getTag() {
		return videoMapper.getTag();
	}

	@Override
	public int maxUniqueNo() {
		return videoMapper.maxUniqueNo();
	}

	@Override
	public void insertTeaser(Teaser teaser) {
		videoMapper.insertTeaser(teaser);
	}

	@Override
	public int deletePoster(int titleSeqSeason) {
		return videoMapper.deletePoster(titleSeqSeason);
	}

	@Override
	public int deleteTeaser(int titleSeq) {
		return videoMapper.deleteTeaser(titleSeq);
	}

	@Override
	public void updateVideo(VideoInfo video)  {
		videoMapper.updateVideo(video);

	}
	
	@Override
	public int updatePoster(int titleSeq) {
		return videoMapper.updatePoster(titleSeq);
	}

	@Override
	public int updateTeaser(int titleSeq) {
		return videoMapper.updateTeaser(titleSeq);
	}

	@Override
	public Poster selectPoster(int titleSeq) {
		return videoMapper.selectPoster(titleSeq);
	}

	@Override
	public Teaser selectTeaser(int titleSeq) {
		return videoMapper.selectTeaser(titleSeq);
	}

	@Override
	public List<VideoInfo> teaserList() {
		return videoMapper.teaserList();
	}

	@Override
	public void updateTagNameCount(String tagName) {
		videoMapper.updateTagNameCount(tagName);
	}

	@Override
	public void insertTag(Tag tag) {
		videoMapper.insertTag(tag);
	}

	@Override
	public void insertTitle(VideoTitle title) {
		videoMapper.insertTitle(title);
	}

	@Override
	public int todayLogin() {
		return videoMapper.todayLogin();
	}

	@Override
	public int countMem() {
		return videoMapper.countMem();
	}

	@Override
	public int countVd() {
		return videoMapper.countVd();
	}

	@Override
	public int watchiedVideo() {
		return videoMapper.watchiedVideo();
	}

	@Override
	public void popularVd() {
		videoMapper.popularVd();
	}


}
