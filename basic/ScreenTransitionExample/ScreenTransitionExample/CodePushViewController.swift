//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 허지인 on 2021/10/27.
//

import UIKit

class CodePushViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
