import UIKit

// MARK: - 동시성(==비동기): 동시성은 여러 작업을 동시에 식행하거나 병렬로 처리하는 것을 의미한다
// 순차적(==동기)

// 일반적인 순차 실행
// 수행문 한 줄이 끝나고 다음으로 넘어간다.
print("A")
print("B")
print("C")

// 오래 걸리는 비동기 작업
func fetchUser() async -> String {
  // 시간이 걸리는 네트워크 요청
  return "userData"
}

print("A")
print("B")
//fetchUser()
print("C")
print("D")

// Task : 동시 실행 작업 단위
Task {
  // 순차 실행과 같이 끝날 떄까지 기다린다는 의미지만,
  // 다른 Task들이 CPU를 사용할 수 있게 한다. -> 동시성 효율 UP
  let user = await fetchUser()
  print(user)
}

/// 구조적 동시성
/// - 여러 개의 동시 작업을 깔끔하게 묶어서 관리할 수 있는 방식
Task{
  async let user1 = fetchUser() // 또 이것도 비동기를 보냄
  async let user2 = fetchUser() // 또 이것도 비동기를 보냄
  let result = await (user1, user2)
  print(result)
}
