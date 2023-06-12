//
//  DetailViewController.swift
//  BountyList
//
//  Created by 허지인 on 2021/05/01.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() { //뷰가 메모리에 올라왔다.
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation(){
        //        nameLabelCenterX.constant = view.bounds.width
        //        bountyLabelCenterX.constant = view.bounds.width
        
        
        nameLable.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLable.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        //tranform : 변형을 가함
        
        nameLable.alpha = 0
        bountyLable.alpha = 0
        
    }
    private func showAnimation(){
        //원래값으로 복구를 시키
        //        nameLabelCenterX.constant = 0
        //        bountyLabelCenterX.constant = 0
        
        //        UIView.animate(withDuration: 0.3){ //-> 간단한 버전
        //            self.view.layoutIfNeeded()
        //        }
        
        //        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: { //-> 좀 더 자세히
        //            self.view.layoutIfNeeded() //option 천천히 -> 빨라지는.. 효과들
        //        }, completion: nil) // 애니메이션이 끝났을때 뭘 할건지?
        //
        //스프링 애니메이션
        //        UIView.animate(withDuration: 5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
        //            self.view.layoutIfNeeded()
        //        }, completion: nil)
        //
        //        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        // CGAffineTransform.identity : 변형을 가하기전
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLable.transform = CGAffineTransform.identity
            self.nameLable.alpha = 1
        }, completion: nil)
        
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLable.transform = CGAffineTransform.identity
            self.bountyLable.alpha = 1
        }, completion: nil)
        
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    
    func updateUI() {
        
        if let bountyInfo = self.viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLable.text = bountyInfo.name
            bountyLable.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo? ){
        bountyInfo = model
    }
}
