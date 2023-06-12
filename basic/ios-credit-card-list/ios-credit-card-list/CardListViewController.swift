//
//  CardListViewController.swift
//  ios-credit-card-list
//
//  Created by 허지인 on 2021/11/17.
//

import UIKit
import Kingfisher
import FirebaseDatabase


class CardListViewController: UITableViewController {
    var ref: DatabaseReference!
    
    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        //UITabel Cell Register
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListCell")
        
        ref = Database.database().reference()
        
        ref.observe(.value){ snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
                let cardList = Array(cardData.values)
                self.creditCardList = cardList.sorted { $0.rank < $1.rank}
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("ERROR JSON parsing \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else {return UITableViewCell()}
        
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = "\(creditCardList[indexPath.row].name)"
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.cardImageView.kf.setImage(with: imageURL)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 어떤 셀을 탭했을때를 기준으로 제어하고 싶을 때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // 상세화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "CardDetailViewController") as? CardDetailViewController else {return}
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.showDetailViewController(detailViewController, sender: nil)
        
        //Option1
        let cardID = creditCardList[indexPath.row].id
//        ref.child("Item\(cardID)/isSelected").setValue(true)
        //cardID의 경로에 isSelected에 true값을 넣겠다
        //true 대신 nil 넣으면 해당 경로의 값은 삭제됨 Firebase는 삭제를 더 명시적으로 removeValue를 사용함
        
        
        //Option2 현재 키 값이 분명하지 않을떄 객체가 가지고 있는 고유한 값을 검색함으로써 객체의 경로를 알 수 있다.
//        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] snapshot in
//            guard let self = self, //순환참조 방지
//                  let value = snapshot.value as? [String: [String: Any]],
//                  let key = value.keys.first else { return }
//
//            self.ref.child("\(key)isSelected").setValue(true)
//        }
    }
    
    //삭제
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //Option1 - 경로를 알 때
            let cardID = creditCardList[indexPath.row].id
            ref.child("Item\(cardID)").removeValue()
            
            //Option2 - 경로를 모를 때
//            ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) {[weak self] snapshot in
//                guard let self = self,
//                      let value = snapshot.value as? [String: [String: Any]], //어레이 값으로 전달되기 때문에 first
//                      let key = value.keys.first else { return }
//                self.ref.child(key).removeValue()
//            }
        }
    }
}
