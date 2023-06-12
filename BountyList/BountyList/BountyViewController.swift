//
//  BountyViewController.swift
//  BountyList
//
//  Created by 허지인 on 2021/04/27.

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    let viewModle = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModle.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //UICollectionViewDataSource
    //몇개를 보여줄까요?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModle.numOfBountyInfoList
    }
    
    //셀은 어떻게 표현할까요?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as?
        GridCell else {
           return UICollectionViewCell()
        }
        
        let bountyInfo = viewModle.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        
        cell.update(info: bountyInfo)
        return cell
    }
    
    //UICollectionViewDelegate
    //셀이 클릭되었을때 어쩔까요?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item )
    }
    
    //UICollectionViewDelegateFlowLayout : cell size를 계산할거다 (목표: 다향한 디바이스에서 일관적인 디자인을 보여주기위해)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeigh : CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2 //bounds = collectionview size
        let height: CGFloat = width * 10/7 + textAreaHeigh // 10/7은 7:10 이라
        
        return CGSize(width: width, height: height)
    }
}

    
struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}

class BountyViewModel {
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 3300000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 4400000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList:[BountyInfo]{
        let sortedList  =  bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}

    class GridCell: UICollectionViewCell {
        @IBOutlet weak var imgView: UIImageView!
        @IBOutlet weak var nameLable: UILabel!
        @IBOutlet weak var bountyLable: UILabel!
        
        func update(info: BountyInfo){
            imgView.image = info.image
            nameLable.text = info.name
            bountyLable.text = "\(info.bounty)"
        }
    }

