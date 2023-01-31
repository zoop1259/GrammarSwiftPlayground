import UIKit
import RxSwift

let bag = DisposeBag()

//Observable.just("Hello, rxSwift")
//    .subscribe { print($0) }
//    .disposed(by: bag)


print("Observable은 정의일 뿐이다. 구독자가 없으면 값을 방출하지 않는다.")
print("----just----")
Observable<Int>.just(1)
//이렇게 구독자를 만들어줘야한다.
    .subscribe(onNext: {
        print($0)
    })

print("----of----")
Observable<Int>.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })

print("----of2----")
Observable.of([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })

print("----from---- from은 하나씩 방출한다. 그리고 배열만 받는다. 즉 배열의 요소를 하나씩 방출한다.")
Observable.from([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })


print("뭔가 next가 찍히는건 옵셔널느낌이다.")
print("--------subscribe1--------")
Observable.of(1,2,3)
    .subscribe {
        print($0)
    }

print("--------subscribe2--------")
Observable.of(1,2,3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }

print("--------subscribe3--------")
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })

print("-----empty------")
Observable.empty() //추론자체가 불가능하여 아무런값이 나오지않는다.
    .subscribe {
        print($0)
    }
               
print("-----empty2------")
Observable<Void>.empty()
    .subscribe {
        print($0)
    }

print("-----empty3------")
Observable<Void>.empty()
    .subscribe(onNext: {
        
    },
    onCompleted: {
        print("콤플리트")
    })

print("-----never----")
Observable<Void>.never()
    .debug("never") //디버그를통해 구독은됐지만 값을 내뱉지않는다는걸 알수있다.
    .subscribe(
        onNext: {
            print($0)
        },
        onCompleted: {
            print("콤플리트")
        })

print("-------range------") //약간 for루프 느낌.
Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2 * \($0) = \(2 * $0)")
    })


print("dispose-------")
Observable.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })
    .dispose() //이 이후엔 이벤트를 따로 방출하지 않는다. 많은양의 값을 방출할때 사용해야한다.

print("disposebag-------")
let disposebag = DisposeBag()
Observable.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: bag) //메모리 누수를 위한 것


print("create1-----------")
Observable.create { observer -> Disposable in
    observer.onNext(1)
//    observer.on(.next(1)) //똑같은표현
    observer.onCompleted()
//    observer.on(.completed) //이것도 똑같은표현
    observer.onNext(2)
    return Disposables.create()
}
.subscribe {
    print($0)
}
.disposed(by: disposebag)

print("create2-------------")
enum MyError: Error {
    case anError
}

Observable<Int>.create { observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe(onNext: {
    print($0)
},
           onError: {
    print($0.localizedDescription)
},
           onCompleted: {
    print("complete")
    
},
           onDisposed: {
    print("dispose")
})
.disposed(by: disposebag)


print("-----deffered -------")
//옵저버블을 감싸는 옵저버블.
Observable.deferred {
    Observable.of(1,2,3)
}
.subscribe {
    print($0)
}
.disposed(by: disposebag)

print("-----deffered2 ------")
var 뒤집기: Bool = false

let factory: Observable<String> = Observable.deferred {
    뒤집기 = !뒤집기
    
    if 뒤집기 {
        return Observable.of("앞")
    } else {
        return Observable.of("뒤")
    }
    
}

for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0)
    })
        .disposed(by: disposebag)
}

