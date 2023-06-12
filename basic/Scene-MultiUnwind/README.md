# Unwind Segue를 이용하여 한꺼번에 여러 페이지 복귀하기


<img width="30%" src="https://user-images.githubusercontent.com/39071796/127450898-7cf0136e-4f4f-4558-ab90-62444a957b5b.gif">

* 연결된 세그웨이를 따라 화면은 차례로 page1 -> page2 -> page3 -> page4로 이동   
* 이와 함께 뷰 컨트롤러의 인스턴스는 차례로 내비게이션 스택이 쌓임   
```
  @IBAction func gotoPage1(_ sender: UIStoryboardSegue){}
```
* 맨 마지막 page4에서 Home 버튼을 클리하여 Unwind Segue를 실행하면 Page1이 화면에 나타나면서 스택의 중간에 쌓여있던 Page 2, 3의 인스턴스는 메모리에서 모두 해제됨   
* 이것을 프로그래밍 용어로 dealloc 이라 한다.

## 주의
  이정표 역할을 하는 메소드를 비교적 구체적인 이름으로 작성
