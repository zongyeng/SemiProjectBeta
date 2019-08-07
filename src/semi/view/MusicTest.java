package semi.view;

import java.util.List;

import semi.biz.MusicBiz;
import semi.dto.MusicDto;

public class MusicTest {

	public static void main(String[] args) {
		
		MusicBiz biz = new MusicBiz();
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
		dto.setMusic_hl_time(30);
		dto.setMusic_composer("이순신");
		int res2 = biz.update_music(dto);
		if(res2 > 0) {
			System.out.println("update_music 성공");
		} else {
			System.out.println("update_music 실패");
		}

		dto = biz.selectOne_music(1);
		System.out.println(dto);
		
	}

}
