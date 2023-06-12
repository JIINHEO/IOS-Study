//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 허지인 on 2021/06/18.
//

import UIKit

class SecondViewController: UIViewController {

    
    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     
    override func viewWillAppear(_ animated: Bool) { //화면에 나타나기 전에 세팅을 해줘야함
        super.viewWillAppear(animated)
        
        self.textLabel.text = self.textToSet
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
