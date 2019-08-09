package semi.view;

import java.util.List;

import semi.biz.AlbumBiz;
import semi.biz.MusicBiz;
import semi.biz.MusicBoardBiz;
import semi.dto.AlbumDto;
import semi.dto.MusicBoardDto;
import semi.dto.MusicDto;

public class MusicTest {

	public static void main(String[] args) {

/*** Music BD Text *****
		MusicBiz biz = new MusicBiz();
		MusicDto dto = new MusicDto();
	
/***** Select List Music ****
		List<MusicDto> list = biz.selectList_music();
		System.out.println(list);
		//for(MusicDto dto : list) {
		//	System.out.println(dto);
		//}
				
		dto = biz.selectOne_music(1);
		System.out.println(dto);

/***** Insert Music ****
		dto.setMusic_artist(3);
		dto.setMusic_no(1);
		dto.setMusic_title("다비치 - 이 사랑");
		dto.setMusic_size(10);
		dto.setMusic_length(310);
		dto.setMusic_hl_time(0);
		dto.setMusic_content("좋은노래");
		dto.setMusic_composer("홍길동");
		dto.setMusic_lyricist("다비치");
		dto.setMusic_tag("가요");
		dto.setMusic_enable('Y');
		dto.setMusic_album(1);
		//dto = new MusicDto(null, 3, 1, "좋은노래", 0, 0, 10, "좋은노래", "홍길동", "홍길동", null, "가요","Y",0);
		int res = biz.insert_music(dto);
		if(res > 0) {
			System.out.println("insert_music 성공");
		} else {
			System.out.println("insert_music 실패");
		}
		
		List<MusicDto> list1 = biz.selectList_music();
		System.out.println(list1);

/***** Update Music ****
		dto.setMusic_seq(23);
		dto.setMusic_artist(1);
		dto.setMusic_no(1);
		dto.setMusic_title("3_FUNCKEY MUSIC");
		dto.setMusic_hl_time(30);
		dto.setMusic_size(10);
		dto.setMusic_length(330);
		dto.setMusic_composer("조영찬");
		dto.setMusic_lyricist("조영찬");
		dto.setMusic_content("FUNCKEY MUSIC");
		dto.setMusic_tag("FUNCKEY MUSIC");
		dto.setMusic_enable('Y');
		dto.setMusic_album(1);
		
		int res2 = biz.update_music(dto);
		if(res2 > 0) {
			System.out.println("update_music 성공");
		} else {
			System.out.println("update_music 실패");
		}

		List<MusicDto> list2 = biz.selectList_music();
		System.out.println(list2);

/***** Delete Music ****
		int res1 = biz.delete_music(23);
		if(res1 > 0) {
			System.out.println("delete_music 성공");
		} else {
			System.out.println("delete_music 실패");
		}

		List<MusicDto> list2 = biz.selectList_music();
		System.out.println(list2);
*/
			
/*** Album DB Test
		AlbumBiz biza = new AlbumBiz();
		AlbumDto dto = new AlbumDto(); 
		 	
/***** Select List Album ****
		List<AlbumDto> list = biza.selectList_album();
		System.out.println(list);
		//for(MusicDto dto : list) {
		//	System.out.println(dto);
		//}

/***** Select One Album ****
		dto = biza.selectOne_album(1);
		System.out.println(dto);
		
		dto.setAlbum_artist(3);
		dto.setAlbum_no(1);
		dto.setAlbum_title("다비치 - 이 사랑");
		dto.setAlbum_tracks(10);
		dto.setAlbum_length(310);
		dto.setAlbum_content("좋은노래");
		dto.setAlbum_tag("가요");
		dto.setAlbum_enable('Y');

/***** Insert Album ****
		int res = biza.insert_album(dto);
		if(res > 0) {
			System.out.println("insert_music 성공");
		} else {
			System.out.println("insert_music 실패");
		}
		
		List<AlbumDto> list1 = biza.selectList_album();
		System.out.println(list1);

/***** Update Album ****
		dto.setAlbum_seq(24);
		dto.setAlbum_artist(1);
		dto.setAlbum_no(3);
		dto.setAlbum_title("3_FUNCKEY MUSIC");
		dto.setAlbum_tracks(30);
		dto.setAlbum_length(250);
		dto.setAlbum_content("FUNCKEY MUSIC");
		dto.setAlbum_tag("FUNCK");
		dto.setAlbum_enable('Y');
		
		int res21 = biza.update_album(dto);
		if(res21 > 0) {
			System.out.println("update_music 성공");
		} else {
			System.out.println("update_music 실패");
		}

		List<AlbumDto> list2 = biza.selectList_album();
		System.out.println(list2);

/***** Delete Album ****
		int res1 = biza.delete_album(24);
		if(res1 > 0) {
			System.out.println("delete_music 성공");
		} else {
			System.out.println("delete_music 실패");
		}

		List<AlbumDto> list2 = biza.selectList_album();
		System.out.println(list2);
*/
/*** Board DB Test *****/	
		MusicBoardBiz bizb = new MusicBoardBiz();
		MusicBoardDto dtob = new MusicBoardDto(); 

/***** Select List MusicBoard ****
		
		List<MusicBoardDto> list1 = bizb.selectList_musicbd();
		System.out.println("list"+list1);
		//for(MusicDto dto : list) {
		//	System.out.println(dto);
		//}
				
		dtob = bizb.selectOne_musicbd(3);
		System.out.println(dtob);

/***** Insert MusicBoard ****		
		dtob.setMusicbd_groupsq(1);
		dtob.setMusicbd_titletab(0);
		dtob.setMusicbd_title("본문글3");
		dtob.setMusicbd_content("좋은노래");
		dtob.setMusicbd_writer("지광현");
		//dtob.setMusicbd_delflag('N');
		
		int res = bizb.insert_musicbd(dtob);
		if(res > 0) {
			System.out.println("insert_musicbd 성공");
		} else {
			System.out.println("insert_musicbd 실패");
		}
		
		List<MusicBoardDto> list1 = bizb.selectList_musicbd();
		System.out.println(list1);
*/
/***** Insert MusicBoard 댓글 Answer *****/
		dtob.setMusicbd_boardno(5);
		//dtob.setMusicbd_titletab(0);
		dtob.setMusicbd_title("1번 댓글1");
		dtob.setMusicbd_content("좋은노래 맞아요3");
		dtob.setMusicbd_writer("임성현");
		
		int res = bizb.answerProc(dtob);
		if(res > 0) {
			System.out.println("insert_musicbd 성공");
		} else {
			System.out.println("insert_musicbd 실패");
		}
		
		List<MusicBoardDto> list1 = bizb.selectList_musicbd();
		System.out.println(list1);
	
		
/***** Update MusicBoard ****
		dtob.setMusicbd_boardno(1);
		//dtob.setMusicbd_titletab(0);
		dtob.setMusicbd_title("본문글1");
		dtob.setMusicbd_content("좋은노래");
		//dtob.setMusicbd_writer("조영찬");
		//dtob.setMusicbd_delflag('N');
		
		int res21 = bizb.update_musicbd(dtob);
		if(res21 > 0) {
			System.out.println("update_music 성공");
		} else {
			System.out.println("update_music 실패");
		}

		//List<MusicBoardDto> list2 = bizb.selectList_musicbd();
		//System.out.println(list2);
		dtob = bizb.selectOne_musicbd(1);
		System.out.println(dtob);
		
/***** Delete MusicBoard ****
		int res1 = bizb.delete_musicbd(6);
		if(res1 > 0) {
			System.out.println("delete_musicbd 성공");
		} else {
			System.out.println("delete_musicbd 실패");
		}

		List<MusicBoardDto> list3 = bizb.selectList_musicbd();
		System.out.println(list3);		
		
/***** Delete MusicBoard 본글 ****
		int res1 = bizb.delete_musicbd(3);
		if(res1 > 0) {
			System.out.println("delete_musicbd 성공");
		} else {
			System.out.println("delete_musicbd 실패");
		}

		List<MusicBoardDto> list3 = bizb.selectList_musicbd();
		System.out.println(list3);
		

*/
	}

}
