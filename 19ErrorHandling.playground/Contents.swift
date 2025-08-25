import UIKit

// MARK: - Error Handling 에러 처리
// 스위프트에는 다른 언어에서의 try-catch문과 조금 다른 do-catch문을 사용한다.
// do 블럭 안에 에러가 발생할 수 있는 수행문 앞에 try 키워드를 사용한다.

let a = 10
let b = 0
// print("코드 수행1")
// a/b
// print("코드 수행1")

//do{
//  print("코드 수행1")
//  a/b
//  print("코드 수행2")
//}catch{
//  print("수행문이 에러가 발생")
//}

enum MyError: Error{
  case somethingWentWrong
  case somethingWentWrong2
  case somethingWentWrong3
}

func riskyFunction() throws -> Int{
  print("실행하다가 문제 발생!")
  throw MyError.somethingWentWrong
  print("이 코드는 실행되지 않는다.")
}

do{
  print("코드 수행1")
  try riskyFunction()
  print("코드 수행2")
} catch {
  print("수행문이 예외를 발생시킴")
}

// 구조체
struct NetworkError: Error{
  let code: Int
  let message: String
}

do{
  // 에러 직접 던지기 (상태 코드와 메시지를 함께 포함)
  throw NetworkError(code: 404, message: "Not Found")
} catch{
//  print("구조체 에러 잡힙 : \(error)")
//  print("구조체 에러 잡힙 : \(error.code) \(error.message)") // 이렇게 바로 못 쓰고 형변환 해야 한다.
  if let networkError = error as? NetworkError { // as? error가 nil이 아닐경우 형변환
    print("구조체 에러 잡힙 : \(networkError.code) \(networkError.message)")
  } else {
    print("알 수 없는 에러 \(error)")
  }
}

// MARK: - 자판기 오류 예제
// 1 ) 오류 메시지가 담긴 enum을 만든다
enum VendingMachineError: Error {
  case invalidInput // 사용자가 수량을 잘 못 입력했을 때
  case insufficientFunds(moneyNeeded: Int) // 돈이 모자를 때
  case outOfStock // 재고가 없을 떄
}

class VendingMachine{
  let itemPrice = 1000
  var itemCount = 5
  var deposit = 0
  
  // 돈 받기 메서드
  func receiveMoney(_ money: Int) throws {
    // 입력한 돈이 0이면 오류를 던진다.
    guard money > 0 else {
      throw VendingMachineError.invalidInput
    }
    
    // 오류가 없으면 정상 처리 한다
    deposit += money
    print("\(money)원 받음")
    
  }
  
  // 물건 팔기 메서드
  func vend(numberOfItems numberOfitemsToVend: Int) throws -> String{
    // 구매하려는 수량보다 미리 넣어든 돈이 적으면 오류를 던진다.
    guard numberOfitemsToVend * itemCount <= deposit else {
      let moneyNeeded = numberOfitemsToVend * itemCount - deposit
      throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
    }
    
    return "물건팔기 성공!"
  }
}

// 자판기 객체 생성
let machine = VendingMachine()
// 판매 결과를 전달 받을 변수
var result: String?

do{
  try machine.receiveMoney(10)
  result = try machine.vend(numberOfItems: 10)
  print("result : \(result)")
}catch VendingMachineError.invalidInput{
  print("입력받은 돈이 잘 못 되었습니다")
}catch VendingMachineError.insufficientFunds(let moneyNeeded){
  print("\(moneyNeeded)원이 부족합니다")
}catch VendingMachineError.outOfStock{
  print("수량이 부족합니다")
}


result = try? machine.vend(numberOfItems: 10) // 값이 없을 경우 nil , 있을경우 optional로 감싸진 값
let result2 = try! machine.vend(numberOfItems: 10) // 에러가 발생할 경우 이경우에는 프로그램이 종료되어 버림

