//
//  ViewController.swift
//  Networking
//
//  Created by 허지인 on 2021/07/13.
//

import UIKit
// 다 처리하면 이미지가 잘 안뜨는데 처음에 레이아웃이 되어있지 않은 상태여서 이런 문제가 발생
// 그래서 이미지뷰에 플레이스홀더이미지를 미리 넣어주면 좋다.
// 누르면 이미지 나옴

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    let cellIdentifier: String = "friendCell"
    var friends: [Friend] = []

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for : indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil //재사용 되기 전에 셀의 이미지는 없애줘야함. 가져오기 전에 비워줌
        
        
        DispatchQueue.global().async { //백그라운드 아무데서나 동작하는 기본적으로 제공하는 백그라운드큐
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            //Data(contentsOf: imageURL) 동기 메서드이기 때문에 이미지가 다운이 끝날때까지 화면이 멈춤
            //그래서 이미지 받는것은 백그라운드, 이미지 세팅음 메인에서
            
            //문제가 있음 cell 이 다운로드 받는동안 화면을 움직인다 = 셀의 인덱스가 바뀐다.
            //데이터를 세팅하는 현재 인덱스와 != 다운로드 끝났을때의 인덱스
            //구분하고, 서로 일치하는 상황에서만 이미지를 세팅해줘야한다.
            DispatchQueue.main.async {
                if let index: IndexPath = tableView.indexPath(for: cell){
                    if index.row == indexPath.row    {
                        cell.imageView?.image = UIImage(data:imageData)
                    }
                }
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 노티피케이션 받을거야! 라고 노티피케이션 센터에게 알려준다.
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReciveFriendsNotification(_:)), name: DidReceiveFirendsNotification, object: nil)
    }
    
    // Request.swift에서 보낼때 백그라운드에서 동작해서
    // 받는것 또한 백그라운드에서 동작함 그래서 메인 스레드로 가져와서 호출해줘야한다.
    @objc func didReciveFriendsNotification(_ noti: Notification){
        
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else { return }
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestFriends()
     
    }
}

