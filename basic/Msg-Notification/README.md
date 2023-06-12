# UserNotification 프레임워크를 이용한 로컬 알림
UserNotification 프레임워크는 UIKit 프레임워크나 파운데이션 프레임워크와 같은 수준의 독립된 프레임워크입니다.   
따라서 객체를 사용하려면 파일 상단에 다음과 같이 반입 구문을 추가해 주어야 합니다.   
```import UserNotifications```

<img width="202" alt="스크린샷 2021-08-03 오후 10 48 01" src="https://user-images.githubusercontent.com/39071796/128046005-1a62cc7f-45ad-4ba8-8bb4-483de646c354.png"/><img width="20%" src="https://user-images.githubusercontent.com/39071796/128046163-466ecfce-b402-4a80-b831-8d6d7c9e632b.gif"/><img width="20%" src="https://user-images.githubusercontent.com/39071796/128046350-4bdb9af3-4a30-4c2e-bb12-0e71a2c5ea47.gif"/>


* ```UNMutableNotificationContent)```   
알림에 필요한 메시지와 같은 기본적인 속성을 담는 알림 콘텐츠 역할을 합니다.  
* ```UNTimeIntervalNotificationTrigger```   
알림 발송 조건을 관리합니다. 설정할 수 있는 속성은 발생 시각과 반복 여부 입니다.   
* ```UNNotificationRequest```   
알림 콘텐츠 객체와 알림 발송 조건 객체를 인자값으로 하여 이 클래스를 초기화하면 그 결과로 알림 요청 객체가 생성 됩니다.   
* ```UNUserNotificationCenter```   
실제 발송을 담당하는 센터입니다.   
싱글턴 방식으로 동작하기 때문에 따로 인스턴스를 생성하지 않고 current()메소드를 통해 참조 정보만 가져올 수 있습니다.   

## DispatchQueue.main.async{}
백그라운드에서 실행되는 로직을 메인 쓰레드에서 실행되도록 처리해주는 역할   
UI 처리는 모두 메인 실행 영역에서 이루어 져야 한다.


## 문제 및 해결
* 문제   
    UserNotification 프레임워크를 이용해서 로컬 푸시알림을 구현 중에 백그라운드에 들어갈 때 호출되는 메소드인   
    ```applicationWillResignActive(_:)```이 호출되지 않아, 푸시알림이 오지 않는 것 처럼 보이는 일이 발생

* 해결   
    iOS 13 이후 변경된 생명주기 이벤트 전달 방식 때문   
    백그라운드에 들어갔을 때 호출되는 메소드는 AppDelegate.swift의 applicationWillResignActive(_:)가 아닌   
    ```SceneDelegate.swift의 sceneWillResignActive(_:)```
    
    
    
    
