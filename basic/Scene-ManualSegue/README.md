# 세그웨이를 이용한 화면 전환

<img width="30%" src="https://user-images.githubusercontent.com/39071796/127443296-8ec56bc1-8d9d-48df-b457-b6b481b1b0df.gif"/>


## 세그웨이

<img width="20%" alt="image" src="https://user-images.githubusercontent.com/39071796/127442969-f78215c0-c4a9-4349-affc-eb0230d767f6.png">

  스토리보드에서 뷰 컨트롤러 사이의 연결 관계 및 화면 전환을 관리하는 역할   
  화면과 화면을 연결하기 위해 아무런 소스 코드도 필요로 하지 않음   
  뷰 컨트롤러와 뷰 컨트롤러 또는 버튼과 뷰 컨트롤러 사이를 직접 연결하는 식으로 화면 전환 관계를 구성   

   
* **액션 세그웨이(Action Segue) or 트리거 세그웨이(Trigger Segue)**   
   버튼 등이 출발점이 경우
   트리거(Trigger)와 세그웨이가 직접 연결된 것을 의미  
   별도의 처리 코드가 필요 없음

* **매뉴얼 세그웨이(Manual Segue)**   
   출발점이 뷰 컨트롤러 자체인 경우   
   뷰 컨트롤러와 뷰 컨트롤러 사이에 연결되는 수도 실행 세그웨이   
   트리거 없이 수동으로 실행해야 하므로 소스 코드에서 세그웨이를 실행할 메소드를 호출 해야 함

```
perfomeSegue(withIdentifier : <세그웨이 식별자>, sender : <세그웨이 실행 객체>)
```

세그웨이가 여러개일 경우 대비한 **세그웨이 식별자**와 **세그웨이를 실행하는 객체정보**   
필요한 시점에서 세그웨이 식별자를 통해 특정 세그웨이를 지정하고 위 메소드르 호출하면, 세그웨이가 실행되면서 화면이 전환되는 구조 

<img width="488" alt="image" src="https://user-images.githubusercontent.com/39071796/127444281-bcf1821f-7b82-4c46-8a0f-258e97c34aa4.png">
 
첫 번째 도크 바에서 첫 번째 아이콘을 클릭하여 두 번째 뷰 컨트롤러로 드래그   
storyboardSegue -> identifier -> 세그웨이 식별자 부여   
세그웨이를 실행할 액션 메소드 만들기 (세그웨이 식별용 아이디 인자값으로 넣어주기)   
 
## Unwind - 화면 복귀
**Unwind Segue**를 이용
Exit를 이용하여 현재 화면을 종료하고 이전 화면으로 되돌아가는 Unwind Swgue를 구현할 수 있다. 

1. 첫번째 뷰 컨트롤러에 UIStoryboardSegue 타입의 인자값을 받는 @IBAction 액션 메소드를 정의
2. 두번째 뷰 컨트롤러에서 버튼을 만들고 Exit아이콘으로 드래그(트리거 생성)
3. 1에서 생성한 메소드를 인식하고 이를 찾아 Unwind Segue로 자동 생성




<img width="900" alt="image" src="https://user-images.githubusercontent.com/39071796/127445406-8c8a6345-476e-4ba4-87f8-3d0c671d8ed4.png">

## 주의
Exit 아이콘에 버튼을 연결하는건 뷰컨트롤러2 이지만,   
UnwindSegue 메소드를 만들어야 하는 곳은 뷰컨트롤러 1이다.





