문제 1. 자료를 가져올 시 톰켓서버의 정보가 다르다.
문제 2. 자료를 가져올 시 JRE라이브러리가 없다.
문제 3. 자료를 가져올시 src폴더를 자바 자원이라고 인식하지 않는다.
문제 4. lib폴더에 있는 jar파일을 web app 라이브러리에 추가 하지 않는다.

해결. 프로젝트를 다시 만들었다.
다른 해결 방법. 직접 자바 리소울스 영역에 추가해준다.
톰캣서버 정보는 pc마다 항상 다르기 때문에 자신의 프로젝스 세팅 설정을 커밋, 푸시 안하면 해결되지 않을가 싶지만, 신경 쓸 겨를이 있을까 싶다.