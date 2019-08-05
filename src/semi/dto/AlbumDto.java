package semi.dto;

import java.util.Date;

public class AlbumDto {

	private int album_seq;
	private int album_artist;
	private int album_no;
	private String album_title;
	private int album_tracks;
	private int album_length;
	private String album_content;
	private String album_tag;
	private Date album_regdate;
	private char album_enable;
	
	public AlbumDto() { }
	public AlbumDto(int seq, int artist, int no, String title, int tracks, int length,
			String content, String tag, Date regdate, char enable) {
		this.album_seq = seq;
		this.album_artist = artist;
		this.album_no = no;
		this.album_title = title;
		this.album_tracks = tracks;
		this.album_length = length;
		this.album_content = content;
		this.album_tag = tag;
		this.album_regdate = regdate;
		this.album_enable = enable;
	}
	public int getAlbum_seq() {
		return album_seq;
	}
	public void setAlbum_seq(int album_seq) {
		this.album_seq = album_seq;
	}
	public int getAlbum_artist() {
		return album_artist;
	}
	public void setAlbum_artist(int album_artist) {
		this.album_artist = album_artist;
	}
	public int getAlbum_no() {
		return album_no;
	}
	public void setAlbum_no(int album_no) {
		this.album_no = album_no;
	}
	public String getAlbum_title() {
		return album_title;
	}
	public void setAlbum_title(String album_title) {
		this.album_title = album_title;
	}
	public int getAlbum_tracks() {
		return album_tracks;
	}
	public void setAlbum_tracks(int album_tracks) {
		this.album_tracks = album_tracks;
	}
	public int getAlbum_length() {
		return album_length;
	}
	public void setAlbum_length(int album_length) {
		this.album_length = album_length;
	}
	public String getAlbum_content() {
		return album_content;
	}
	public void setAlbum_content(String album_content) {
		this.album_content = album_content;
	}
	public String getAlbum_tag() {
		return album_tag;
	}
	public void setAlbum_tag(String album_tag) {
		this.album_tag = album_tag;
	}
	public Date getAlbum_regdate() {
		return album_regdate;
	}
	public void setAlbum_regdate(Date album_regdate) {
		this.album_regdate = album_regdate;
	}
	public char getAlbum_enable() {
		return album_enable;
	}
	public void setAlbum_enable(char album_enable) {
		this.album_enable = album_enable;
	}
	@Override
	public String toString() {
		return "AlbumDto [album_seq=" + album_seq + ", album_artist=" + album_artist + ", album_no=" + album_no
				+ ", album_title=" + album_title + ", album_tracks=" + album_tracks + ", album_length=" + album_length
				+ ", album_content=" + album_content + ", album_tag=" + album_tag + ", album_regdate=" + album_regdate
				+ ", album_enable=" + album_enable + "]";
	}
	
	
	
}
