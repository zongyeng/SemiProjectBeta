package semi.dto;

public class stacked_barDto {
	
	private int music_seq;
	private String music_title;
	
	public stacked_barDto() {}
	
	public stacked_barDto(int music_seq, String music_title) {
		super();
		this.music_seq = music_seq;
		this.music_title = music_title;
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
		return "stacked_barDto [music_seq=" + music_seq + ", music_title=" + music_title + "]";
	}
	
}
