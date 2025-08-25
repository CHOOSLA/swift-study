import UIKit

class Student{
  // [과목 : 점수]인 딕셔너리
  let name: String?
  var subjectScore: [String:Int]? = [:]
  
  func addSubjectScore(_ subject: String? , _ score: Int?){
    if subject == nil {return}
    subjectScore?[subject!] = score
  }
  
  init(_ name: String?) {
    self.name = name
  }
  
}

func getSubjectScore(student: Student?) -> [String:Int]?{
  return student?.subjectScore
}

let student1 = Student("Alice")
student1.addSubjectScore("Math", 90)
print("테스트 1: 학생과 과목 점수 존재")
print("학생: \(student1.name ?? "학생이 nil인 경우") , Math 점수: \(student1.subjectScore?["Math"] ?? -1)") // ??로 nil 처리

let student2 = Student(nil)
print("학생: \(student2.name ?? "학생이 nil인 경우"), Math 점수: \(student2.subjectScore?["Math"] ?? -1)")

let student3 = Student("Bob")
student3.addSubjectScore(nil, nil)
print("학생: \(student3.name ?? "학생이 nil인 경우"), Math 점수: \(student3.subjectScore?["Math"] ?? -1 == -1 ? "과목없음" : "")")

func runTwoTasks(_ name1: String, _ iterations1: Int, _ name2: String, _ iterations2: Int) -> String?{

  var isdone1 = false
  var isdone2 = false
  
  Task{
    for idx in 1..<iterations1 + 1 {
      print("\(name1): \(idx)")
      try? await Task.sleep(for: .seconds(1))
    }
  }
  
  Task{
    for idx in 1..<iterations2 + 1 {
      print("\(name2): \(idx)")
      try? await Task.sleep(for: .seconds(1))
    }
  }
  
  Task{
    while(true){
      if(isdone1 && isdone2){
        return "(\(name1) 완료, \(name2) 완료)"
      }
    }
  }
  
  return nil
}

print(runTwoTasks("Task1", 3, "Task2", 5) ?? "\n")


enum ScoreError: Error{
  case emptyScores
  case invliadScore(score: Int)
}

// 2. 평균 계산 함수
func calcualteAverage(scores: [Int]) throws -> Double {
  guard !scores.isEmpty else {
    throw ScoreError.emptyScores
  }
  
  for score in scores{
    if score < 0 {
      throw ScoreError.invliadScore(score: score)
    }
  }
  
  let total = scores.reduce(0, +)
  return Double(total) / Double(scores.count)
}

let testCases:[[Int]] = [
  [90, 80, 70],
  [],
  [100, -5, 95]
]

for scores in testCases{
  do{
    let avg = try calcualteAverage(scores: scores)
    print("평균 점수 : \(avg)")
  }catch ScoreError.emptyScores{
    print("점수 배열이 비어있습니다!")
  }catch ScoreError.invliadScore(score: let score){
    print("잘못된 점수 발견: \(score)")
  }catch {
    print("알 수 없는 에러: \(error)")
  }
}

