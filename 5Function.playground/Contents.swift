import UIKit

// MARK: - 함수

// 함수 정의
func hello(name: String) -> String{
  return "Hello, \(name)!"
}

let helloJany: String = hello(name: "Jany")
print(helloJany)

// 리턴 키워드 생략 가능
func hello2(name: String) -> String{
  "Hello, \(name)!"
}

let helloJany2: String = hello(name: "Jany")
print(helloJany2)


// 매개변수가 없는 함수 정의
func hello3() -> String{
  "Hello!"
}

func hello4(name: String , greeting: String = "Hello") -> String {
  "\(greeting), \(name)!"
}

// 매개변수 이름과 전달인자 레이블
// 여기서 전달인자는 from, to
func sayHello(from myName: String, to name: String){
  return print("Hello, \(name)! Nice to meet you, \(myName)")
}

// 전달인자 레이블이 다르면 같은 함수라도 중복 허용
func sayHello(from2 myName: String, to name: String){
  return print("Hello, \(name)! Nice to meet you, \(myName)")
}

print(sayHello(from: "최동진", to: "야근"))
print(sayHello(from2: "박우진", to: "호집이형"))
//print(sayHello(myName: "Jany", name: "Alice")) // 외부에서 매개변수 못 쓴다

let array: [Int] = [ 0 , 1 , 2, 3]
array.index(of: 0)

// 전달인자 레이블이 없는 함수 정의와 사용
func sayHello2(_ name: String, _ times: Int) -> String {
  var result: String = ""
  for _ in 0..<times{
    result += "Hello, \(name)!\n"
  }
  return result
}

print(sayHello2("Jany", 3))

// 가변 매개변수와 입출력 매개변수
func greet(names: String...) -> String{
  for name in names{
    print("Hello, \(name)!")
  }
  return "Hello, \(names.joined(separator: ", "))!"
}
greet(names: "Janny","추총무","송지갑")

// 반환값이 없는 함수
func printHello() -> Void{
  print("Hello!")
}

// "-> Void" 생략 가능
func printHello2(){
  print("Hello!")
}

// 데이터 타입으로의 함수
// (매개변수 타입의 나열) -> 반환 타입
// sayHello3 함수의 타입은 (String, Int) -> String 입니다.
func sayHeelo3(_ name: String) -> String {
  return "Hello, \(name)!"
}

// 매개변수도 없고 반환값도 없는 함수의 타입
// (Void) -> Void
// () -> Void
// () -> ()


typealias MathFunction = (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
  return a + b
}

var mathFunction: MathFunction = addTwoInts
print(mathFunction(10, 20))

// 전달인자로 함수를 전달받는 함수
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
  print(mathFunction(a,b))
}
printMathResult(mathFunction, 10, 20)

func returtMethod(a: Int, b: Int)->((Int, Int) -> Int){
  return { (a: Int, b: Int)-> Int in
    return a + b
  }
}
