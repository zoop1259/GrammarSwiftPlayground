/*:
 [< Previous](@previous)           [Home](Introduction)

 ## Practical Uses
*/
import Foundation

// This function is used for example 1 below
func countryInfo(name: String, population: Int, states: Int) {
    print("\(name) has \(population) people in \(states) states.")
}

// This dictionary is used for examples 2, 3 and 4 below
let countryDictionary: [String: Int] = [
    "Canada" : 37_000_000,
    "United States" : 332_278_000,
    "United Kingdom" : 67_886_000,
    "Japan" : 125_440_000,
    "Germany" : 83_190_000,
]

code(for: "1. Parameters in Functions") {
    // convert the countryInfo array in to one that will use a tuple for a parameter
    func countryInfo(_ country: (name: String, population: Int, states: Int)) {
        print("\(country.name) has \(country.population) people in \(country.states) states.")
    }
   countryInfo((name: "Canada", population: 37_000_000, states: 10))
}

code(for: "2. Returning Tuples") {
    // use the CountryDictionary to create a function that will return a tuple when provided the name of the country
    func countryInfo(_ name: String) -> (name: String, population: Int?) {
        return (name: name, population: countryDictionary[name])
    }
    //옵셔널값이나 nil을 볼 수 있다.
    print(countryInfo("Canada"))
    print(countryInfo("Ukraine"))
}

code(for: "3. TypeAleas") {
    // use a typeAlias to recreate the countryInfo function
    
    //옵셔널선언
    typealias countryData = (name: String, population: Int?)
    func countryInfo(_ name: String) -> countryData {
        return (name: name, population: countryDictionary[name])
    }
    
    //언래핑하여 프린트(값이 없으면 언노운)
    print(countryInfo("Canada"))
    let us = countryInfo("United States")
    print(us.population ?? "unknown")
    let uk = countryInfo("Ukraine")
    print(uk.population ?? "unknown")
}

code(for: "4. Covert Dictionary to Array of tuples") {
    // Map the CountryDictionary into an array of tuples
    
    //딕셔너리를 튜플형식으로 매핑.
    let countryArray = countryDictionary.map {(name: $0, population: $1)}
        .sorted { $0.name < $1.name}
    for country in countryArray {
        print(country.name)
    }
}

code(for: "5. Sorting with Tuples") {
    // see also https://youtu.be/4ochXtdrd70
    // Use the Wine model and the allWines static array (found in the Sources folder for the playground)
    // To sort wines using multiple criteria
    
    //여러개를 동시에 정렬하는 경우 왼쪽부터 우선정렬된다. variety기준으로 정렬한후에 winery정렬하고 vintage 정렬한다.
    let allWines = Wine.wines
    let sortedWines = allWines.sorted {($0.variety, $0.winery, $0.vintage) < ($1.variety, $1.winery, $1.vintage)}
    for wine in allWines {
        print(wine.winery, wine.variety, wine.vintage)
    }
    print("------------------------------------")
    for wine in sortedWines {
        print(wine.winery, wine.variety, wine.vintage)
    }
    
}
/*:

 [< Previous](@previous)           [Home](Introduction)
 */
