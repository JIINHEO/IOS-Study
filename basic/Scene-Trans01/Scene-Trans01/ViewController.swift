//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 허지인 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        
        // 이동할 뷰 컨트롤러 객체를 storyboardID 정보를 이용하여 참조.
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else { return }
            
            // instantiateViewController : 인자값으로 입력받은 아이디를 이용하여
            // 스토리보드에서 뷰 컨트롤러를 찾고, 연결된 클래스를 읽어와 뷰 컨트롤러에 대한 인스턴스를 생성
            // 이 인스턴스를 인자값으로 하여 화면을 전환하는 메소드를 호출하는것
            
            
            // 화면 전환할 때의 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            
            // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
            self.present(uvc, animated: true)

    }
    
}

