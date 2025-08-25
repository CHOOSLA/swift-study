import UIKit

// 학생 클래스
class Student {
  var name: String
  var scores: [String: Int]?
  
  init(name: String, scores: [String: Int]?){
    self.name = name
    self.scores = scores
  }
}

// 점수 조회 함수
func getSubjectScore(_ student: Student?, _ subject: String) -> Int? {
  return student?.scores?[subject]
}

// 테스트 코드
func testGetSubjectScore() {
  // 테스트 1: 학생이 존재하고 과목 점수가 있는 경우
  print("테스트1: 학생과 과목 점수 존재")
  let student1 = Student(name: "Alice", scores: ["Math": 90, "English" : 85])
  let mathScore = getSubjectScore(student1, "Math")
  print("학생: \(student1.name), Math 점수: \(mathScore ?? -1)") // 90
  
  // 테스트2: 다양한 nil 케이스
  print("\n테스트 2: nil 케이스")
  // 2-1: 학생이 nil인 경우
  let student2: Student? = nil
  let score2 = getSubjectScore(student2, "Math")
  print("학생이 nil인 경우, Math점수: \(score2 ?? -1)")
  
  // 2-2: 점수 데이터가 nil인 경우
  let student3 = Student(name: "Bob", scores: nil)
  let score3 = getSubjectScore(student3, "Math")
  print("점수 데이터가 nil인 경우, Math 점수: \(score3 ?? -1)")
  
  // 2-3: 과목이 없는 경우
  let student4 = Student(name: "Charlie", scores: ["English": 95])
  let score4 = getSubjectScore(student4, "Math")
  print("과목이 없는 경우, Math 과목없음, 점수:\(score4 ?? -1)")
}

testGetSubjectScore()

print("----------------------------")

func task(name: String, iteration: Int) async -> String{
  for i in 1...iteration{
    try? await Task.sleep(for: .seconds(1))
    print("\(name)-\(i)")
  }
  
  return "\(name) 완료"
}


Task{
  async let result1 = task(name: "Task 1", iteration: 3)
  async let result2 = task(name: "Task 2", iteration: 5)
  let result = await(result1, result2)
  print(result)
}


