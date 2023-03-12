package com.bit.yanado.service;

import java.util.List;
import java.util.Map;

import org.apache.jasper.util.UniqueAttributesImpl;

import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.Poster;
import com.bit.yanado.model.dto.Tag;
import com.bit.yanado.model.dto.TagName;
import com.bit.yanado.model.dto.Teaser;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.VideoTitle;
import com.bit.yanado.model.dto.WatchingReco;

public interface VideoService {

	public List<Map<String, Object>> posterList(Poster poster);

	public List<Map<String, Object>> searchList(Criteria cri);

	public List<Map<String, Object>> searchList(String keyword);

	/* select subject during administrator writing */
	public List<VideoInfo> getTitle();

	/* select tag during administrator writing */
	public List<TagName> getTag();

	/* select max uniqueNo during administrator writing */
	public int maxUniqueNo();

	/* insert Poster */
	public void insertPoster(Poster poster);

	/* insert Teaser */
	public void insertTeaser(Teaser teaser);

	/* insert Video */
	public void insertVideo(VideoInfo video);

	/* insert Title */
	public void insertTitle(VideoTitle title);
	
	/* insert Tag */
	public void insertTag (Tag tag);
	
	/* read Video */
	public VideoInfo selectVideo(VideoInfo video);

	/* read Poster */
	public Poster selectPoster(int titleSeqSeason);

	/* read Teaser */
	public Teaser selectTeaser(int titleSeq);

	/* delete Video */
	public int deleteVideo(String uniqueNo);

	/* delete Poster */
	public int deletePoster(int titleSeq);

	/* delete Teaser */
	public int deleteTeaser(int titleSeq);

	/* update Video */
	public void updateVideo(VideoInfo video);

	/* update Poster */
	public int updatePoster(int titleSeq);

	/* update Teaser */
	public int updateTeaser(int titleSeq);
	
	/* update TagName */
	public void updateTagNameCount(String tagName);

	/* list Teaser */
	public List<VideoInfo> teaserList();
	
	/* today Login count */
	public int todayLogin();
	
	/* count Member */
	public int countMem();
	
	/* count Video */
	public int countVd();

	/* count watchi Video */
	public int watchiedVideo();
	
	/* count pupular video */
	public void popularVd();
	
	public WatchingReco selectWatch(WatchingReco record);

	public int countVideo(Criteria cri);

	public List<VideoInfo> getListWithPaging(Criteria cri);

	public VideoInfo get(String uniqueNo);

}
