//
//  Request.swift
//  Networking
//
//  Created by 허지인 on 2021/07/14.
//

import Foundation

let DidReceiveFirendsNotification: Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriends(){
    
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {return}

    let session: URLSession  = URLSession(configuration: .default)
    //뒤에 클로져는 요청에 대한 서버의 응답이 왔을때 호출될 클로저
    //이 클로저는 메인 스레드에서 동작하지 않음 많은양의 데이터가 있을 수 있기 때문에 백그라운드에서 함
    let dataTask: URLSessionDataTask = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let data = data else {return}
        
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
//            self.friends = apiResponse.results
//
//            DispatchQueue.main.async { //메인 스레드에서 동작하게
//                self.tableView.reloadData() //백그라운드에서 동작하면 안되는 메서드
//            }
            
            
            //노티피케이션을 발송하는 스레드 -> 받는 스레드 또한 해당 스레드에서 동작 
            NotificationCenter.default.post(name: DidReceiveFirendsNotification, object: nil, userInfo: ["friends":apiResponse.results])
           
        } catch(let err){
            print(err.localizedDescription)
        }
    }
    dataTask.resume() //이때 데이터테스크를 실행하고 서버에 요청
}
