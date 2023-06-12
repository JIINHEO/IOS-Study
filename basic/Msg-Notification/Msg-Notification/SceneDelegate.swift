//
//  SceneDelegate.swift
//  Msg-Notification
//
//  Created by 허지인 on 2021/08/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        // 앱이 활성화 상태를 잃었을 때 실행되는 메소드
        // 사용 도중 전화가 오거나, SMS가 도착하는 경우 등
        
        if #available(iOS 10.0, *) { // UserNotification 프레임워크를 이용한 로컬 알림 (iOS 10 이상) 9까지는 UILocalNotification
            // 알림 동의 여부를 확인
            UNUserNotificationCenter.current().getNotificationSettings{ settings in  //getNotificationSettings() 사용자의 동의 여부
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    // 알림 콘텐츠 객체
                    let nContent = UNMutableNotificationContent() // 발송할 내용을 정의하는 객체를 생성
                    nContent.badge = 1 // 앱 아이콘에 표시될 값, 사용자가 확인하지 않은 알림이 있음을 암시
                    nContent.title = "로컬 알림 메시지" // 알림창에 표시될 메시지의 제목
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요!!" // 알림창에 표시될 메시지의 소제목(종종 생략)
                    nContent.body = "앗! 왜 나갔어요?? 어서 들어오세요!!" // 알림창에 표시될 메시지의 내용
                    nContent.sound = UNNotificationSound.default // 알림 도착 사운드(카톡)
                    nContent.userInfo = ["name": "홍길동"] // 로컬 알림과 함께 전달하고 싶은 값이 있을 때 사용하는 속성
                    // 화면에 표시 x, 알림을 눌러서 연결되는 앱 델리게이트 메소드에서 참조할 수 있다. 메시지 클릭 시 뭔가 처리해주기 위해 추가 데이터가 필요하다면 정의하여 전달
                    
                    // 알림 발송 조건 객체(3초후에 자동 발송, 반복x)
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                    
                    // 알림 요청 객체(식별 아이디, 발송할 내용, 발송 시각 조건)
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    // 노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않음!!")
                }
            }
        } else { // UILocalNotification 객체를 이용한 로컬 알림 (iOS 9 이하)
            // 알림 설정 확인
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

