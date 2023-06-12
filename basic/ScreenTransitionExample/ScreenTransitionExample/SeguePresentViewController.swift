//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 허지인 on 2021/10/27.
//

import UIKit

class SeguePresentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
