//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 허지인 on 2021/10/27.
//

import UIKit

class ViewController: UIViewController, SendDataDalegate {

    @IBOutlet weak var nameLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewCotroller = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController")
        as? CodePresentViewController else {return}
        viewCotroller.modalPresentationStyle = .fullScreen
        viewCotroller.name = "jiin"
        viewCotroller.delegate = self //delegate를 위임받
        self.present(viewCotroller, animated: true, completion: nil)
        
    }
    
    @IBAction func tapCodePushButton(_ sender: Any) {
        print("gogo")
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController")
        as? CodePresentViewController else {return}
        viewController.name = "jiin"
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이를 실행하기 직전에 자동으로 호출되게됨
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "jiin"
        }
    }
    
    func sendData(name: String){
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

