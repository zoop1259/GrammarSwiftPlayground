/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## The Basics
What are generics and how can I use them?

*/
import Foundation
code(for: "Add Example 1") {
    func add(_ num1: Int, _ num2: Int) {
        print(num1 + num2)
    }
    
    add(15, 17)
//    add(12.4, 15.2) //Int로 선언했기떄문에 에러가 발생한다.
}

code(for: "Add Example 2 - Generics") {
    //아래처럼 사용하면 RangeReplaceableColeection을 준수하지 않았다는 에러가 뜨면서 +를 사용하지 못하게 된다.
    //func add<T>(_ num:1 T, _ num2: T) {
    //그래서 단순한 연산이 가능한 Numeric이라는 내장형 프로토콜로 제네릭 선언.
    /*
     Numeric -> 곱셈을 지원하는 값이 있는 유형.
     
     각 요소에 2를 곱하게 만든다.
     extension Sequence where Element: Numeric {
        func doubling() -> [Element] {
            return map { $0 * 2 }
        }
     }
     let a = [ 1.5, 3.0 ]
     let aresult =  a.doubling()
     //[3.0, 6.0]
     */
    func add<T: Numeric>(_ num1: T, _ num2: T) {
        print(num1 + num2)
    }
    add(15, 17)
    add(12.4, 15.2)
//    add("Stewart", "Lynch") // local function 'add' requires that 'String' comform to 'Numeric'
    //add를 사용하려면 String이 숫자에 적합해야 한다. 라고 되어있다.
}

code(for: "Add Example 3 - Stings and Arrays") {
    //RangeReplaceableCollection를 사용하여 보다 유연하게.
    // 두 개의 문자열 또는 두 개의 원시 유형 배열을 수용하여 함께 결합하는 함수 만들기
    func add<T: RangeReplaceableCollection>(_ arg1: T, _ arg2: T) {
        print(arg1 + arg2)
    }
    add("Stewart", "Lynch")
    add([1,2,3], [4,5,6])
}

code(for: "Add Example 4 - Variatic parameters(변수 매개변수?)") {
    // Create a function that will accept any number of numeric values and print the sum
    //임의의 수의 숫자 값을 허용하고 합계를 인쇄하는 함수 만들기

    func add<T: Numeric>( _ numbers: T...) {
        print(numbers.reduce(0, +))
    }
    add(1, 2, 3, 4, 5, 6)
}

code(for: "Add Example 4 - All together Now") {
    // Can you have two functions with the same name in the same scope?
    func add<T: Numeric>(_ num1: T, _ num2: T) {
        print(num1 + num2)
    }
    
    func add<T: Numeric>( _ numbers: T...) {
        print(numbers.reduce(0, +))
    }
    

}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
