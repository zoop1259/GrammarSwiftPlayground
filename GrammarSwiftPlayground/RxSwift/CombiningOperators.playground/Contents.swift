import RxSwift
import Foundation

print("ㅁㄴㅇ")

let disposeBag = DisposeBag()

print("start----------------------")

let 노랑반 = Observable<String>.of("👨🏻‍🎓","👨‍🍳","👩‍🎓")

노랑반
    .enumerated() //이렇게하면 인덱스와 값이 나오기 때문이다.
    .map { index, element in
        return element + "어린이" + "\(index)"
    }
    //초기값 설정.
    .startWith("👨‍⚖️선생님") //String이다.
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("concat---------------------")
let 노랑반어린이들 = Observable<String>.of("👨🏻‍🎓","👨‍🍳","👩‍🎓")
let 선생님 = Observable<String>.of("👨‍⚖️선생님")

let 줄서서걷기 = Observable
//넣는 순서대로?
    .concat([선생님, 노랑반어린이들, 선생님])

줄서서걷기
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("concat2--------=-=-=-----=-=--")
선생님
    .concat(노랑반어린이들)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("concatMap=-=-=-=-=-=-=-=-=-=-=")
//딕셔너리형태?
let 어린이집: [String: Observable<String>] = [
    "노랑반" : Observable.of("가가가", "나나나", "다다다"),
    "파랑반" : Observable.of("야야","퓨퓨")
]

Observable.of("노랑반", "파랑반")
    .concatMap { 반 in
        어린이집[반] ?? .empty() //옵셔널이기떄문에 대응되는 값이 없으면 empty리턴
    }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("merge1-=-=--==---=-=-=-=-=-=-=")
let 강북 = Observable.from(["강북구", "성북구", "동대문구", "멋쟁이"])
let 강남 = Observable.from(["강남구", "강동구", "영등포구", "스타일"])

Observable.of(강북, 강남)
//합쳐주는 역할을 한다. 순서는 보장하지 않는다. 그냥 도착하는 순서대로 내뱉는다고 생각하자.
    .merge()
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


print("merge2-=-=--==---=-=-=-=-=-=-=")

Observable.of(강북, 강남)
//강북이 먼저 받으면 강남은 나중에 받는다. 강북이 끝나야 강남이 들어온다.
    .merge(maxConcurrent: 1)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("combineLatest1---=-=--=-=-=-==--==")
let 성 = PublishSubject<String>()
let 이름 = PublishSubject<String>()

let 성명 = Observable
    .combineLatest(성, 이름) { 성, 이름 in
        성 + 이름
    }
    
성명
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

성.onNext("김")
이름.onNext("좌진")
이름.onNext("두한")
성.onNext("이")
성.onNext("박")
//이걸로 수수료 계산기를 리팩토링 할 수 있지 않을까.

print("combineLatest2---=-=--=-=-=-==--==")

let 날짜형식 = Observable<DateFormatter.Style>.of(.short, .long)
let 현재날짜 = Observable<Date>.of(Date())

let 현재날짜표시 = Observable
    .combineLatest(날짜형식, 현재날짜, resultSelector: { 형식, 날짜 -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = 형식
        return dateFormatter.string(from: 날짜)
    })

현재날짜표시
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("combineLatest3---=-=--=-=-=-==--==")

let lastName = PublishSubject<String>()
let firstName = PublishSubject<String>()

let fullName = Observable
    .combineLatest([firstName, lastName]) { name in
        name.joined(separator: " ")
    }
fullName
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

lastName.onNext("강")
firstName.onNext("민")
firstName.onNext("남")

print("zip----------==-=-=--==-=-=--=")

enum 승패 {
    case 승
    case 패
}

let 승부 = Observable<승패>.of(.승, .승, .패, .승, .패)
let 선수 = Observable<String>.of("한국","미국","일본","중국","러시아","브라질")

