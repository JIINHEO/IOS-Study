//
//  SceneDelegate.m
//  objective-c-swift
//
//  Created by jiinheo on 2022/06/19.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    // UIWindowScene을 초기화하는 데 사용되는 내부 객체에 액세스할 수 있다 - UIWindow
    // 이니셜라이저를 통해 UIWindow객체를 전달하여 UIWiondwScene객체를 초기화함
    _window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    
    // 원하는 UIViewContoller 객체의 인스턴스를 프로그래밍방식으로 생성
    ViewController *viewController = [[ViewController alloc] init];
    
    // ViewController를 클래스의 객체 rootViewContoller와 관련된 속성에 할당
    
    _window.rootViewController = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    // makeKeyAndVisible이 창을 키 창으로 표시하고 만들 수 있도록 창개체를 호출
    [_window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
