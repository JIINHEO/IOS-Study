//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by 허지인 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func moveByNavi(_ sender: Any) {
        // 스토리보드에서 설정했던 아이디를 이용하여 뷰 컨트롤러를 읽어오고, 객체로 생성
        // 두 번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        // 호출하는 대상이 현재의 뷰 컨트롤러에 연결된 내비게이션 컨트롤러이다.
        // 화면을 전환한다.
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        // 두 번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        // 화면을 전환한다.
        self.present(uvc2, animated: true)
    }
}

