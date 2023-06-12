//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 허지인 on 2021/10/27.
//

import UIKit

protocol SendDataDalegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDalegate? //delegate 앞에는 weak를 붙여줘야함 강한 참조로 메모리누수 발생
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "jiin")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
     
}
