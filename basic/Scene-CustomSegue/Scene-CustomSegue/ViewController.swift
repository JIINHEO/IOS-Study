//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by 허지인 on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if (segue.identifier=="custom_segue"){
            NSLog("커스텀 세그가 실행됩니다")
            // 파운데이션 프레임워크에서 정의된 클래스로, 입력된 문자열을 Xcode의 디버그 콘솔에 출력하는 기능
            
        } else if (segue.identifier=="action_segue"){
            NSLog("액션 세그가 실행됩니다")
            
        } else {
            NSLog("알수 없는 세그입니다.")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

