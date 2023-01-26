/*:
 [< Previous](@previous)           [Home](Introduction)
 
 ## Date Calculations
 
 */
import Foundation

let now = Date()
let calendar = Calendar.current
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .medium
dateFormatter.locale = Locale(identifier: "ko")

func printFormatted(name:String, date: Date) {
    print("\(name) - \(dateFormatter.string(from: date))")
}

code(for: "Later") {
    // https://useyourloaf.com/blog/fun-with-date-calculations/
    printFormatted(name: "현재", date: now)
    let oneHourFromNow = Date(timeInterval: 60 * 60, since: now)
    printFormatted(name: "한시간후", date: oneHourFromNow)
    //이건 현재시간을 기준으로 1시간을 쉽게 구할 수 있다.
    let oneHourInterval = Date(timeIntervalSinceNow: 60 * 60)
    printFormatted(name: "현재부터한시간후", date: oneHourInterval)
    
}

code(for: "A long time away") {
    //0001/01/01 은 토요일이네
    let distantPast = Date.distantPast
    //미래? 4001/1/1은 월요일이네
    let distantFuture = Date.distantFuture
    printFormatted(name: "distantPast", date: distantPast)
    printFormatted(name: "distantFuture", date: distantFuture)
}

code(for: "Start of Day") {
    printFormatted(name: "now", date: now)
    let startOfToday = calendar.startOfDay(for: now) //현재를 기준
    printFormatted(name: "시작날", date: startOfToday) //흠... 왜 오전12시가 시작이지. 00시가 아니라? 아.. 점심은 오후 12시로 표시되는구나.
}


code(for: "Next Monday at 9 am") {
    var nextMondayCompoenets = DateComponents()
    nextMondayCompoenets.weekday = 2
    nextMondayCompoenets.hour = 9
    let nextMonday = calendar.nextDate(after: now,
                                       matching: nextMondayCompoenets,
                                       matchingPolicy: .nextTime)
    printFormatted(name: "다음주월요일 9시!", date: nextMonday!)
}

code(for: "Next Week at noon") {
    var nowComponents = calendar.dateComponents([.day, .month, .year], from: now)
    nowComponents.hour = 12
    let nextMonth = calendar.date(bySetting: .day, value: 7, of: calendar.date(from: nowComponents)!)
    printFormatted(name: "다음달 7일?", date: nextMonth!)
    let nextWeek = calendar.date(byAdding: .day, value: 7, to: calendar.date(from: nowComponents)!)
    printFormatted(name: "다음주?", date: nextWeek!)
    
}

code(for: "Days til Christmas") {
    // https://sarunw.com/posts/getting-number-of-days-between-two-dates/
   //지금부터 크리스마스의 dday는?
    var christmasComponents = DateComponents()
    christmasComponents.day = 25
    christmasComponents.month = 12
    christmasComponents.year = 2023
    let christmas = calendar.date(from: christmasComponents)!
    //startOfday를 사용하여 now를 표현하지않고 그냥 now로 하면 당일을 무시하여 계산하기 떄문에 하루가 빠진다.
    let numberOfDaysTilChristmas = calendar.dateComponents([.day], from: calendar.startOfDay(for: now), to: christmas)
    print(numberOfDaysTilChristmas.day)
    
}
//: [< Previous](@previous)           [Home](Introduction)
