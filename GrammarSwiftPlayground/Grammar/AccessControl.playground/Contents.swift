import UIKit

//My Framework 파일에 옮겨서 권한 공부한다.
//struct Product {
//    let name: String
//    let price: Double
//}
//
//class Purchases {
//    //구조체를 담아 빈배열로 선언한다.
//    var products: [Product] = []
//    //그리고 계산하는 함수를 만들어준다.
//    func calculatePrice() -> Double {
//        products.reduce(0) { $0 + $1.price }
//    }
//}

//다 주석처리하고 한단계씩 공부한다.
//상수에 클래스를 담고
//let newCustomer = Purchases()
////클래스안에 있는 프로덕트에 값을 집어넣어준다.
//newCustomer.products = [
//    Product(name: "Mac", price: 5999),
//    Product(name: "Mac Air", price: 4999)
//]
////mac과 mac air의 price를 더한값을 반환.
//let totalPrice = newCustomer.calculatePrice()


//let newCustomer = Product //단순 사용 불가

let newCustomer = Purchases()
//1-2. 1-1후 클래스 내에서 사용 할 수 있게됐기 떄문에 주석처리
//newCustomer.products = [
//    Product(name: "mac", price: 5999),
//    Product(name: "mac air", price: 4999)
//
//]

//1-3. 새로 생성
newCustomer.newPurchase(name: "mac", price: 5999)
newCustomer.newPurchase(name: "mac air", price: 4999)

let totalPriace = newCustomer.calculatePrice()

newCustomer.products[0].name
//newCustomer.products[0].price
//3. 2번후에는 이렇게 price가 아닌 구조체 내의 purchasePrice를 사용해야 한다.
newCustomer.products[0].purchasePrice

class Discount: Purchases { //(1). 이렇게 바로 사용시에는 다른 모듈이 open급이여야 한다.
 
    var age: Int
    var discount: Double {
        age > 55 ? 10 : 0
        //55살 이상이면 할인
    }
    init(age: Int) {
        self.age = age
        super.init()
    }
    
    //함수의 속성 변경을 위해 override사용
    //(3). 함수도 open으로 만들어놔야 override가능.
    override func calculatePrice() -> Double {
        super.calculatePrice() * (1 - discount / 100)
    }
}

let newCustomer2 = Discount(age: 65)
newCustomer2.newPurchase(name: "mac", price: 5999)
newCustomer2.newPurchase(name: "mac air", price: 4999)

let totalPrice2 = newCustomer2.calculatePrice()

