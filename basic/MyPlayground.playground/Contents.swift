import UIKit
import Foundation



class User {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int){
        self.nickname = nickname
        self.age = age
    }
    init (age: Int){
        self.nickname = "ablert"
        self.age     = age
    }
    
    deinit{
        print("deint user") //메모리 해제 직전에 호출 , class만 가능
    }
}

var user3 = User(nickname: "asdf", age: 23)
user3.nickname
user3.age

var user2 = User(age:27)
user2.nickname
user2.age

var user4: User? = User(age:35)
user4 = nil

struct Dog {
    var name: String
    var gender: String
}

var dog = Dog(name: "jiin", gender: "female")

class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String ){
        self.name    = name
        self.gender = gender
    }
}

let cat = Cat(name: "js", gender: "ma")
cat.name = "sss"
print(cat.name)

struct Stock {
    var averagePrice: Int
    var quanity: Int
    var purchasePrice : Int { //연산프로퍼티
        get{
            return averagePrice * quanity
        }
        set(newPrice){
            averagePrice = newPrice / quanity
        }
    }
}

var stock = Stock(averagePrice: 2300, quanity: 3)
print(stock)
stock.purchasePrice
stock.purchasePrice = 3000
stock.averagePrice

class Vehicle{
    var currrentSpeed = 0.0
    var description: String {
        return "traveling at\(currrentSpeed) miles per hour"
    }
    func makeNoise() {
         print("speaker on")
    }
}

class Bicycle: Vehicle {
 var hasBasket = false
}

var bicycle = Bicycle()
bicycle.currrentSpeed

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String{
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
car.currrentSpeed = 30.0
car.gear = 2
print(car.description)

func guardTest(value: Int?) {
    guard let value = value else {return}
    print(value)
}

guardTest(value: 2)
guardTest(value: nil)




protocol SomeProtocol {
      
}
protocol SomeProtocol2 {
      
}
struct SomeStructure: SomeProtocol, SomeProtocol2{
    
    //프로토콜 채택
}

//protocol FirstProtocol {
//    var name: Int( get set)  //읽기쓰기
//    var age: Int(get) //읽기전용
//}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set} //타입프로퍼티
}

protocol FullyNames{
    var fullName: String {get set}
    func printFullName()
}

struct Person: FullyNames{
    var fullName: String
    func printFullName() {
        print("asdf")
    }
}

protocol SomeProtocol3{
    func someTypeMethod()
}
protocol SomeProtocol4{
    init(someParameter: Int)
}

protocol SomeProtocol5{
    init()
}

class SomeClass: SomeProtocol5{
    required init(){
        
    }
}


extension Int { //연산 프로퍼티만 가능
    var isEven: Bool {
     return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

var number = 3
number.isOdd
number.isEven

extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}

var string = "0"
string.convertToInt()


enum CompassPoint: String{
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
}

var direction = CompassPoint.east
direction = .west

switch direction {
case .north:
    print(direction.rawValue)
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print(direction.rawValue)
}

let direction2 = CompassPoint(rawValue: "남")



struct Developer {
    let name:  String
}

struct Company{
    let name: String
    var developer: Developer?
}
var developer = Developer(name:"han")
var company = Company(name: "Gunter", developer: developer)
print(company.developer)
print(company.developer?.name)
print(company.developer!.name)


enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
}

//throw PhoneError.batteryLow(batteryLevel: 20)

func checkPthoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else{throw PhoneError.unknown}
    guard batteryLevel > 20 else{throw
        PhoneError.batteryLow(batteryLevel: 20)
    }
    return "배터리 상태가 정상입니다."
}


do {
    try checkPthoneBatteryStatus(batteryLevel: 20)
}catch PhoneError.unknown{
    print("알 수 없는 에러입니다.")
}catch PhoneError.batteryLow(let baterryLebel){
    print("배터리 전원 부족 남은 배터리 : \(baterryLebel)%")
}catch{
    print("그 외 오류 발생: \(error)")
}

let status = try? checkPthoneBatteryStatus(batteryLevel: 31)
print(status)

let status2 = try! checkPthoneBatteryStatus(batteryLevel: 31)
print(status2)

let hello = { () -> () in
    print("hello")
}


hello()

let hello2 = { (name: String)-> String in
    return "Hello, \(name)"
}

hello2("Gunter") //전달인자값 적지 않고 해야함

func doSomething(closure: () -> ()) {
    closure()
}
func doSomething2() -> () -> () {
    return { () -> () in
        print("hello4")
    }
}

doSomething2()()


 
 
