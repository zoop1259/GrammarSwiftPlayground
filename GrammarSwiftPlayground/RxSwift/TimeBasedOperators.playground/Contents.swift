import RxSwift
import RxCocoa //ui관련
import Dispatch //timer관련
import Darwin   //timer관련
import UIKit
import PlaygroundSupport //플레이그라운드에서도 ui확인가능하게 해주는.
//타임관련은 주석처리하면서 하는게 좋을듯..

let disposeBag = DisposeBag()

//print("replay--=-=-=-=-=-=-=-=-=-=-")
//let 인사말 = PublishSubject<String>()
//let 반복하는앵무새 = 인사말.replay(1) //하나를 반복한다.
//반복하는앵무새.connect() //연결시킨다.
//
//인사말.onNext("1. 하이")
//인사말.onNext("2. 이하이")
//
//반복하는앵무새
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
////사실 인사말은 퍼블리시 서브젝트라 구독전의 이벤트는 받을 수 없어야하지만
////리플레이를 통해 버퍼수만큼 받아올 수 있다.
//
//인사말.onNext("3. 이것도 받을 수 있다.")
//
//print("replayAll-==--=-==--==-")
//
//let 닥터스트레인지 = PublishSubject<String>()
////지나간 이벤트에 대해서 모든 값을 받을 수 있다.
//let 타임스톤 = 닥터스트레인지.replayAll()
//타임스톤.connect()
//
//닥터스트레인지.onNext("도르마무")
//닥터스트레인지.onNext("거래를 하러왔다")
//
//타임스톤
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//print("buffer =-=-=-=-=-=-=-=--==--=-==-")
//
//let source = PublishSubject<String>()
//
//var count = 0
//let timer = DispatchSource.makeTimerSource()
//
////시작 후 2초뒤부터 매 1초마다 반복됨
//timer.schedule(deadline: .now() + 2, repeating: .seconds(1))
//timer.setEventHandler {
//    count += 1
//    source.onNext("\(count)")
//}
//timer.resume() //타이머는 꼭 resume을 해줘야한다.
//
//
//source
////2초마다 2개씩, 메인에서 돌게.
//    .buffer(timeSpan: .seconds(2),
//            count: 2,
//            scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
////2개를 받지 못하면 1개를 방출한다. 2개 받으면 방출.
////예를들어 1이랑 1.9999999를 받으면 1만 방출하는것.
//
//print("window--==--=-==-=--==-=-==-=-=-=")
//
//let 만들어낼Observable수 = 1
//let 만드는시간 = RxTimeInterval.seconds(2)
//
//let window = PublishSubject<String>()
//
//var windowCount = 0
//let windowTimerSource = DispatchSource.makeTimerSource()
//windowTimerSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//windowTimerSource.setEventHandler {
//    windowCount += 1
//    window.onNext("\(windowCount)")
//}
//windowTimerSource.resume()
//
//window
//    .window(timeSpan: 만드는시간,
//            count: 만들어낼Observable수,
//            scheduler: MainScheduler.instance
//    )
//    .flatMap { windowObservable -> Observable<(index: Int, element: String)> in
//        return windowObservable.enumerated()
//    }
//    .subscribe(onNext: {
//        print("\($0.index)번째 옵저버블의 요소 \($0.element)")
//    })
//    .disposed(by: disposeBag)

print("delaySubscription-=-=-=-==--==-=-=-=")
//이건 구독을 지연시킨다면
//let delaySource = PublishSubject<String>()
//
//var delayCount = 0
//let delayTimeSource = DispatchSource.makeTimerSource()
////2초뒤부터 구독을 시작해서 1초마다
////1. 여기서 2초뒤부터 방출을 시작하지만.
//delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//delayTimeSource.setEventHandler {
//    delayCount += 1
//    delaySource.onNext("\(delayCount)")
//}
//delayTimeSource.resume()
//
//delaySource
////2. 여기서 5초뒤부터니까 위에서 방출시작이 되어도 5초뒤부터 구독이 시작됨
//    .delaySubscription(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("delay---------=-=-=-=-=-=-=-=")
//이건 전체를 지연시킨다?(요소의 방출을 뒤로 미룸.)

//let delaySubject = PublishSubject<Int>()
//
//var delayCount = 0
//let delayTimerSource = DispatchSource.makeTimerSource()
//delayTimerSource.schedule(deadline: .now(), repeating: .seconds(1))
//delayTimerSource.setEventHandler {
//    delayCount += 1
//    delaySubject.onNext(delayCount)
//}
//delayTimerSource.resume()
//
//delaySubject
//    .delay(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("interval=-=-=-=-=-=-=-=-=-=-=-=")
//아주 직관적이고 간단하다.
//Observable<Int>
////간단하게 사용하여 3초간격으로 1씩 늘려서 방출..ㄸ
//    .interval(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

print("timer------------=-=-=-=")
//인터벌보다 좀 더 강력함.
//반복도 되고
//마감도 설정할 수 있다.
//Observable<Int>
////5초가 지난뒤부터
//    .timer(.seconds(5),
////2초마다
//           period: .seconds(2),
//           scheduler: MainScheduler.instance
//           )
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)


print("timeout -=-=-=-=-=-=-=-=-=")
//이것은 ui를 통해 확인하는경우가 많기 때문에 rxcocoa를 같이 쓴다.
let 누르지않으면에러 = UIButton(type: .system)
누르지않으면에러.setTitle("눌러야합니다.", for: .normal)
누르지않으면에러.sizeToFit()

//5초마다 한번씩 눌러줘야한다.
//그렇지 않으면 에러가 발생하고 타이머가 종료된다.
PlaygroundPage.current //화면 등록
    .liveView = 누르지않으면에러 //화면 보여주기

누르지않으면에러.rx.tap
    .do(onNext: {
        print("tap!")
    })
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)








