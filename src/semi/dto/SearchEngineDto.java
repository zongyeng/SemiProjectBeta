package semi.dto;

public class SearchEngineDto {
	private int userinfo_seq;
	private String userinfo_nickname;
	private int album_seq;
	private String album_title;
	private int music_seq;
	private String music_title;
	
	public SearchEngineDto() {}
	
	public SearchEngineDto(int userinfo_seq, String userinfo_nickname, int album_seq, String album_title, int music_seq,
			String music_title) {
		super();
		this.userinfo_seq = userinfo_seq;
		this.userinfo_nickname = userinfo_nickname;
		this.album_seq = album_seq;
		this.album_title = album_title;
		this.music_seq = music_seq;
		this.music_title = music_title;
	}

	public int getUserinfo_seq() {
		return userinfo_seq;
	}

	public void setUserinfo_seq(int userinfo_seq) {
		this.userinfo_seq = userinfo_seq;
	}

	public String getUserinfo_nickname() {
		return userinfo_nickname;
	}

	public void setUserinfo_nickname(String userinfo_nickname) {
		this.userinfo_nickname = userinfo_nickname;
	}

	public int getAlbum_seq() {
		return album_seq;
	}

	public void setAlbum_seq(int album_seq) {
		this.album_seq = album_seq;
	}

	public String getAlbum_title() {
		return album_title;
	}

	public void setAlbum_title(String album_title) {
		this.album_title = album_title;
	}

	public int getMusic_seq() {
		return music_seq;
	}

	public void setMusic_seq(int music_seq) {
		this.music_seq = music_seq;
	}

	public String getMusic_title() {
		return music_title;
	}

	public void setMusic_title(String music_title) {
		this.music_title = music_title;
	}

	@Override
	public String toString() {
		return "SearchEngineDto [userinfo_seq=" + userinfo_seq + ", userinfo_nickname=" + userinfo_nickname
				+ ", album_seq=" + album_seq + ", album_title=" + album_title + ", music_seq=" + music_seq
				+ ", music_title=" + music_title + "]";
	}
	
}
