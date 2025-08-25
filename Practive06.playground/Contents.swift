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

func runTwoTasks(_ name1: String, _ iterations1: Int, _ name2: String, _ iterations2: Int){
  
  var result : (String, String)?
  
  Task{
    for idx in 0..<iterations1 {
      print("\(name1): \(idx)")
      try? await Task.sleep(for: .seconds(1))
    }
  }
  
  Task{
    for idx in 0..<iterations2 {
      print("\(name2): \(idx)")
      try? await Task.sleep(for: .seconds(1))
    }
  }
}


