//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 허지인 on 2021/08/02.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: AnyObject) {
        // slef.presentingViewController 속성은 UIViewController(부모) 타입의 인스턴스를 리턴
        // 우리가 앞서 정의해 놓은 프로퍼티는 ViewController(자식) 클래스에 정의되어 있음
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다.
        // 전달해줄 대상 뷰 컨트롤러의 인스턴스를 찾아오는 역할
        
        /*
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        
        // 값을 전달한다.
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
         */
        
        
        /*
         AppDelegate는 앱 전체를 통틀어 하나의 인스턴스만 존재하도록 iOS 시스템에 의해 보장. -> Singleton
         때문에 AppDelegate 클래스의 인스턴스는 직접 생성할 수 없으며, 아래와 같이 생성되어 있는 인스턴스를 참조해야 함
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value

         */
        
        // UserDefault 객체의 인스턴스를 가져온다
        let ud = UserDefaults.standard
        
        // 값을 저장한다.
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        // 이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
    }
        
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
