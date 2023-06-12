//
//  ViewController.swift
//  AsyncExample
//
//  Created by 허지인 on 2021/06/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func touchUpDownloadButton(_ sender: UIButton){
        //이미지 다운로드 -> 이미지뷰에 셋팅
        //https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!
//        let imageData: Data = try! Data.init(contentsOf: imageURL) //이 메서드가 동기 메서드인데 이 작업이 끝나기 전까지는 다음줄로 넘어가질 않는다. 멈춤 (현재 메인스레드에서 동작함)
//        let image: UIImage = UIImage(data: imageData)!
//        self.imageView.image = image
        
        
        OperationQueue().addOperation {
            //백그라운드에서 작업하고
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            
            //메인스레드로 가져와서 이 코드를 실행
            OperationQueue.main.addOperation {
                self.imageView.image = image //UI와 관련된 코드는 메인스레드에서만 동작해야한다.
            }
            
        }
        
    }

    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

