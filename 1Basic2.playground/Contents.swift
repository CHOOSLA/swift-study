import UIKit

// MARK: - 데이터 타입 안심(안정성)
/// 서로 다른 타입끼리의 데이터 교환은 꼭 타입 캐스팅을 해줘야한다
/// 엄밀히 말하면 새로운 인스턴스를 생성하여 할당한다
var safe1: Int = 200
var safe2: Double = 200.333

safe2 = Double(safe1) // 새로운 객체를 만들어서 할당

print(safe1)
print(safe2)

var name22 = "추창우" // 동적 타입 추론
let int33 = 100
let double = 333.333 // 기본 부동소수형 타입은 Double
// Float, Double

//int33 = "asdf" // 타입 추론으로 변수를 선언했더라도 다른 타입을 할당할 수 있다.

// MARK: - 타입 별칭 type alias
typealias MyInt = Int
typealias YourInt = Int

var age: MyInt = 10
var myAge: YourInt = 10

myAge = age

typealias MyString = String
var name: MyString = "추창우"

// 튜플 Tuple : 타입의 이름이 따로 지정되어 있지 않은 프로그래머 마음앧로 만드는 타입, 데이터 묶음.
var person: (String, Int) = ("추창우", 10)
print("이름 \(person.0), 나이 \(person.1)")
person.0 = "김근수" // 값 수정도 인덱스로 가능하다

var person2: (name: String, age: Int) = ("추창우", 10)
print("이름 \(person2.name), 나이 \(person2.age)")
person2.name = "김근수" // 값 수정 매개변수 이름으로도 가능


typealias PersonTuple = (name: String, age: Int)
var person3 : PersonTuple = ("추창우", 10)

// 페어링 되어 여러개의 값을 동시에 반환 받고 싶을 떄
fun11()
func fun11() -> (Int, String){
  
  return (100, "hello")
}

// MARK: - 컬렉션
/// 스위프트의 컬렉션에는 배열(Array), 딕셔너리(Dictionary), 셋(Set)
/// 코틀린과 비교
/// 배열 == 리스트
/// 딕셔너리 == 맵
/// 셋 == 셋

// 배열 Array: 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입
// let으로 선언하면 수정, 삭제, 추가 불가능
var names: Array<String> = ["김호민", "박명수", "이형희"]
var names2: [String] = ["김호민", "박명수", "이형희"]

// 빈 배열
var emptyArray: Array<Int> = [Int]()
var emptyArray2: [Int] = Array<Int>()
var emptyArray3: [Int] = []
print(emptyArray.isEmpty)
print(names.count)

print(names[0])
names[0] = "최지수"

names.append("우하하")
names.append(contentsOf: ["우하하2","우하하3"])
names.insert("우하하인서트", at: 2)
names.insert(contentsOf: ["인서트2","인서트3"], at: 2)
names.index(of:"우하하인서트")
var name5 : Int? = names.firstIndex(of: "우하하인서트") // nil이 올 수 있어서 ?로 설정

let firstName = names.removeFirst() // 첫 번째 요소 삭제하면서 삭제된 값 반환
let firstName2 = names.remove(at: 0)

print(names[0...1]) // 범위 연산자 사용

// 딕셔너리 : 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입
var numberForName : Dictionary<String, Int> = Dictionary<String, Int>()
typealias NameNumberDict = Dictionary<String, Int>
var numberForName2 : NameNumberDict = Dictionary<String, Int>()
var numberForName3 : [String:Int] = [String: Int]()
var numberForName4 : NameNumberDict = NameNumberDict()
var numberForName5 : [String:Int] = [:]
var numberForName6 : [String:Int] = ["조기환": 100, "김호민" : 200]

print(numberForName6.isEmpty)
print(numberForName6.count)
print(numberForName6["조기환"])
print(numberForName6["김호민"])

numberForName6["김호민"] = 1000
print(numberForName6["김호민"])

numberForName6["아무개"] = 2000
print(numberForName6["아무개"])

print(numberForName6.removeValue(forKey: "김호민")) // 삭제된 value를 반환해줌
print(numberForName6)

print(numberForName6["란란루", default: 0])

// 셋 Set : 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입
// 보통 순서가 중요하지 ㅇ낳거나 각 요소가 유일한 값이어야 할 때 사용한다.
var nameSet: Set<String> = Set<String>()
var nameSet2: Set<String> = []
var nameSet3 : Set<String> = ["김호민", "박명수", "이형희", "박명수"]
var nameSet4 = Set(["김호민", "박명수", "이형희", "박명수"])
print(nameSet3)

nameSet4.insert("아무개")
nameSet4.insert("박명수")
print(nameSet4)
print(nameSet4.remove("박명수"))

var unionSet : Set<String> = ["김호민", "아무개", "이형희"]
var unionSet2 : Set<String> = ["김호민", "박명수", "이형희"]

// 교집합
print(unionSet.intersection(unionSet2))
print(unionSet2.intersection(unionSet)) // 결과가 같다

// 여집합
print(unionSet.symmetricDifference(unionSet2))
print(unionSet2.symmetricDifference(unionSet)) // 결과가 다르다

// 합집합
print(unionSet.union(unionSet2))
print(unionSet2.union(unionSet)) // 결과가 같다

// 차입합
print(unionSet.subtracting(unionSet2))
print(unionSet2.subtracting(unionSet)) // 결과가 다르다

var array: [Int] = [1,2,3,4,5]
print(array.randomElement())
print(array.shuffled())
print(array) // 원본은 바꾸지 않는 것 shuffled
array.shuffle()
print(array) // 원본이 아예 바뀌어 버림

// 열거형
enum School{
  case elementary
  case middle
  case high
}

enum School2{
  case elementary, middle, high
}

// 열거형 변수 선언
var studentShcool : School = .elementary // 아마도 . 이 *와 같은 것인데 참조한다는 뜻인듯

// 열거형의 원시값
enum School3: String{
  case elementary = "초등학교"
  case middle = "중학교"
  case high = "고등학교"
}

var studentSchool2: School3 = .elementary
print(studentSchool2.rawValue)
