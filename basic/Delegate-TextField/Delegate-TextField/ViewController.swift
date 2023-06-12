//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by 허지인 on 2021/08/04.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var tf: UITextField!
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    
    @IBAction func confirm(_ sender: Any) {
        // 텍스트 필드를 최초 응답자 객체에서 해제
        self.tf.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        return true // false를 리턴하면 편집되지 않는다.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작되었습니다.")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트의 내용이 삭제될 때 호출")
        return true // false 를 리턴하면 삭제되지 않는다.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true를 리턴
            // 현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음
            if(textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        } else { // 입력된 값이 숫자라면 false를 리턴
            return false
        }
    }
    
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    
    // 텍스트 필드 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true // false를 리턴하면 편집이 종료되지 않는다.
    }
    
    // 텍스트 필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tf.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화
        // Do any additional setup after loading the view.
        
        // 텍스트 필드 속성 설정
        
        self.tf.borderStyle = UITextField.BorderStyle.line // 테두리 스타일 - 직선
        
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0) // 배경 색상
        
        self.tf.contentVerticalAlignment = .center
        self.tf.contentHorizontalAlignment = .center
        
        self.tf.layer.borderColor = UIColor.darkGray.cgColor // 테두리 색상 회색
        
        self.tf.layer.borderWidth = 2.0 //
        
        
        self.tf.placeholder = "값을 입력하세요"
        self.tf.keyboardType = UIKeyboardType.alphabet
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark
        self.tf.returnKeyType = UIReturnKeyType.join
        
        
        self.tf.becomeFirstResponder() //텍스트 필드를 최초 응답자로 지정
        
        self.tf.delegate = self
    
    }
}

