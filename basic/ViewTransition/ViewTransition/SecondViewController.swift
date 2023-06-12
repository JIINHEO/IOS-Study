//
//  SecondViewController.swift
//  ViewTransition
//
//  Created by 허지인 on 2021/06/14.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLagel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController의 view가 메모리에 로드 됨")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInformation.shared.name
        self.ageLagel.text = UserInformation.shared.age
        
        print("SecondViewController의 view가 화면에 보여질 예정")
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }

}
