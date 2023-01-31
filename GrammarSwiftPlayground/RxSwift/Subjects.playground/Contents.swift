import RxSwift

let disposeBag = DisposeBag()

let publishSubject = PublishSubject<String>()

//서브젝트는 옵저버블이면서 옵저버다.
publishSubject.onNext("1. 안녕?")
//옵저버블은 구독자가 있어야하기 때문에 구독자들 만들어준다.
let 구독자1 = publishSubject.subscribe(onNext: {
    print($0)
})

publishSubject.onNext("2. 들리십니까")
publishSubject.on(.next("3. 들리셔요?"))

//수동으로 디스포즈
구독자1.dispose()

let 구독자2 = publishSubject.subscribe(onNext: {
    print($0)
})

publishSubject.on(.next("4. 들리셔요?"))
publishSubject.onCompleted()

publishSubject.on(.next("5. 2번님 들리셔요?"))

구독자2.dispose()

publishSubject
    .subscribe {
        print("세번쨰 구독자는 아무것도 받지 못한다.", $0.element ?? $0)
    }.disposed(by: disposeBag)

publishSubject.onNext("이것도 받지 못한다. 4번이후에 컴플리트 됐기 때문에.")

print("befaviorSubject -----------------")
enum SubjectError: Error {
    case error1
}
//초기값 지정
let behaviorSubject = BehaviorSubject<String>(value: "0. 초기값")

//전달할 첫번쨰 값
behaviorSubject.onNext("1. 첫번째값")

//퍼블리쉬서브젝트랑 다른점이라면 구독 바로전 값을 받을 수 있다.
//그러나 이 서브젝트도 전전값(초기값)을 받을 수는 없다.
behaviorSubject.subscribe {
    print("1구독자: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

//에러 발생시키기.
//1. behavior서브젝트의 특징인 value값 추출을 위해 우선 주석처리.
//behaviorSubject.onError(SubjectError.error1)

//두번쨰 구독자는 에러만 받을 수 있다. 첫번쨰값은 못받는단얘기다.
behaviorSubject.subscribe {
    print("2구독자: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

//2. value값 테스트
//이렇게 뽑아낼 수 있지만 rx에서는 잘 사용하지 않는 방법이라고 한다.
let value = try? behaviorSubject.value()
print(value)

print("ReplaySubject-------------------------")

//버퍼사이즈만큼 onNext값을 저장하는것인가.
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("1.여러분")
replaySubject.onNext("2.힘내셈")
replaySubject.onNext("3.어렵지만")
//여기까지하면 2,3번만 나온다.
replaySubject.subscribe {
    print("1구독: ", $0.element ?? $0)
}.disposed(by: disposeBag)

replaySubject.subscribe {
    print("2구독: ", $0.element ?? $0)
}.disposed(by: disposeBag)

//더 발생시켜보자
replaySubject.onNext("4.할수있어요.")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()

replaySubject.subscribe {
    print("3구독: ", $0.element ?? $0)
}.disposed(by: disposeBag)













