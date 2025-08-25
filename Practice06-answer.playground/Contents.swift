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

// 1. 에러 정의
enum ScoreError: Error{
  case emptyScores
  case invalidScore(socre: Int) // 연관값
}

// 2. 평균 계산 함수
func calcualteAverage(scores: [Int]) throws -> Double{
  guard !scores.isEmpty else{
    throw ScoreError.emptyScores
  }
  
  for score in scores{
    if score < 0 {
      throw ScoreError.invalidScore(socre: score)
    }
  }
  
  let total = scores.reduce(0, +)
  return Double(total) / Double(scores.count)
}

// 테스트 실행
let testCases:[[Int]] = [
  [90, 80, 70],
  [],
  [100, -5, 95]
]

for scores in testCases{
  do {
    let average = try calcualteAverage(scores: scores)
    print("평균: \(average)")
  } catch ScoreError.emptyScores {
    print("점수가 비어 있습니다.")
  } catch ScoreError.invalidScore(socre: let score){
    print("잘못된 점수 발견: \(score)")
  } catch{
    print("알 수 없는 에러:\(error)")
  }
}

