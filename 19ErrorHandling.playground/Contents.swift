import UIKit

// MARK: - Error Handling 에러 처리
// 스위프트에는 다른 언어에서의 try-catch문과 조금 다른 do-catch문을 사용한다.
// do 블럭 안에 에러가 발생할 수 있는 수행문 앞에 try 키워드를 사용한다.

let a = 10
let b = 0
// print("코드 수행1")
// a/b
// print("코드 수행1")

do{
  print("코드 수행1")
  a/b
  print("코드 수행2")
}catch{
  print("수행문이 에러가 발생")
}
