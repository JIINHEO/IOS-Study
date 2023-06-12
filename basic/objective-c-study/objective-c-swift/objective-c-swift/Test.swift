//
//  Test.swift
//  objective-c-swift
//
//  Created by jiinheo on 2022/06/21.
//

import Foundation

//@objc class SwiftBridge: NSObject {
//    @objc class func stringValueForMyEnumCase1() -> NSString {
//        return MyEnum.stringValue as NSString
//    }
//}

@objc enum MyEnum2: Int {
    case caseA
    case caseB
    
    var stringValue: String {
        switch self {
        case .caseA:
            return "A"
        case .caseB:
            return "B"
        }
    }
}



@objc class Test : NSObject {
    @objc class func determineDuration(url: NSURL) {
        // Class Method : "class" 키워드 붙임

    }

    @objc func hi(name : NSString) {
        //Instance Method
    }

    
    @objc enum MyEnum: Int {
        case case1
        case case2
        
        static func stringValue(forCase myEnumCase: MyEnum) -> NSString {
            switch myEnumCase {
            case .case1:
                return "case1"
            case .case2:
                return "case2"
            }
        }
    }


}
 
