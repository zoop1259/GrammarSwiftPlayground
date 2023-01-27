/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## Rounding and Significant Digits
 
 */
import Foundation

let number = 1234.5678
let numbers = [1234456.567, 112, 0.235, 12456.3, 213456, 789.12]

code(for: "Significant Digits") {
    let numberFormatter = NumberFormatter()
    numberFormatter.usesSignificantDigits = true //베이스 소수점 두자리 반올림
//    numberFormatter.maximumSignificantDigits = 2 //소수점 자리수가 아닌듯..
//    numberFormatter.minimumSignificantDigits = 10 //최소 소수점 두자릿수까진 ...
    //--------------------------------------------
//    let numberString = numberFormatter.string(for: number)
//    print(number)
//    print(numberString ?? "이상한 숫자") //소수점 이하 두 자리로 반올림
    

        numberFormatter.maximumSignificantDigits = 6 //소수점 자리수가 아닌듯..
        numberFormatter.minimumSignificantDigits = 6 //최소 소수점 두자릿수까진 ...
    for number in numbers {
        let numberString = numberFormatter.string(for: number)
        print("\(number) -> \(numberString ?? "이상한 숫자")")
    }
}

code(for: "Integer and FractionDigits") {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumIntegerDigits = 10 //가장 가까운 정수로 반올림 한다. 만약 정해진 수보다 작은 수면 앞에 0 을 넣어준다.
    numberFormatter.minimumFractionDigits = 2 //최소 소수점 자리수 보장 부족하면 0으로 채워줌.
    numberFormatter.maximumIntegerDigits = 3 //숫자가 왼쪽을 기준으로 잘린다.
    //--------------------------------------------
    for number in numbers {
        let numberString = numberFormatter.string(for: number)
        print("\(number) -> \(numberString ?? "이상한 숫자")")
    }
}

code(for: "Rounding Behaviour - Whole numbers") {
    let numbers = [1234.5, 1234.4, 1234.6] //123'4' 기 떄문에 1234
    let numbers2 = [1235.5, 1235.4, 1235.6] //123'5'기 떄문에 1236 이 이유는 기본 속성이 halfEven이기 때문이다.
    let numberFormatter = NumberFormatter()
    numberFormatter.roundingMode = .ceiling //celling은 올림이다.
    //--------------------------------------------
    for number in numbers {
        let numberString = numberFormatter.string(for: number)
        print("\(number) -> \(numberString ?? "이상한 숫자")")
    }
    print("------------------------------------")
    for number in numbers2 {
        let numberString = numberFormatter.string(for: number)
        print("\(number) -> \(numberString ?? "이상한 숫자")")
    }
}

code(for: "Rounding Behaviour - Fractional numbers") {
    let numbers = [0.243, 0.245, 0.246, 0.235]
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 2 //반올림.
    /* 위까지만하면 결과가 아래처럼 이상하다.
     0.243 -> 0.24
     0.245 -> 0.24 //여긴 반올림이 안됨. 왜?
     0.246 -> 0.25
     0.235 -> 0.24 //여긴 반올림이 됨. 왜?
     */
    
    numberFormatter.roundingMode = .ceiling //이것도 올림.
    
    //--------------------------------------------
    for number in numbers {
        let numberString = numberFormatter.string(for: number)
        print("\(number) -> \(numberString ?? "이상한 숫자")")
    }
    
}
/*:
 [< Previous](@previous)           [Home](Introduction)            [Next >](@next)
 */
