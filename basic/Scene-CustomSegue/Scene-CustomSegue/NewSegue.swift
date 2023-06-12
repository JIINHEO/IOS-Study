//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by 허지인 on 2021/07/29.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    
    override func perform() {
        
        // 세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.source
        
        //세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        
        //fromView에서 toView로 뷰를 전환한다.
        UIView.transition(from: srcUVC.view,
                          to: destUVC.view,
                          duration: 2,
                          options: .transitionCurlDown)
        //transition()은 타입 메소드이기 때문에 UIView 클래스의 인스턴스를 생성하지 않고도 호출 가능
        
        
    }

}
