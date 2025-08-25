import UIKit

// MARK: - Closure 클로저
// - C 언어의 블록, 코틀린 또는 다른 언어의 람다와 비슷
// - 함수와 비슷. 사실 함수는 클로저의 한 형태.
// - 함수 자체를(코드 블럭을) 하나의 변수, 상수처럼 다루고 싶어 사용하는 것. 매개변수로 전달하거나, 반환값으로 받거나.

// 기본 클로저 문법
//{ (매개변수 목록) -> 반환타입 in
//    실행할 코드1
//    실행할 코드2
//    return 반환값
//}

// 실제 클로즈이 형태
// { (a: Int, b: Int) -> Int in
//      return a + b
// }


// 예시
let sayHello = { (name: String) -> String in
  return "Hello, \(name)!"
}
print(sayHello("추슬라")) // 클로저를 변수 또는 상수에 담으면 실행가능

// 함수는 이름이 있는 클로저
func function(a: Int, b: Int)-> Int{
  return a + b
}

// 실제 클로저는 스위프트에서 객체로 취급한다.(일급객체)
// 클로저의 타입은 아래처럼 매개변수와 반환값으로 표현한다.
let sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
  return a + b
}

// sum이라는 변수를 호출한다.
let sumResult: Int = sum(10,20); // 클로저를 호출(클로저를 담고 있는 변수 호출)할 떄, 변수명 뒤에 괄호 안에 매개변수를 넣어주는 것이 클로저를
// 매개변수로 수행한다는 의미.
print(sumResult)

/// 전달인자로서의 클로저
/// - 클로저는 주로 함수의 전달인자로 사용된다.
// 매개변수로 클로저를 받아 클로저 반환값으로 클로저를 실행하는 함수
func calculate(a: Int, b:Int, method: (Int, Int)-> Int) -> Int{
  return method(a,b)
}

// 두 수를 더하는 역할을 하는 클로저
let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
  return a + b
}

let result: Int = calculate(a: 10, b: 20, method: add)
print(result)

let minus: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
  return a - b
}
print(calculate(a: 10, b: 20, method: minus))

let multiply: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
  return a * b
}
print(calculate(a: 10, b: 20, method: multiply))

let divide: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
  return a / b
}
print(calculate(a: 10, b: 20, method: divide))

// 따로 클로저를 상수/변수에 넣어 전달하지 않고,
// 함수를 호출할 때 클로저를 작성하여 전달할 수 있다.
let calculated = calculate(a: 20, b: 30, method: {(first: Int, second: Int)-> Int in
  return first + second
})
print(calculated)

// 변수(상수)를 미리 선언해놓고 전달하느냐, 함수에 전달인자로 바로 전달 하느냐의 차이이다.
func testFunction(a: Int){
  print("a: \(a)")
}
let closure = 10 // "10"이 클로저라고 생각해보자.
testFunction(a: closure)
testFunction(a: 10)

// 전달인자로 전달된 클로저의 축약
// calculate 함수
func calculate2(a: Int, b:Int, method: (Int, Int)-> Int) -> Int{
  return method(a,b)
}

let calculated2 = calculate(a: 20, b: 30, method: {(first: Int, second: Int)-> Int in
  return first + second
})

// 축약1: calculate 함수의 매개변수 method의 타입이 "(Int, Int) -> Int)"이기 때문에
let calculated3 = calculate(a: 20, b: 30, method: {(first, second) in
  return first + second
})

// 축약2(단축인자 사용) : 클로저의 매개변수 자체를 축약. 순서대로 $0, $1, $2 .. 로 표시
let calculated4 = calculate(a: 20, b: 30, method: {
  return $0 + $1
})

// 축약3(암시적 변환 표현) : 클로저의 본문이 단일표현식일 경우 return 키워드 생략 가능. 한 줄로도 가능.
let calculated5 = calculate(a: 20, b: 30, method: { $0 + $1 })

// 후행 클로저
// - 마지막 전달인자가 클로저이면 후행 클로저로 표현 가능
let calculated6 = calculate(a: 20, b: 30){
  $0 + $1
}
print("calculated6: \(calculated6)")

let numbers: [Int] = [1,2,3,4,5]
let newNumbers = numbers.map{ $0 * 2 }
let newNumbers2 = numbers.map{ $0 * 2 }
let newNumbers3 = numbers.map{ (item: Int) -> Int in
  return item * 2
}
let newNumbers4 = numbers.map({ (item: Int) -> Int in
  return item * 2
})

// 원래 형태는 이런 것: 근데 이제 전달인자가 _로 되어 있기 때문에 transform으로 명세 불가능
//let newNumbers5 = numbers.map(transform: { (item: Int)}) -> Int in
//  return item * 2
//})

