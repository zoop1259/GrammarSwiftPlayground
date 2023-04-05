import UIKit


var get = 0

func sample1() -> Void {
    get = 5
}
func sample2() {
    get = 10
}

print(type(of: sample1()))
print(type(of: sample2()))

func sample3() {
    //에러발생 리턴값이 없으면 리턴X
//    return 0
}

func sample4() -> () {
//    return {
//        print("asd")
//    }
}

func sample5() -> () -> Void {
    return {
        print("asd")
    }
}

func voidGet(_ void: Int) -> Void {
    get = 55
}
voidGet(5)
print(get)

func retGet() -> Int {
    return 10
}
print(get)

                        //Void 생략
func car(_ some: String) -> String {
    print(some)
    return some
}

@discardableResult func cars(well: String) -> String {
    return well
}

//Double타입의 값을 반환하고, 이 값을 변수나 상수에 할당할 수 있다.
func returnDouble() -> Double {
    return 2.0
}

//이건 안된다?
func returnDoubleAndVoid(_: Double) -> Void {
    2.0
}
