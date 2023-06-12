//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by 허지인 on 2021/08/03.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 앱이 처음 실행될 때 호출되는 메소드
        // 애플리케이션에서 사용할 클래스와 리소스들이 모두 메모리에 로드되고 아직 애플리케이션의 첫 화면을 모바일 디바이스에 띄우기 직전
        if #available(iOS 10.0, *){
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의 여부 창을 실행
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]){(didAllow, e) in }
            notiCenter.delegate = self // 알림 센터와 관련하여 뭔가 사건이 발생하면 나(앱 델리게이트)한테 알려줘!
        }else {
                // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 이를 애플리케이션에 저장
                let setting = UIUserNotificationSettings(types:  [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(setting)
            }
        return true
    }
    // 앱 실행 도중에 알림 메시지가 도착한 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup"{
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        // 알림 배너 띄워주기
        completionHandler([.banner, .badge, .sound])
    }
    
    // 사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup"{
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler()
    }
    
    /*
    문제 상황:
    UserNotification 프레임워크를 이용해서 로컬 푸시알림을 구현 중,
    백그라운드에 들어갈 때 호출되는 메소드 applicationWillResignActive(_:)이 호출되지 않아, 푸시알림이 오지 않는 것 처럼 보이는 일이 발생


     iOS 13 이후 변경된 생명주기 이벤트 전달 방식 때문
    백그라운드에 들어갔을 때 호출되는 메소드는
    AppDelegate.swift의 applicationWillResignActive(_:)가 아닌,
    SceneDelegate.swift의 sceneWillResignActive(_:)
    */


    func applicationWillResignActive(_ application: UIApplication) {
        // 앱이 활성화 상태를 잃었을 때 실행되는 메소드
        // 사용 도중 전화가 오거나, SMS가 도착하는 경우 등
        print("실행되라")
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
            
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

