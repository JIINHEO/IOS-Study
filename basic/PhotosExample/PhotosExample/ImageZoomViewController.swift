//
//  ImageZoomViewController.swift
//  PhotosExample
//
//  Created by 허지인 on 2021/06/19.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    
    var asset: PHAsset!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    //scrollView delegate 메서드
    func viewForZomming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: {image, _ in
                                    self.imageView.image = image
                                  })
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
