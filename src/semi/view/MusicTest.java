package semi.view;

import java.util.List;

import semi.biz.AlbumBiz;
import semi.biz.MusicBiz;
import semi.dto.AlbumDto;
import semi.dto.MusicDto;

public class MusicTest {

	public static void main(String[] args) {
		
/*			MusicBiz biz = new MusicBiz();
		MusicDto dto = new MusicDto();
	
		List<MusicDto> list = biz.selectList_music();
		System.out.println(list);
		//for(MusicDto dto : list) {
		//	System.out.println(dto);
		//}
				
		dto = biz.selectOne_music(1);
		System.out.println(dto);
		
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
		
		int res1 = biz.delete_music(12);
		if(res1 > 0) {
			System.out.println("delete_music 성공");
		} else {
			System.out.println("delete_music 실패");
		}

		List<MusicDto> list2 = biz.selectList_music();
		System.out.println(list2);

		dto.setMusic_seq(1);
		dto.setMusic_artist(1);
		dto.setMusic_no(1);
		dto.setMusic_title("3_FUNCKEY MUSIC");
		dto.setMusic_hl_time(30);
		dto.setMusic_size(10);
		dto.setMusic_length(310);
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

		dto = biz.selectOne_music(1);
		System.out.println(dto);
*/			

		AlbumBiz biza = new AlbumBiz();
		AlbumDto dto = new AlbumDto(); 
/*		 	
		List<AlbumDto> list = biza.selectList_album();
		System.out.println(list);
		//for(MusicDto dto : list) {
		//	System.out.println(dto);
		//}
				
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
		
		int res = biza.insert_album(dto);
		if(res > 0) {
			System.out.println("insert_music 성공");
		} else {
			System.out.println("insert_music 실패");
		}
		
		List<AlbumDto> list1 = biza.selectList_album();
		System.out.println(list1);
		
		dto.setAlbum_seq(3);
		dto.setAlbum_artist(1);
		dto.setAlbum_title("3_FUNCKEY MUSIC");
		dto.setAlbum_tracks(30);
		dto.setAlbum_length(250);
		dto.setAlbum_content("FUNCKEY MUSIC");
		dto.setAlbum_tag("가요");
		dto.setAlbum_enable('Y');
		
		int res21 = biza.update_album(dto);
		if(res21 > 0) {
			System.out.println("update_music 성공");
		} else {
			System.out.println("update_music 실패");
		}
*/
		dto = biza.selectOne_album(3);
		System.out.println(dto);

		int res1 = biza.delete_album(3);
		if(res1 > 0) {
			System.out.println("delete_music 성공");
		} else {
			System.out.println("delete_music 실패");
		}

		List<AlbumDto> list2 = biza.selectList_album();
		System.out.println(list2);

	}

}
