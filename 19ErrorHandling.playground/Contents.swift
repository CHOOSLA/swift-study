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
  if let networkError = error as? NetworkError {
    print("구조체 에러 잡힙 : \(networkError.code) \(networkError.message)")
  } else {
    print("알 수 없는 에러 \(error)")
  }
}
