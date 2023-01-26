/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## Strings to Dates
 
 */
import Foundation
//강의에선 독일시간을 기준으로 하는데 나중엔 내가 한국시간으로 바꾸지 뭐.
let now = Date()
let calendar = Calendar.current

code(for: "String to Date") {
    let sampleDataString = "20.01.23"
    let dataFormatter = DateFormatter()
    dataFormatter.dateStyle = .short
//    dataFormatter.locale = Locale(identifier: "en") //en, ko 따위는 없다?
    dataFormatter.locale = Locale(identifier: "de")
    print(dataFormatter.date(from: sampleDataString))
}

code(for: "DateComponents") {
//    let christmascComponents = DateComponents(calendar: calendar,
//                                              timeZone: <#T##TimeZone?#>,
//                                              era: <#T##Int?#>,
//                                              year: <#T##Int?#>,
//                                              month: <#T##Int?#>,
//                                              day: <#T##Int?#>,
//                                              hour: <#T##Int?#>,
//                                              minute: <#T##Int?#>,
//                                              second: <#T##Int?#>,
//                                              nanosecond: <#T##Int?#>,
//                                              weekday: <#T##Int?#>,
//                                              weekdayOrdinal: <#T##Int?#>,
//                                              quarter: <#T##Int?#>,
//                                              weekOfMonth: <#T##Int?#>,
//                                              weekOfYear: <#T##Int?#>,
//                                              yearForWeekOfYear: <#T##Int?#>)
    var christmasComponents = DateComponents()
    christmasComponents.calendar = calendar
    christmasComponents.month = 12
    christmasComponents.day = 25
    christmasComponents.year = 2025
    
    let christmas = calendar.date(from: christmasComponents)
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .full
    dateFormatter.timeStyle = .full
    print(dateFormatter.string(from: christmas!)) //여긴 옵셔널값으로 불러올 수 없기 떄문에 강제언래핑.
}

code(for: "Family Day in 2025") {
    var familyDayComponents = DateComponents()
    familyDayComponents.calendar = calendar
    familyDayComponents.year = 2025
    familyDayComponents.month = 2
    familyDayComponents.weekday = 2
    familyDayComponents.weekdayOrdinal = 3 //3번쨰 2일?
    let familyDay = calendar.date(from: familyDayComponents)
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .full
    dateFormatter.timeStyle = .full
    print(dateFormatter.string(from: familyDay!)) //여긴 옵셔널값으로 불러올 수 없기 떄문에 강제언래핑.
    
}

/*:
 [< Previous](@previous)           [Home](Introduction)            [Next >](@next)
 */
