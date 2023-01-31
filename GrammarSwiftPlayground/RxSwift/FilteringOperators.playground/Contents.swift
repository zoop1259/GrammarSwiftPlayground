import RxSwift

let disposeBag = DisposeBag()

print("ignoreElements----------------------")
let 취침모드 = PublishSubject<String>()

취침모드
//이 이그노어는 onNext 이벤트를 무시한다. error와 컴플리트는 받는다.
    .ignoreElements()
    .subscribe { _ in
        print("햇님")
    }.disposed(by: disposeBag)

취침모드.onNext("기상") //프린트는 안됨.
취침모드.onNext("기상")
취침모드.onNext("기상")

//이렇게 정지이벤트가 나올떄 값을 내뱉는다.
취침모드.onCompleted()

print("element(at: ------------------------")
let 두번쨰울때만꺠는사람 = PublishSubject<String>()

두번쨰울때만꺠는사람
//2번쨰 인덱스값에만 반응
    .element(at: 2)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

두번쨰울때만꺠는사람.onNext("기상")
두번쨰울때만꺠는사람.onNext("기상")
두번쨰울때만꺠는사람.onNext("이거이거이거")
두번쨰울때만꺠는사람.onNext("기상")

print("가장중요한 filter-----------------")

Observable.of(1,2,3,4,5,6,7,8)
//    .filter { $0 % 2 == 0}
//불리언값이 아닌 이런방법도 된다.
//    .filter { $0 < 7 }
//조건자체를?
    .filter { $0 == 7 || $0 == 8 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("skip ------------")

Observable.of(1,2,3,4,5,6,7)
//5번째까지 스킵하겠다. 라는 의미.
    .skip(5)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


print("skip while ------------")

Observable.of(1,2,3,4,5,6,7,8,9)
    .skip(while: {
        //6이 아닐떄까지 무시해라?
        $0 != 6 //6,7,8,9
    })
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("skip until --------------")

let 손님 = PublishSubject<String>()
let 문여는시간 = PublishSubject<String>()

손님
    .skip(until: 문여는시간)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

손님.onNext("1")
손님.onNext("2")

문여는시간.onNext("오픈")
//문열고난 이후에 값을 받아올 수 있다.
손님.onNext("3")

print("take -----------------------------")


Observable.of(1,2,3,4,5,6)
//3번째까지만 가져오겠다. 라는 의미
    .take(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

 print("take while -------------")

Observable.of(1,2,3,4,5,6,7,8,9)
    .take(while: {
        $0 != 4 //4번 전까지 출력된다. 1,2,3
    })
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("enumerated ----------------")
//인덱스를 참고해야하는 상황에 쓰인다.
Observable.of(1,2,3,4,5,6,7,8)
    .enumerated()
    .takeWhile {
        $0.index < 3 //1,2
    }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


print("take Until ---------------")
let 수강신청 = PublishSubject<String>()
let 신청마감 = PublishSubject<String>()

수강신청
    .take(until: 신청마감)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

수강신청.onNext("저요")
수강신청.onNext("저두요")

신청마감.onNext("마감했")

수강신청.onNext("늦었나요?!")

print("distinctUntilChanged------------")
//연달아 반복되는건 무시한다.
Observable.of(1,1,1,2,2,2,2,3,3,2)
    .distinctUntilChanged()
    .subscribe(onNext: {
        print($0) //1,2,3,2
    }).disposed(by: disposeBag)


