import UIKit

// MARK: - inout 함수
/// - 매개변수에 inout 키웓르르 사용하는 함수
/// - 함수의 매개변수를 값이 아닌 참조로 전달하여 함수 내부에 해당 매개변수를 수정하고
/// 호출한 곳의 원본 변수에도 그 변경사항을 반영할 수 있게 하는 키워드
//func someMethod(inner: Int){
//  inner = 100
//}
var outer = 0
var outer2 = 0
//someMethod(inner: outer)

// inout 키워드를 사용하면 C언어의 call by references가 가능
func inoutMethod(number: inout Int){
  number = 100
}
inoutMethod(number: &outer)
print("outer: \(outer)")

print("---------------")


/// MARK: Generic 제네릭
/// - 제네릭은 타입에 의존하지 않고, 여러 타입에서 재사용할 수 있는 코드를 만드는 방법
/// - 즉, 같은 기능을 하는 코드를 타입마다 따로 만들지 안혹, 하나의 템플리(틀)로 만들어 놓는다

// 제네릭이 없을 때의 불편함
// 매개변수로 전달되는 두 변수의 값을 스왑하는 함수의 예를 들어본다.

// Int 스왑
func swapInt(_ a: inout Int, _ b: inout Int){
  let tmp = a
  a = b
  b = tmp
}
var a1 = 10
var b1 = 20
swapInt(&a1, &b1)
print("a1: \(a1), b1: \(b1)")

// String 스왑
func swapString(_ a: inout String, _ b: inout String){
  let tmp = a
  a = b
  b = tmp
}
var a2 = "10"
var b2 = "20"
swapString(&a2, &b2)
print("a2: \(a2), b2: \(b2)")

// 기능은 같고 타입만 다른 여러개의 함수를 만들어야 한다.
// 심지어 함수의 내부 코드도 같다.

print("---------------")

// 제네릭 함수로 변환
// <T>를 함수명 뒤에 둔다.
// T는 호출하면서 정하고 싶은 타임
// T는 우리가 정해줄 수 있다. S , aaa 등 가능
func swap<T>(a: inout T, b: inout T) {
  let tmp = a
  a = b
  b = tmp
}

var a3 = 10
var b3 = 20
swap(a: &a3, b: &b3)
print("a3: \(a3), b3: \(b3)")


var a4 = "안녕"
var b4 = "하세요"
swap(a: &a4, b: &b4)
print("a4: \(a4), b4: \(b4)")

// 제네릭 함수의 장점
// 하나의 함수로 여러 타입을 처리할 수 있다


print("---------------")

/// 제네릭 타입
/// - 함수뿐만 아니라 타입(클래스, 구조체, 열거형)도 제네릭을 가질 수 있다.
/// - 객체 만들어질 때 타입을 전달한다
/// - 이번엔 T가 아니라 Element로 해본다.
class Stack<Element>{
  private var items: [Element] = []
  
  func printItmes(){
    print(items)
  }
  
  func push(_ item: Element){
    items.append(item)
  }
}

var intStack = Stack<Int>()
intStack.push(10)
intStack.push(20)
intStack.printItmes()

var stringStack = Stack<String>()
stringStack.push("안녕")
stringStack.push("하세요")
stringStack.printItmes()

/// 제네릭 제약
/// - 모든 타이벵 다 열어두면 위험할 수 있으니, 특정 조건을 붙일 수 있다
/// - "T": 뒤에는 모든 타입이 올 수 있다. 뒤에 오는 타입을 상속, 채택한 T만 가능하도록 제약을 걸어준다.
/// - 보통 프로토콜을 채택하면 제약을 걸어둔다.
protocol TestProtocol{
  var a : Int {get}
}

class TestCalss: TestProtocol{
  var a: Int = 100
}

func printA<T:TestProtocol>(value : T){
  print(value.a)
}

//printA<int>(value: 100)
printA(value: TestCalss())

