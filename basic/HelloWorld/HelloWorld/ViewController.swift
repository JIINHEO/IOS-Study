//
//  ViewController.swift
//  HelloWorld
//
//  Created by 허지인 on 2021/07/27.
//

import UIKit
// 라이브러라ㅣ나 프레임워크 등 사용하고자 하는 기능 관련 파일을 반입하라는 뜻
// UIKit - 앱 화면을 구성하는 데에 필요한 모든 객체들이 포함된 프레임워크, 파운데이션 프레임워크와 함께 iOS앱을 만들기 위해 꼭 필요한 핵심

class ViewController: UIViewController {
    // 기본 뷰 컨트롤러를 구현하는 핵심 클래스
    // 뷰 컨트롤러를 정의하려면 반드시 이 클래스를 상속받거나, 이 클래스를 상속받은 또 다른 클래스를 상속받아야함
    
    @IBOutlet var uTitle: UILabel!
    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "Button01 Clicked"
    }

    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "Button01 Clicked"
    }

    override func viewDidLoad() { //콜백 메소드,뷰의 로딩이 완료되었을 떄 시스템에 의해 자동으로 호출, 리소스를 초기화하거나 초기 화면을 구성하는 등,
        // 처음 한 번만 실행하야 하는 초기화 코드는 대부분 이 메소드 내부에 작성하면됨
        
        super.viewDidLoad()
        // 부모 클래스에 정의된 viewDidLoad() 메소드의 내용도 모두 실행한다는 의미.
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() { //콜백 메소드
        super.didReceiveMemoryWarning()
        // 메모리가 부족할 때 시스템에서 자동으로 호출하는 메소드
    }
    
    @IBAction func sayHello(_ sender: Any) {
        self.uTitle.text = "Hello, World!"
    }
}

