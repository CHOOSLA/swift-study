import UIKit

class Student{
  // [과목 : 점수]인 딕셔너리
  var subjectScore: [String:Int]? = [:]
  
  func addSubjectScore(_ subject: String , _ score: Int){
    subjectScore?[subject] = score
  }
  func getSubjectScore() -> [String:Int]?{
    return self.subjectScore
  }
}

let student1 = Student()
print("테스트 1: 학생과 과목 점수 존재")
