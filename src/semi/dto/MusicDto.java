package semi.dto;

import java.util.Date;

public class MusicDto {
	
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
	
	public MusicDto() { }
	public MusicDto(int seq, int artist, int no, String title, int size, int length,
			int hl_time, String content, String composer, String lyricist, 
			Date regdate, String tag, char enable, int album) {
		this.music_seq = seq;
		this.music_artist = artist;
		this.music_no = no;
		this.music_title = title;
		this.music_size = size;
		this.music_length = length;
		this.music_hl_time = hl_time;
		this.music_composer = composer;
		this.music_lyricist = lyricist;
		this.music_regdate = regdate;
		this.music_tag = tag;
		this.music_enable = enable;
		this.music_album = album;
	}
	public MusicDto(int artist, int no, String title, int size, int length,
			int hl_time, String content, String composer, String lylicist, 
			String tag, char enable, int album) {
		this.music_artist = artist;
		this.music_no = no;
		this.music_title = title;
		this.music_size = size;
		this.music_length = length;
		this.music_hl_time = hl_time;
		this.music_content = content;
		this.music_composer = composer;
		this.music_lylicist = lylicist;
		this.music_tag = tag;
		this.music_enable = enable;
		this.music_album = album;
	}
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
	@Override
	public String toString() {
		return "MusicDto [music_seq=" + music_seq + ", music_artist=" + music_artist + ", music_no=" + music_no
				+ ", music_title=" + music_title + ", music_size=" + music_size + ", music_length=" + music_length
				+ ", music_hl_time=" + music_hl_time + ", music_content=" + music_content + ", music_composer="
				+ music_composer + ", music_lyricist=" + music_lyricist + ", music_regdate=" + music_regdate
				+ ", music_tag=" + music_tag + ", music_enable=" + music_enable + ", music_album=" + music_album + "]";
	}
	
}
