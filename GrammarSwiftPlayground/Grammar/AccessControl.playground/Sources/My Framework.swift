import Foundation
//프로젝트와는 다르게 다른 모듈이므로 권한을 public시켜줘야한다.
public struct Product {
    //상수에 접근하고 싶으면 public 을 써줘야 한다.
    public let name: String
//    public let price: Double
    
    //이렇게하면 비공개적으로 값을 사용할 수 있지만
    //1. 개별적으로 접근이 불가능하게 된다.
    private(set) var price: Double
    
    //외부에서 사용할 때 값을 넣어줄수 있게 public init사용
    public init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    //2. 개별적으로 사용 가능하게 하는 또 다른 방법은.
    public var purchasePrice: Double {
        price
    }
}

//class Purchases {
//public class Purchases {
open class Purchases { //(2). (1)사용을 위해 open
    //구조체를 담아 빈배열로 선언한다.
    //이것도 public해줘야한다.
    public var products: [Product] = []
    
    //공개적으로 내부를 초기화 시켜야 사용가능하다.
    public init() {}
    
    //그리고 계산하는 함수를 만들어준다.
    //이것도 public
    //(4). (3)을 위해 open
    open func calculatePrice() -> Double {
        products.reduce(0) { $0 + $1.price }
    }
    
    //1-1. 클래스에서도 사용 할 수 있게 함수생성
    public func newPurchase(name: String, price: Double) {
        let newProduct = Product(name: name, price: price)
        products.append(newProduct)
    }
    
}


