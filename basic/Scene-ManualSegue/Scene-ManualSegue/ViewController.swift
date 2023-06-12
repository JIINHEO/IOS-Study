//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by 허지인 on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
    // 화면 복귀
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