//다른 연산자와는 다르게, 둘중하나의 값이 비어있어 매칭되지 않으면 무시한다.
let 시합결과 = Observable
    .zip(승부, 선수) { 결과, 대표선수 in
        return 대표선수 + "선수" + " \(결과)"
    }

시합결과
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("withLatestFrom1-===-==-=-=-=-=-==-=")
let 총 = PublishSubject<Void>() //트리거역할
let 달리기선수 = PublishSubject<String>() //준비선수

총
    .withLatestFrom(달리기선수)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

달리기선수.onNext("1번")
달리기선수.onNext("1번 2번")
달리기선수.onNext("1번 2번 3번")
총.onNext(Void())
총.onNext(Void())

print("sample----==--=-=-==-=-=--=")
let 출발 = PublishSubject<Void>()
let 경기선수 = PublishSubject<String>()

경기선수
    .sample(출발) //단 한번만 사용가능
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

경기선수.onNext("--")
경기선수.onNext("-- --")
경기선수.onNext("-- --  ---")

출발.onNext(Void())
출발.onNext(Void())
출발.onNext(Void())//이렇게 여러번해도 값은 한번나온다.

print("withLatestFrom1 = sample ((((()()()()(")
let 총2 = PublishSubject<Void>() //트리거역할
let 달리기선수2 = PublishSubject<String>() //준비선수

총2
    .withLatestFrom(달리기선수2)
    .distinctUntilChanged() //이걸 추가해주면 샘플처럼된다.
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

달리기선수2.onNext("1번")
달리기선수2.onNext("1번 2번")
달리기선수2.onNext("1번 2번 3번")
총2.onNext(Void())
총2.onNext(Void())

print("amb(애매모호?)==--==-=-=-=-=-=-=-=-=-=-=-=-")
let 버스1 = PublishSubject<String>()
let 버스2 = PublishSubject<String>()

let 버스정류장 = 버스1.amb(버스2) //여기선 우선 두개를 모두 지켜보겠다. 라는 의미 여기서 순서는 보장하지않음.

버스정류장
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

버스2.onNext("버스2 - 승객0") //이렇게 먼저들어온 서브젝트만 구독.
버스1.onNext("버스1 - 승객0") //이제부터 버스1은 구독안함.
버스2.onNext("버스2 - 승객1")
버스2.onNext("버스2 - 승객2")
버스1.onNext("버스1 - 승객1")
버스1.onNext("버스1 - 승객2")

print("swiftchLatest=-=--=-=--==-=-=-=--==-=-")
let 학생1 = PublishSubject<String>()
let 학생2 = PublishSubject<String>()
let 학생3 = PublishSubject<String>()

let 손들기 = PublishSubject<Observable<String>>()

let 손든사람 = 손들기.switchLatest()

손든사람
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

손들기.onNext(학생1) //손든사람만 말할수있다.
학생1.onNext("저 할래요.")
학생2.onNext("저도 할래요.") //무시된다.
학생1.onNext("어허")

손들기.onNext(학생2) //이제 학생2한테만 발언권이있다.
학생1.onNext("제가 먼저에요.")
학생2.onNext("무슨소리에요")
학생3.onNext("둘이 싸울꺼면 제가 먼저합니다?")

손들기.onNext(학생3) //3번만 권한이있다.
학생1.onNext("무슨소립니까")
학생2.onNext("맞아요 뭐라는거야")
학생3.onNext("싸우는거 보기 안좋습니다.")

print("reduce=-=-=--=-=-==--=")
Observable.from((1...10))
//첫번쨰값은 0
//    .reduce(0, accumulator: { summary, newValue in
//        //최근값과 새로운값을 더해줘
//        return summary + newValue
//    .reduce(0) { summary, newValue in
//        return summary + newValue
//})
    .reduce(0, accumulator: +)
//모두 같은 결과.
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("scan=--==-=-=-=-=-=-=-=-==--")
Observable.from((1...10))
//culc 결과에 쓸 수 있을거같다.
//recude는 결과만을 반환한다면 이것은 연산과정도 다 알려줌.
    .scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

























