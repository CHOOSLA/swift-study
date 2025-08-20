import UIKit

var greeting = "Hello, playground"
print(greeting)

var greeting2 = "Hello, playground"
print(greeting)



UIImage(systemName: "star")

var sum = 0
for i in 1...10{
  sum += i
}

// Mark: - 주석

// 한 줄 주석

// greeting3

/*
 여러줄 주석
 여러줄 주석
 여러줄 주석
 */

/// 문서주석
/// - 이것은 문서 주석입니다.
/// - 클래스, 메서드 등의 도큐멘트를 작성할 때

/**
 문서주석 가능합니다.
 여러줄 주석도 문서주석 가능합니다
 */

// 출력하기
print(greeting)
dump(greeting) // 객체에 대한 자세한 정보를 출력하게됨

var number = 10
print(number)
dump(number)

// 수행문 작성
// 스위프트 수행문 작성은 코틀린과 같이 수행문 뒤에 ";"(세미콜론)을 붙이지 않아도 된다.
print("Hello World!")
print("Hello World!");print("Hello World!");print("Hello World!");print("Hello World!");

// println
print("Hello World!", terminator: "\n")
print("Hello World!", terminator: "||END||")

// MARK: - 이름 짓기 규칙

// Lower Camel Case
// 함수, 메소드, 변수, 상수 등의 이름을 지을 떄
var someVar1 = 0
func someFunc1(){
  
}

// Upper Caeml Case
// 타입(Int, String, Bool, Float, Double 등) , 클래스
var somInt1 : Int = 0

// 기타 참고
// 일반 스네이크 케이스 : my_variable_name
// 어퍼 스네이크 케이스 : MY_CONSTANT_NAME


