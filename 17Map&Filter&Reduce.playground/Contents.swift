import UIKit

// MARK: - 고차함수 map, filter, reduce를 살펴본다
// - 고차함수는 '다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환함수 함수'
// - 스위프트 표준 라이브러리에서 제공하는 유용한 고차함수들에 대해 알아본다.
// - 주로 컬레션 관련 (Array, Set, Dictionary 등)
// - map, fulter, reduce 등이 있다.

// map
// - map 함수는 컬렉션 내부의 기존 데이터를 변환하여 새로운 컬렉션을 반환한다.
let numbers: [Int] = [1, 2, 3, 4, 5]
var doubleNumber: [Int]
var strings: [String]

doubleNumber = [Int]()
strings = [String]()

// map 안 쓰기
for number in numbers{
  doubleNumber.append(number * 2)
  strings.append("\(number)")
}

// map을 썼을 때
doubleNumber = numbers.map({(numbers) -> Int in return numbers * 2})

// 축약형
doubleNumber = numbers.map({$0 * 2})
print(doubleNumber)

let closure = {(number: Int)-> Int in
  return number * 2
}
// 컬렉션(Array) 클래스 내부
func map<T>(_ closure: (T) -> T) -> [T] {
  var newItems = [T]()
  for item in numbers{
    newItems.append(closure(item as! T))
  }
  
  return newItems
}

// filter
// 필터 함수는 컬렉션 내부의 값을 걸러서 새로운 컬렉션을 추출할 때 사용한다.
var filtered: [Int] = [Int]()
for number in numbers{
  if number % 2 == 0 {
    filtered.append(number)
  }
}
print("filterd : \(filtered)")

// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter{ $0 % 2 == 0 }
print("evenNumbers : \(evenNumbers)")

// numbers의 요소 중 홀수를 걸러내어 새로운 배열로 반환
let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1 }
print("oddNumbers : \(oddNumbers)")

// reduce
// 컬렉션의 요소를 단일 값으로 축소하는 컬렉션
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더한다.
let someNumbers: [Int] = [1, 2, 3, 4, 5]
var result: Int = 0
// someNumbers의 모든 요소를 더한다
for number in someNumbers{
  result += number
}
print(result) // 25

print("---------------------")

let sum: Int = someNumbers.reduce(0, {(first : Int, second: Int) -> Int in
  print("\(first) + \(second)")
  return first + second
})
print("sum: \(sum)")

// 초깃값이 3이고 모든 배열의 요소를 더한다.
let sumFromThree: Int = someNumbers.reduce(3, +)
print("sumFromThree: \(sumFromThree)")

let someStrings: [String] = ["a", "b", "c"]
let sum4: String = someStrings.reduce("z", {(first: String, second: String) -> String in
  print("\(first) + \(second)")
  return first + second})
print("sum4: \(sum4)")

// 클로저 대신 연산자 오퍼레이터로 제공 가능하다.
let sum5 = someNumbers.reduce(0, +)
print("sum5 : \(sum5)")
