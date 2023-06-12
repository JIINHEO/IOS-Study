//
//  ViewController.swift
//  view
//
//  Created by 허지인 on 2021/06/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 서브뷰 생성
        let frame = CGRect(x:60, y:100, width: 240, height: 120)
        let subView = UIView(frame: frame)
        subView.backgroundColor = UIColor.green
        
        print("서브뷰의 프레임 cgrect: \(subView.frame)")
        
        //서브뷰 추가하기
        view.addSubview(subView)
    }


}

