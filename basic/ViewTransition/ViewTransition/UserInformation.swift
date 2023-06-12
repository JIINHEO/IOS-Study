//
//  UserInformation.swift
//  ViewTransition
//
//  Created by 허지인 on 2021/06/15.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    // 타입프로퍼를 만들었음
    // 이걸로 인스턴스를 하나 생성해서 할당했기 때문에 타입프로퍼티를 호출하면 항상 똑같은 인스턴스를 사용함
    // 자주 사용하는 이름 x -> 패킷 공격에 취약할 수 있다.
    
    var name: String?
    var age: String?
}
