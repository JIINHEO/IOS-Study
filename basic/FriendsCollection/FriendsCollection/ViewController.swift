//
//  ViewController.swift
//  FriendsCollection
//
//  Created by 허지인 on 2021/07/08.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
   // var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.numberOfCell
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FriendsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendsCollectionViewCell
        
        let friend: Friend = self.friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fullAddress
        
        return cell

    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //어떤 아이템을 선택하면 셀의 갯수를 하나씩 늘려줌
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flowLayout: UICollectionViewFlowLayout //인스턴스 생성
        //몇가지 프로퍼티값 세팅
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10 //아이템간의 거리 10보다 컸으면 좋겠다.
        flowLayout.minimumLineSpacing = 10 //라인간의 거리
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30, height: 90)
        //예상 사이즈를 준 이유는 오토레이아웃에 따라 셀 사이즈가 가변적일 수 있다.
        //내 예상에는 이정도 사이즈가 될것이니 이 언저리로 사이즈를 계산해달라.
        self.collectionView.collectionViewLayout = flowLayout
        
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends" )else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
    }


}

