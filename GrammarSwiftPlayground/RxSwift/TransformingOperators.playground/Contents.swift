import RxSwift
import Foundation
//변환메소드들
let disposeBag = DisposeBag()

print("toArray ------------------")

Observable.of("a","b","c")
//배열로 변환해준다.
    .toArray()
    .subscribe(onSuccess: {
        print($0)
    }).disposed(by: disposeBag)

print("map..............")
Observable.of(Date())
    .map { date -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("flatMap ------------------")
//[[string]] 이처럼 중첩된 배열을  [string]으로 만들어준다.

protocol 선수 {
    var score: BehaviorSubject<Int> { get }
}

struct 양궁선수: 선수 {
    var score: BehaviorSubject<Int>
}

//각 10점 8점을 쏜다.
let 강대표 = 양궁선수(score: BehaviorSubject<Int>(value: 10))
let 중대표 = 양궁선수(score: BehaviorSubject<Int>(value: 8))

let 올림픽 = PublishSubject<선수>()

올림픽
    .flatMap { 선수 in
        선수.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

올림픽.onNext(강대표)
강대표.score.onNext(10) //또 10점쏨

올림픽.onNext(중대표)
강대표.score.onNext(10)
중대표.score.onNext(9)

print("flatmapLatest -------------")
//switchLatest라는것도 찾아보자.
struct 높이뛰기선수: 선수 {
    var score: BehaviorSubject<Int>
}

let 서울 = 높이뛰기선수(score: BehaviorSubject<Int>(value: 7))
let 제주 = 높이뛰기선수(score: BehaviorSubject<Int>(value: 6))

let 전국체전 = PublishSubject<선수>()

전국체전
//가장 최신의 값만을 출력한다.
    .flatMapLatest { 선수 in
        선수.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

전국체전.onNext(서울)
서울.score.onNext(9) //이값이 최신값이다.

전국체전.onNext(제주) //새로운 선수가 등록되면
서울.score.onNext(10) //값은 무시된다.
제주.score.onNext(8) //이값은 들어오고
제주.score.onNext(6) //이값도 들어온다. 즉. 서울값이 무시되는것이다.

//예를들어 일반적인 필터링을 생각해보자.
//swift를 입력할떄 s일때의 값과 sw일떄의 값을 모두 받아오면 렉이 심할것이다.
//그래서 s를 무시하고 sw의 값만을 받아오게 만들떄 쓰는경우가 많다.

print("materialize and dematerialize---------")

enum 반칙: Error {
    case 부정출발
}

struct 달리기선수: 선수 {
    var score: BehaviorSubject<Int>
}

let 김토끼 = 달리기선수(score: BehaviorSubject<Int>(value: 0))
let 박치타 = 달리기선수(score: BehaviorSubject<Int>(value: 1))

let 달리기100 = BehaviorSubject<선수>(value: 김토끼)

달리기100
    .flatMapLatest { 선수 in
        선수.score
            .materialize()
    }
    .filter {
        //에러가 없을때만 통과시키자.
        guard let error = $0.error else {
            return true
        }
        print(error)
        return false
    }.dematerialize() //이걸 사용하지않으면 next(1)이런식으로 출력된다.
  
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

김토끼.score.onNext(1)
김토끼.score.onError(반칙.부정출발)
김토끼.score.onNext(2) //원래면 무시되어야하지만. materialize떄문에 출력됨.

달리기100.onNext(박치타)

print("materialize and dematerialize2---------")
let input = PublishSubject<Int?>()

let list: [Int] = [1]

input
    .flatMap {
        $0 == nil ? Observable.empty() : Observable.just($0)
    }
    .map { $0! }
    .skip(while: { $0 != 0 }) // 전화번호는 010이라 0부터 시작하기떄문에 0입력받기전까지 무시.
    .take(11) //11자리까지 받을것이다.
    .toArray() //그리고 합쳐서 배열로!
    .asObservable() //그리고 다시 옵저버블로 만들어주고.
    .map { //매핑을 한다.
        $0.map { "\($0)" }
    }
    .map { numbers in
        var numberList = numbers
        numberList.insert("-", at: 3) //전화번호처럼 3번재와 8번쨰에 -넣는다. 그럼 3-4자리번호는?
        numberList.insert("-", at: 8)
        let number = numberList.reduce(" ", +) //그리고 합쳐준다.
        return number
    }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

input.onNext(1)
input.onNext(2)
input.onNext(nil)
input.onNext(0)
input.onNext(10) //이렇게 10은 하나로 취급해버리니. 10이상은 무시하게 만들어야할듯.
input.onNext(nil)
input.onNext(9)
input.onNext(8)
input.onNext(8)
input.onNext(nil)
input.onNext(8)
input.onNext(1)
input.onNext(2)
input.onNext(3)
input.onNext(4)
input.onNext(4)
input.onNext(5)
