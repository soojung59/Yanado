package com.bit.yanado.model.dao;

import java.util.List;
import java.util.Map;

import com.bit.yanado.model.dto.BookMark;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.Poster;
import com.bit.yanado.model.dto.Tag;
import com.bit.yanado.model.dto.TagName;
import com.bit.yanado.model.dto.Teaser;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.VideoTitle;
import com.bit.yanado.model.dto.WatchingReco;
import com.bit.yanado.service.VideoService;

public interface VideoMapper {

	public List<Map<String, Object>> posterList(Poster poster);

	public List<Map<String, Object>> watchingList(Poster poster);

	public List<Map<String, Object>> searchList(Criteria cri);

	public List<VideoInfo> getListWithPaging(Criteria cri);

	public List<Map<String, Object>> searchList(String keyword);

	public void insertPoster(Poster poster);

	public void insertTeaser(Teaser teaser);

	public void insertTag (Tag tag);
	
	public void insertTitle(VideoTitle title);
	
	public int deleteVideo(String uniqueNo);

	public int deletePoster(int titleSeq);

	public int deleteTeaser(int titleSeq);

	public void updateVideo(VideoInfo video);

	public int updatePoster(int titleSeq);

	public int updateTeaser(int titleSeq);

	public void updateTagNameCount(String tagName);

	public VideoInfo selectVideo(VideoInfo video);

	public Poster selectPoster(int titleSeqSeason);
	
	public Teaser selectTeaser(int titleSeq);
	
	public List<VideoInfo> teaserList();
	
	public List<VideoInfo> getTitle();

	public List<TagName> getTag();

	public int maxUniqueNo();

	public int todayLogin();
	
	public int countMem();
	
	public int countVd();
	
	public int watchiedVideo();

	public void popularVd();

	public void insertVideo(VideoInfo video);

	public WatchingReco selectWatch(WatchingReco record);

	public int countVideo(Criteria cri);

	public List<VideoInfo> getListWithPaging(Paging paging);

	public VideoInfo get(String uniqueNo);

	public List<VideoInfo> getAllVideo();

}
