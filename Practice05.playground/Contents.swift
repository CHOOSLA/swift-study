import UIKit

class GenericClass<T:Equatable,U:Equatable>: Equatable{
  static func == (lhs: GenericClass<T, U>, rhs: GenericClass<T, U>) -> Bool {
    // 두개의 형식이 같고
    if(lhs.typeA == rhs.typeA && lhs.typeB == rhs.typeB ){
      if(lhs.a == rhs.a && lhs.b == rhs.b){
        return true
      }else{
        return false
      }
    }else{
      return false
    }
  }
  
  var a: T
  var b: U
  
  var typeA : T.Type { return T.self }
  var typeB : U.Type { return U.self }
  
  init(_ a:T, _ b:U){
    self.a = a
    self.b = b
    print("원본쌍 : (\(a), \(b))")
  }
  
  func swap( ){
    var temp: T = a
    if(b.self is String || a.self is String){
      print("잘못된 형식입니다!")
      return
    }else{
      a = b as! T
    }
    
    b = temp as! U
    print(" 스왑 결과 : (\(a), \(b))")
  }
  
  func isEqual() -> Bool {
    
    if a is Int && b is String {
      return false
    }
    return true
  }
}

let generic1 = GenericClass<Int, String>(100, "Hello")
let generic2 = GenericClass<Int, String>(100, "Hello")

print(generic1 == generic2)

func processArray(_ array: [Int], _ transform: (Int) -> Int) -> [Int]{
  var result: [Int] = [Int]()
  for element in array{
    let transformedValue = transform(element)
    result.append(transformedValue)
  }
  
  return result
}

func testProessArray(){
  let numbers: [Int] = [1, 2, 3, 4, 5]
  
  // 테스트 1: 각 요소를 2배로 만드는 클로저
  print("테스트 1: 각 요소를 2배로 만들기")
  let doubled = processArray(numbers) { $0 * 2 }
  print("원본 배열 : \(numbers)")
  print("2배 결과 : \(doubled)")
  
  // 테스트 2: 각 요소에 10을 더하는 클로저
  print("테스트 1: 각 요소를 10 더하기")
  let addedTen = processArray(numbers) { $0 + 10 }
  print("원본 배열 :  \(numbers)")
  print("2배 결과 : \(addedTen)")
  
}

testProessArray()

let scores = [45, 72, 30, 85, 90, 12, 63]

// 1. 60점 이상인 학생들만 필터링
let fillteredScores = scores.filter{$0 >= 60}

// 2. 필터링된 점수에 10점 가산
let adjustedScores = fillteredScores.map { min($0 + 10, 100) }

// 3. 가산된 점수의 평균 계산
let averageScore = Double(adjustedScores.reduce(0, +)) / Double(adjustedScores.count)

// 결과 출력 (테스트용)
print("필터링된 점수 배열 : \(fillteredScores)")
print("가산된 점수 배열 : \(adjustedScores)")
print("평균 점수 : \(averageScore)")
