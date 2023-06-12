//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 허지인 on 2021/07/30.
//

import UIKit

class ResultViewController: UIViewController {

    // 아울렛 변수는 외부에서 값을 직접 대입할 수 없는 변수이다.
    // 외부 객체에서 직접 찹조할 수 없도록 제한이 되어있다.
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String = ""
    
    var paramUpdate: Bool = false
    
    var paramInterval: Double = 0
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() { //화면이 메모리에 로드되고 난 직후
        super.viewDidLoad()
        
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval)) 분 마다 갱신"

        // Do any additional setup after loading the view.
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
