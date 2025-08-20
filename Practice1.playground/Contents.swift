import UIKit

let names = ["폰세", "와이스", "류현진", "윤동주", "황준서"]
let scores = [85, 73, 92, 65, 100]

enum Grade : String{
  case A,B,C,D,F
}

print("학생 성적 보고서")
func getGrade(_ score: Int) -> Grade{
  var res:Grade = .F
  switch score{
  case 90...:
    res = .A
    break
  case 80..<90:
    res = .B
    break
  case 70..<80:
    res = .C
    break
  case 60..<70:
    res = .D
    break
  default:
    res = .F
  }
  
  return res
}

for idx in 0..<scores.count{
  print("\(names[idx]): \(scores[idx])점,",terminator: " ")
  print("등급: \(getGrade(scores[idx]))")
}

func getAvg(scores : Array<Int>)-> Double{
  Double(scores.reduce(0, +)) / Double(scores.count)
}

print(getAvg(scores: scores))

typealias Student = (name: String, score: Int)
func getMax(names: Array<String>, scores: Array<Int>) -> Student{
  var resIdx: Int = -1
  var maxScore: Int = -1
  for idx in 0..<scores.count{
    if maxScore == 100 { break }
    if maxScore < scores[idx]{
      maxScore = scores[idx]
      resIdx = idx
    }
  }
  
  return Student(names[resIdx], maxScore)
}

func getMin(names: Array<String>, scores: Array<Int>) -> Student{
  var resIdx: Int = -1
  var maxScore: Int = 101
  for idx in 0..<scores.count{
    if maxScore == 0 { break }
    if maxScore > scores[idx]{
      maxScore = scores[idx]
      resIdx = idx
    }
  }
  
  return Student(names[resIdx], maxScore)
}

let maxStudent = getMax(names : names, scores: scores)
print("최고 점수: \(maxStudent.0) (\(maxStudent.1)점)")
let minStudent = getMin(names : names, scores: scores)
print("최저 점수: \(minStudent.0) (\(minStudent.1)점)")

print("등급 분포")
var gradeCount: [Grade: Int] = [:]
// 등급 초기화
for s in scores {
  let g = getGrade(s)
  gradeCount[g, default: 0] += 1
}

print("A: \(gradeCount[.A, default: 0])명")
print("B: \(gradeCount[.B, default: 0])명")
print("C: \(gradeCount[.C, default: 0])명")
print("D: \(gradeCount[.D, default: 0])명")
print("F: \(gradeCount[.F, default: 0])명")

// 평균 이상
var avg:Double = getAvg(scores: scores)
var wellStudent:Array<String> = []
for idx in 0..<scores.count{
  if(scores[idx] >= Int(avg)){
    wellStudent.append(names[idx])
  }
}

print("평균 이상의 학생 : \(wellStudent.joined(separator: ", "))")

// 제일 많은 분포를 차지하고 있는 등급
let mostGrade:Grade = gradeCount.sorted { $0.value > $1.value }.first!.key
print("제일 많이 받은 등급 : \(mostGrade)")


