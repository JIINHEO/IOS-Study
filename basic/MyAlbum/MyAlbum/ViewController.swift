//
//  ViewController.swift
//  MyAlbum
//
//  Created by 허지인 on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    @IBOutlet weak var priceLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
 
    }
 
    
    @IBAction func showAlert(_ sender: Any) {
        let message = "가격은 \(currentValue) 입니다"
        let alert = UIAlertController(title:"도전입니다",message:message, preferredStyle:.alert)
        let action = UIAlertAction(title:"ok", style:.default, handler: {action in self.refresh()})
        //closure{} 실행가능한 코드 = 함수. 를 넣음
        //실행 가능한 코드 블럭이 파라미터로서 넘겨질 수 있다.
        
        
        alert.addAction(action)
        present(alert,animated: true, completion: nil)

    }
    
    func refresh()  {
        let randomPrice = arc4random_uniform(10000)+1
         currentValue=Int(randomPrice)
         priceLable.text = "₩ \(currentValue)"
    }
}

