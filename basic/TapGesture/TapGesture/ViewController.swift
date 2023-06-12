//
//  ViewController.swift
//  TapGesture
//
//  Created by 허지인 on 2021/06/15.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{

    
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let tapGesture: UITapGestureRecognizer =
        UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        
//        let tapGesture: UITapGestureRecognizer =
//            UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//        self.view.addGestureRecognizer(tapGesture)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // 3가지 방법이 있음!
    // 간단하게 -> 타켓액션
    // 상황에 맞게 -> 딜리게이트 디자인패턴
    // 스토리보드에서 gesture
}

