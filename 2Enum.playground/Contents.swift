import UIKit

// MARK: - enum(열거형)

// 아래 불리언처럼 열거형은 커스텀하게 개발자가 변수를 만들어주는 거라고 생각해도 좋다.
var boolean: Bool
boolean = true
boolean = false

var int1: Int

enum Boolean{
  case trueValue
  case falseValue
}

var booleanEnum : Boolean

booleanEnum = .trueValue
booleanEnum = .falseValue

enum Weekday{
  case mon
  case tue
  case wed
  case thu
  case fri
  case sat
  case sun
}

enum Weekday2{
  case mon, tue, wed, thu, fri, sat, sun
}

enum Weekday3{
  case mon
  case tue
  case wed
  case thu
  case fri, sat, sun
}

enum School : Int{
  case elementary
  case middle
  case high
}

let school: School = .high
print(school) // 이름들이 그대로 나오는 구조
print(school.rawValue) // rawValue로 하면 인덱스값이 나옴

let school2: School = School(rawValue: 2)!
print(school2.rawValue)

struct Student{
  let name : String
  let school: School
  
  func updateStudent(){
  }
}

// 열거형의 연관값
enum MainDish{
  case pasta(taste:String)
  case pizza(topping:[String])
  case steak
}

var pasta = MainDish.pasta(taste: "spicy")
print(pasta)

