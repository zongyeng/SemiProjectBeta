package semi.dto;

import java.util.Date;

public class MusiclistDto {
	
	private int music_seq;
	private int music_artist;
	private int music_no;
	private String music_title;
	private int music_size;
	private int music_length;
	private int music_hl_time;
	private String music_content;
	private String music_composer;
	private String music_lyricist;
	private Date music_regdate;
	private String music_tag;
	private char music_enable;
	private int music_album;
	private String userinfo_nickname;
	
	public MusiclistDto(int music_seq, int music_artist, int music_no, String music_title, int music_size,
			int music_length, int music_hl_time, String music_content, String music_composer, String music_lyricist,
			Date music_regdate, String music_tag, char music_enable, int music_album, String userinfo_nickname) {
		this.music_seq = music_seq;
		this.music_artist = music_artist;
		this.music_no = music_no;
		this.music_title = music_title;
		this.music_size = music_size;
		this.music_length = music_length;
		this.music_hl_time = music_hl_time;
		this.music_content = music_content;
		this.music_composer = music_composer;
		this.music_lyricist = music_lyricist;
		this.music_regdate = music_regdate;
		this.music_tag = music_tag;
		this.music_enable = music_enable;
		this.music_album = music_album;
		this.userinfo_nickname = userinfo_nickname;
	}

	public String getuserinfo_nickname() {
		return userinfo_nickname;
	}

	public void setuserinfo_nickname(String userinfo_nickname) {
		this.userinfo_nickname = userinfo_nickname;
	}
	public MusiclistDto() { }
	
	public int getMusic_seq() {
		return music_seq;
	}
	public void setMusic_seq(int music_seq) {
		this.music_seq = music_seq;
	}
	public int getMusic_artist() {
		return music_artist;
	}
	public void setMusic_artist(int music_artist) {
		this.music_artist = music_artist;
	}
	public int getMusic_no() {
		return music_no;
	}
	public void setMusic_no(int music_no) {
		this.music_no = music_no;
	}
	public String getMusic_title() {
		return music_title;
	}
	public void setMusic_title(String music_title) {
		this.music_title = music_title;
	}
	public int getMusic_size() {
		return music_size;
	}
	public void setMusic_size(int music_size) {
		this.music_size = music_size;
	}
	public int getMusic_length() {
		return music_length;
	}
	public void setMusic_length(int music_length) {
		this.music_length = music_length;
	}
	public int getMusic_hl_time() {
		return music_hl_time;
	}
	public void setMusic_hl_time(int music_hl_time) {
		this.music_hl_time = music_hl_time;
	}
	public String getMusic_content() {
		return music_content;
	}
	public void setMusic_content(String music_content) {
		this.music_content = music_content;
	}
	public String getMusic_composer() {
		return music_composer;
	}
	public void setMusic_composer(String music_composer) {
		this.music_composer = music_composer;
	}
	public String getMusic_lyricist() {
		return music_lyricist;
	}
	public void setMusic_lyricist(String music_lyricist) {
		this.music_lyricist = music_lyricist;
	}
	public Date getMusic_regdate() {
		return music_regdate;
	}
	public void setMusic_regdate(Date music_regdate) {
		this.music_regdate = music_regdate;
	}
	public String getMusic_tag() {
		return music_tag;
	}
	public void setMusic_tag(String music_tag) {
		this.music_tag = music_tag;
	}
	public char getMusic_enable() {
		return music_enable;
	}
	public void setMusic_enable(char music_enable) {
		this.music_enable = music_enable;
	}
	public int getMusic_album() {
		return music_album;
	}
	public void setMusic_album(int music_album) {
		this.music_album = music_album;
	}
	
}
