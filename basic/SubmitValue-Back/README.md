# 이전화면으로 값 전달하기


<img width="30%" src="https://user-images.githubusercontent.com/39071796/127859811-b0815272-096b-41b4-852c-508a52201da6.gif"/>



## 1. 직접 값을 주고 받기
* VC1 -> VC2  
VC2의 **viewDidLoad()** 메소드 내에 작성   
(화면이 처음 만들어질 때 호출)

* VC2 -> VC1   
VC1의 **viewWillAppear(_:)** 메소드 내에 작성   
(뷰 컨트롤러의 뷰가 화면에 표시될 때마다 실행)

<br>

## 2.  저장소를 사용하여 값을 주고 받기 - 비동기 방식
* ### AppDelegate 객체를 사용하여 값을 주고받기
> 이 객체에 값을 저장하면 앱이 종료되지 않는 한 값을 계속 유지할 수 있다.    
> 하지만 앱을 종료하면 사라져 버리므로 반영구적으로 값을 저장해두어야 하는 값에 사용하기에는 부적합

  AppDelegate는 앱 전체를 통틀어 하나의 인스턴스만 존재하도록 iOS 시스템에 의해 보장  - Singleton   
  AppDelegate 클래스의 인스턴스는 직접 생성할 수 없으며, 
  ```UIApplicateion.shared.delegate```구문을 통해 현재 생성되어 있는 인스턴스를 참조  

  경우에 따라서 대신하는 다른 클래스를 만들어 같은 역할로 사용할 수 있음

  1. UIRespose 클래스를 상속 받아야 함
  2. UIApplicationDelegate 프로토콜 구현을 선언해야 함
  3. @UIApplicationMain 어노테이션을 붙여주어야 함

* ### UserDefaults 객체를 사용하여 값을 주고받기
> 앱을 삭제하기 전까지는 저장된 값이 반영구적으로 유지된다.   
> 비교적 단순하면서도 값이 유지되어야 하는 로그인 여부나 간단한 설정 정보 등을 저장하는 경우

  ```UserDefaults.standard ``` 프로퍼티를 사용하여 읽어와야 한다.   
  프로퍼티를 통해 얻어온 UserDefaults 객체의 인스턴스를 상수에 저장하고, ```set(_:forKey:)``` 메소드를 사용하여 값을 저장   
  String 타입의 메소드만 반환값이 옵셔널 타입

<br>

##  문제 및 해결
* ### 문제
VC2 -> VC1 로 화면이 전환되었을때 viewWillAppear의 호출과 값의 변경이 이루어지지 않았다.

* ### 해결

iOS 13부터 ```Modal presentation Style```의 디폴트 값이 full screen이 아닌 ```automatic``` 으로 변경되면서 라이프 사이클도 변경되었다.  

* 기존 fullscreen style 라이프 사이클    
dismiss -> VC2 종료 -> VC1의 viewWillAppear, viewDidAppear을 호출

* 변경된 sheet style 모달 라이프 사이클   
VC1에 전혀 영향을 주지 않고 앞에 독립적으로 띄워짐 -> dismiss -> VC2 종료

<img width="260" alt="image" src="https://user-images.githubusercontent.com/39071796/127892742-cb0c2b34-7725-4f26-99db-ea146755f870.png">
Presentation 스타일은 Full screen 으로 변경

```애초에 <임시로> 모달을 띄운 형태인데 VC1메소드에서 뭔가를 해야하는것은 바람직하지 않은것 같다.```
