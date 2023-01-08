//
//  Goal.swift
//  MyGoals
//
//  Created by Stewart Lynch on 2021-02-14.
//
import Foundation

//본문엔 name을 통해 sort를 하였지만 id나 date 또는 completed를 사용하면 정렬되지 않는다.
//그러니 우리가 할 수 있는 일에 저장하기에 좋은 속성이 아니다.
//그래서 사용해야하는것은 Comparable이다. 전체를 묶어주는것?
//그리고 내가 기준으로 정렬할것을 정해서 적어준다.
public struct Goal: Codable, Comparable {
    public static func < (lhs: Goal, rhs: Goal) -> Bool {
        lhs.name < rhs.name
    }
    
   public var id = UUID().uuidString
   public var name: String
   public var date: Date
   public var completed: Bool = false

}


extension Goal: Mockable {
    public static var mockData: [Goal] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return [
            Goal.init(name: "Be more active on Twitter", date: dateFormatter.date(from: "01/01/2021")!, completed: true),
            Goal.init(name: "Reach 100 Videos on YouTube",date: dateFormatter.date(from: "01/03/2021")!, completed: true),
            Goal.init(name: "Create a new Widget App",date: dateFormatter.date(from: "01/06/2021")!, completed: false),
            Goal.init(name: "Update Website", date: dateFormatter.date(from: "01/09/2021")!, completed: true)
        ]
    }
}

