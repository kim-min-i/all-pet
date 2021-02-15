<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 카카오톡 아이디 연동해서 로그인 -->
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>  <!-- //스크립트 타입을 kakao타입으로 함 -->
<a id="kakao-login-btn"></a> <!-- //버튼의 id를 정함 -->

<a href="javascript:kakaoLogin();"><img src="/pet/save/kakao_login_medium_wide.png"></a>
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
 // d24d618b0b4275936a4347b79f44a5c1 
 window.Kakao.init("d24d618b0b4275936a4347b79f44a5c1"); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
 
 function kakaoLogin(){
	 window.Kakao.Auth.login({
		 scope:'profile, account_email, gender',
		 success: function(authObj){
			 console.log(authObj);
			 window.Kakao.API.request({
				 url:'/v2/user/me',
				 success: function(res) {
					 const kakao_account = res.kakao_account;
					 console.log(kakao_account);
				 }
			 });
		 }
	 });
 }


//'동의하고 계속하기' - 인가 코드 - 로그인 요청이 리다이렉트 - 토큰 요청 - 로그인 완료
Kakao.Auth.authorize({
	redirectUri:'{/pet/member/main.do}' 
});

//토큰 가져오기 (나중에 사용자 정보 가져올 수 있음)
Kakao.Auth.setAccessToken(ACCESS_TOKEN); 
if(!Kakao.Auth.getAccessTocken()){
	console.log('Not logged in.');
	return;
}

//로그아웃
Kakao.Auth.logout(function(){
	console.log(Kakao.Auth.getAccessToken());
}); 

//연결 끊기
Kakao.API.request({
url: '/v1/user/unlink',
success: function(response) {
  console.log(response);
},
fail: function(error) {
  console.log(error);
},
});

//사용자 정보 가져오기
Kakao.API.request({
  url: '/v2/user/me',
  success: function(response) {
      console.log(response);
  },
  fail: function(error) {
      console.log(error);
  }
});

//사용자 정보 저장하기
Kakao.API.request({
  url: '/v1/user/update_profile',
  data: {
      properties: {
          nickname: '홍길동',
          age: '22',
      },
  },
  success: function(response) {
      console.log(response);
  },
  fail: function(error) {
      console.log(error);
  }
});

//추가 항목 동의받기 email, 
Kakao.Auth.authorize({
  redirectUri: '{REDIRECT_URI}',
  scope: 'profile,phone_number'
});

//고급 가이드
Kakao.Auth.createLoginButton({
	  container: '#CONTAINER_ID',
	  success: function(response) {
	    console.log(response);
	  },
	  fail: function(error) {
	    console.log(error);
	  },
	});
	
	
</script>