import Foundation

public protocol Mockable {
    //우리가 원하는 데이터의 목표배열이나 리소스배열 일 수 있다.
    //자리표시자를 사용하여 추가한다.
    associatedtype Element
    static var mockData: [Element] { get }
}
