import UIKit

// MARK: - 흐름 제어

// 조건문
// if문
let first = 5
let second = 7

if first > second {
  print("first가 더 큽니다")
}else if first < second{
  print("second가 더 큽니다")
}else {
  print("first와 seconde가 같습니다")
}

// switch 문
let integerValue: Int = 5
switch integerValue {
case 1:
  print("1입니다")
case 2,3:
  print("2 또는 3입니다")
case 10...20:
  print("10에서 20사이의 값입니다.")
default:
  print("기타")
}

// 반복문
for i in 0...2{
  print(i)
}

// while 뮨
var names: [String] = ["a","b","c"]
while names.isEmpty == false {
  print("잘가랑~ \(names.removeFirst())!")
}

// repeat-while
var names2: [String] = ["a","b","c"]
repeat {
  print("잘가랑~ \(names2.removeFirst())!")
} while names2.isEmpty == false
