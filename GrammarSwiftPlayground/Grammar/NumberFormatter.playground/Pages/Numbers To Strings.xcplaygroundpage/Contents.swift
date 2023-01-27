/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Numbers To Strings
 ### NumberFormatter, numberStyle, Locale
 A formatter that converts between numeric values and their textual representations.

*/
import Foundation

let number = 1234.5678
let numberFormatter = NumberFormatter()

code(for: "NumberFormatter numberStyles") {
    print(number)
    numberFormatter.numberStyle = .currency
//    numberFormatter.numberStyle = .spellOut //숫자를 읽어줌
    let numberString = numberFormatter.string(for: number) //절대 string(from:) 을 사용하지 않는다.
    print(numberString ?? "숫자가 아님..") //셋째자리에서 반올림되는듯.

}

code(for: "NumberFormatter numberStyles + Locale") {
    // https://gist.github.com/jacobbubu/1836273 //국가별 통화 코드 정리된 깃헙.
    print(Locale.current) //이렇게만하면 en_US가 된다. 난 ko_KR을 써야한다.
//    print(Locale.availableIdentifiers) //모든 국가 통화 목록 프린팅
    let locale = Locale(identifier: "ko_KR")
    numberFormatter.locale = locale
//    numberFormatter.numberStyle = .currency
    numberFormatter.numberStyle = .spellOut //숫자를 읽어줌
    let numberString = numberFormatter.string(for: number)
    print(numberString ?? "숫자가 아님..")
    printAllFormats(for: number, localeIdentifier: "ko_KR") //내가 원하는 형태의 금액을 찾아 사용하기 좋다.
    printAllFormats(for: number, localeIdentifier: "fr_CA")
}

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
