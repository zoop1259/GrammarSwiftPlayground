/*:
 [< Previous](@previous)           [Home](Introduction)
 
 ## Floating Point Precision in Strings
 
 */
import Foundation

code(for: "Formatted Doubles") {
    //각 포맷하는 방법이 적힌 공식 문서
    //https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
    let portion:Double = 245/3
    print(portion) //제대로 나눠지지 않으면 그지같이 표현됨
    
    let amountOwing = String(format: "₩%f", portion) //앞에 ₩를 붙여주고 다음에 포매팅한다. 그러나 반복소수점은 제거되지 않았다.
    print(amountOwing)
    
    let amountOwing2 = String(format: "₩%.2f", portion) //.2를 사용해주어 해결한다.
    print(amountOwing2)
    
    
}

code(for: "Hex") {
    let number = 255
    let hex = String(format: "\(number) - hex: %X", number) //16진수로 만들기.
    print(hex)
}

code(for: "Color") {
    //컬러색 알아내기.
    // What is the hex value for a colour that is red:120/255, green 255/255 abd blue 125/255?
    let hexColor = String(format: "%X%X%X", 120, 255, 125)
    print(hexColor)
}
//: [< Previous](@previous)           [Home](Introduction)
