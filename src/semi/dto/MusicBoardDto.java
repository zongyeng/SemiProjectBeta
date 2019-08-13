package semi.dto;

import java.util.Date;

public class MusicBoardDto {

	private int musicbd_boardno;
	private int musicbd_groupno;
	private int musicbd_groupsq;
	private int musicbd_titletab;
	private String musicbd_delflag;
	private String musicbd_title;
	private String musicbd_content;
	private String musicbd_writer;
	private Date musicbd_regdate;
	
	public MusicBoardDto() { }
	public MusicBoardDto(int boardno, int groupno, int groupsq, int titletab,String delflag,
			String title, String content, String writer, Date regdate) {
		this.musicbd_boardno = boardno;
		this.musicbd_groupno = groupno;
		this.musicbd_groupsq = groupsq;
		this.musicbd_titletab = titletab;
		this.musicbd_delflag = delflag;
		this.musicbd_title = title;
		this.musicbd_content = content;
		this.musicbd_writer = writer;
		this.musicbd_regdate = regdate;
	}
	public int getMusicbd_boardno() {
		return musicbd_boardno;
	}
	public void setMusicbd_boardno(int musicbd_boardno) {
		this.musicbd_boardno = musicbd_boardno;
	}
	public int getMusicbd_groupno() {
		return musicbd_groupno;
	}
	public void setMusicbd_groupno(int musicbd_groupno) {
		this.musicbd_groupno = musicbd_groupno;
	}
	public int getMusicbd_groupsq() {
		return musicbd_groupsq;
	}
	public void setMusicbd_groupsq(int musicbd_groupsq) {
		this.musicbd_groupsq = musicbd_groupsq;
	}
	public int getMusicbd_titletab() {
		return musicbd_titletab;
	}
	public void setMusicbd_titletab(int musicbd_titletab) {
		this.musicbd_titletab = musicbd_titletab;
	}
	public String getMusicbd_delflag() {
		return musicbd_delflag;
	}
	public void setMusicbd_delflag(String musicbd_delflag) {
		this.musicbd_delflag = musicbd_delflag;
	}
	public String getMusicbd_title() {
		return musicbd_title;
	}
	public void setMusicbd_title(String musicbd_title) {
		this.musicbd_title = musicbd_title;
	}
	public String getMusicbd_content() {
		return musicbd_content;
	}
	public void setMusicbd_content(String musicbd_content) {
		this.musicbd_content = musicbd_content;
	}
	public String getMusicbd_writer() {
		return musicbd_writer;
	}
	public void setMusicbd_writer(String musicbd_writer) {
		this.musicbd_writer = musicbd_writer;
	}
	public Date getMusicbd_regdate() {
		return musicbd_regdate;
	}
	public void setMusicbd_regdate(Date musicbd_regdate) {
		this.musicbd_regdate = musicbd_regdate;
	}
	@Override
	public String toString() {
		return "MusicBoardDto [musicbd_boardno=" + musicbd_boardno + ", musicbd_groupno=" + musicbd_groupno
				+ ", musicbd_groupsq=" + musicbd_groupsq + ", musicbd_titletab=" + musicbd_titletab
				+ ", musicbd_delflag=" + musicbd_delflag + ", musicbd_title=" + musicbd_title + ", musicbd_content="
				+ musicbd_content + ", musicbd_writer=" + musicbd_writer + ", musicbd_regdate=" + musicbd_regdate + "]";
	}

	
	
	
}
