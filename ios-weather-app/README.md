# ios-weather-app
도시를 입력하면 현재 날씨의 정보를 화면에 표시해주는 iOS Application


# 기능
- 입력된 도시의 현재 날씨 정보를 화면에 표시
- 도시 이름을 잘못 입력하면 서버로부터 응답받은 에러 메시지를 알럿으로 표시 
<img width="20%" src="https://user-images.githubusercontent.com/39071796/141059400-c5648b34-9d38-4230-9b7d-d2ec42feaffd.mp4" />

# 활용기술
- Current Weather API
- URLSession
> 특정한 url을 이용하여 데이터를 다운로드하고 업로드하기 위한 API (앱에서 서버와 통신하기 위해 제공하는 API)   
> request와 response를 기본구조로 가지고 있음   
> URLSessionConfiguration 을 통해 생성할 수 있고   
> 생성된 URLSessiong을 통해 한 개 이상의  URLSessionTask를 생성할 수 있음   
