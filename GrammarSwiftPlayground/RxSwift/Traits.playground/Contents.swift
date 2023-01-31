import RxSwift
import Foundation

let disposeBag = DisposeBag()

enum TraitsError: Error {
    case single
    case maybe
    case completable
}

print("single1------------")
Single<String>.just("오케이")
    .subscribe(onSuccess: {
        print($0)
    },
               onFailure: {
        print("error \($0)")
    },
               onDisposed: {
        print("dispose")
    })
    .disposed(by: disposeBag)


print("single2------------")
Observable<String>.just("오케이")
    .asSingle() //single타입으로 만들어준다.
    .subscribe(onSuccess: {
        print($0)
    },
               onFailure: {
        print("error \($0)")
    },
               onDisposed: {
        print("dispose")
    })
    .disposed(by: disposeBag)
 
print("single3------------")
Observable<String>.create { observer -> Disposable in
    observer.onError(TraitsError.single)
    return Disposables.create()
    }

    .asSingle() //single타입으로 만들어준다.
    .subscribe(onSuccess: {
        print($0)
    },
               onFailure: {
        print("error \($0.localizedDescription)")
    },
               onDisposed: {
        print("dispose")
    })
    .disposed(by: disposeBag)
 
print("single3------- 싱글은 api통신에서 많이 사용된다.")
//모델을 하나 만들어준다.
struct SomeJSON: Decodable {
    let name: String
}
//에러를 만들어주고
enum JSONError: Error {
    case decodingError
}
//값을 제대로 받아올수있는 json을 만들어준다.
let json1 = """
{"name":"Kang"}
"""
//에러를 받아올수있는 json2를 만든다.
let json2 = """
{"my_name":"min
"""

func decode(json: String) -> Single<SomeJSON> {
    Single<SomeJSON>.create { observer -> Disposable in
        guard let data = json.data(using: .utf8),
                let json = try? JSONDecoder().decode(SomeJSON.self, from: data)
        //실패했을때.
        else {
            observer(.failure(JSONError.decodingError))
            return Disposables.create()
        }
        //성공했을때.
        observer(.success(json))
        return Disposables.create()
        
    }
}

decode(json: json1)
    .subscribe {
        switch $0 {
        case .success(let json):
            print(json.name)
        case .failure(let error):
            print(error)
        }
    }.disposed(by: disposeBag)
decode(json: json2)
    .subscribe {
        switch $0 {
        case .success(let json):
            print(json.name)
        case .failure(let error):
            print(error)
        }
    }.disposed(by: disposeBag)

print("maybe1-----------")
Maybe<String>.just("hihi")
    .subscribe(onSuccess: {
        print($0)
    },
               onError: {
        print($0)
    },
               onCompleted: {
        print("com")
    },
               onDisposed: {
        print("dis")
    }).disposed(by: disposeBag)

print("maybe2--------------------")

Observable<String>.create { observer -> Disposable in
    observer.onError(TraitsError.maybe)
    return Disposables.create()
}
//maybe로 만들어준다.
.asMaybe()
    .subscribe(onSuccess: {
        print($0)
    },
               onError: {
        print($0)
    },
               onCompleted: {
        print("com")
    },
               onDisposed: {
        print("dis")
    }).disposed(by: disposeBag)

print("completable---------------")

Completable.create { observer -> Disposable in
//    observer(.completed)
    observer(.error(TraitsError.completable))
    return Disposables.create()
}
.subscribe(onCompleted: {
    print("com")
},
           onError: {
    print($0)
},
           onDisposed: {
    print("dis")
})
