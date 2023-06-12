//
//  ViewController.swift
//  SubmitValue
//
//  Created by 허지인 on 2021/07/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    // 자동 갱신 여부가 바뀔 때마다 호출되는 메소드
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    // 갱신주기가 바뀔 때마다 호출되는 메소드
    @IBAction func onStepper(_ sender: UIStepper) {
        
        let value = Int(sender.value)
        self.intervalText.text = "\(value) 분 마다"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSubmit(_ sender: Any) {
        // VC2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        // 값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
//        프레젠테이션 방식으로 화면 전환하면서 값을 전달하기
//        self.present(rvc, animated: true)

        
        
        // 내비게이션 컨트롤러를 통해 화면 전환하면서 값을 전달하기
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "MaunalSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        //인스턴스의 타입을 UIViewController에서 ResultViewController타입으로 다운 캐스팅
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        //캐스팅된 인스턴스 상수 rvc를 이용하여 값을 전달
        rvc.paramEmail = self.email.text! // 이메일
        rvc.paramUpdate = self.isUpdate.isOn // 자동갱신 여부
        rvc.paramInterval = self.interval.value // 갱신주기
    }
}

