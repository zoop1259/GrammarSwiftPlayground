/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Dates To Strings
 A Date value encapsulate a single point in time, independent of any particular calendrical system or time zone. Date values represent a *time interval relative to an absolute reference date.*
 The Date structure provides methods for comparing dates, calculating the time interval between two dates, and creating a new date from a time interval relative to another date. Use date values in conjunction with **DateFormatter** instances to create localized representations of dates and times and with **Calendar** instances to perform calendar arithmetic.

*/
/*
 날짜 값은 특정 달력 시스템 또는 표준 시간대에 관계없이 단일 시점을 캡슐화합니다.
 날짜 값은 절대 기준 날짜에 상대적인 시간 간격을 나타냅니다.
 날짜 구조는 날짜를 비교하고, 두 날짜 사이의 시간 간격을 계산하고, 다른 날짜와 관련된 시간 간격에서 새 날짜를 만드는 방법을 제공합니다.
 날짜 값을 DateFormatter 인스턴스와 함께 사용하여 날짜 및 시간의 지역화된 표현을 만들고 달력 계산을 수행할 달력 인스턴스와 함께 사용합니다.
 */
import Foundation

let now = Date()

code(for: "DateFormatter DateStyles and TimeStyles") {
    print(now) //우리나라에선 -9시 로 출력된다.
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .full //이건 년월일만 나온다. full로 한다한들...
    dateFormatter.timeStyle = .full //그래서 이렇게 시간스타일을 정해줘야한다.
    print(dateFormatter.string(from: now))
}

code(for: "DateFormatter DateStyles + Locale") {
//    print(Locale.availableIdentifiers) //우리가 사용하게 될 국가의 코드들을 알아볼 수 있다.
    //print(Locale.commonISOCurrencyCodes)
    let dateFromatter = DateFormatter()
    dateFromatter.locale = Locale(identifier: "ko") //국가 코드를 지정하고
//    dateFromatter.dateStyle = .full
//    dateFromatter.timeStyle = .full
//    print(dateFromatter.string(from: now)) //현재를 기준으로 포맷을 시킨다. 일본 표준시네
    //린치가 만들어 놓은 함수로 각 날짜스타일을 한번에 보고 싶다.
    for dateStyle in DateFormatterStyleEnums.styles {
        dateFromatter.dateStyle = dateStyle
        print("\(dateStyle.description) - \(dateFromatter.string(from: now))")
    }
}

code(for: "DateFormatter TimeStyles + Locale") {
    let dateFromatter = DateFormatter()
    //이건 타임스타일
    //위에서 한번 ko를 설정해줬기 때문에 시간은 그대로 한국시간인데 일본표준시가 아닌 japan standard time으로 뜬다.
    for timeStyle in DateFormatterStyleEnums.styles {
        dateFromatter.timeStyle = timeStyle
        print("\(timeStyle.description) - \(dateFromatter.string(from: now))")
    }
}

code(for: "Time Zones") {
    let dateFromatter = DateFormatter()
    dateFromatter.dateStyle = .long
    dateFromatter.timeStyle = .long
//    print(TimeZone.knownTimeZoneIdentifiers) //타임존의 모든 나라 코드를 알 수 있다.
//    dateFromatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
    
//    print(TimeZone.abbreviationDictionary) // 시간이 같은 나라를 딕셔너리 형태로 묶어제공해줘서 좀 더 코드를 간략하게 하여 국가를 줄여서 코딩할 수 있는 방법이다.
    dateFromatter.timeZone = TimeZone(abbreviation: "JST")
    
    print(dateFromatter.string(from: now))
}

code(for: "DateFormatter DateFormat") {
    //아래는 포맷형식에 대한 사이트이다.
    // https://www.datetimeformatter.com/how-to-format-date-time-in-swift/
    // 내가 얻고자 하는 포맷형식에 대해서 알기 쉽게 알려주는 사이트
    // https://nsdateformatter.com

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM d, yyyy - hh:mm:ss a zzz"
    print(dateFormatter.string(from: now))
    
}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
