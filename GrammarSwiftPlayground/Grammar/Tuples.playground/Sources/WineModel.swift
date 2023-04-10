import Foundation

public struct Wine {
    public let variety: String
    public let winery: String
    public let vintage: Int
    

    public static var wines: [Wine] {
        [
            Wine(variety: "Chardonnay", winery: "Sumac Ridge", vintage: 2017),
            Wine(variety: "Chardonnay", winery: "50th Parallel", vintage: 2016),
            Wine(variety: "Malbec", winery: "Ancient Hill", vintage: 2018),
            Wine(variety: "Merlot", winery: "Sumac Ridge", vintage: 2016),
            Wine(variety: "Pinot Gris", winery: "Ancient Hill", vintage: 2017),
            Wine(variety: "Chablis", winery: "Beringer", vintage: 2016),
            Wine(variety: "Chardonnay", winery: "Josh Cellars", vintage: 2017),
            Wine(variety: "Chardonnay", winery: "Kendall Jackson", vintage: 2016),
            Wine(variety: "Sauvignon Blanc", winery: "Kendal Jackson", vintage: 2015),
            Wine(variety: "Merlot", winery: "Josh Cellars", vintage: 2018),
            Wine(variety: "Chardonnay", winery: "Beringer", vintage: 2017),
            Wine(variety: "Chardonnay", winery: "Lindeman's", vintage: 2019),
            Wine(variety: "Chardonnay", winery: "George Wyndham", vintage: 2018),
            Wine(variety: "Chardonnay", winery: "Lindeman's", vintage: 2016),
            Wine(variety: "Shiraz", winery: "Rosemount", vintage: 2017),
            Wine(variety: "Merlot", winery: "George Wyndham", vintage: 2015),
            Wine(variety: "Chardonnay", winery: "Lindeman's", vintage: 2018),
            Wine(variety: "Merlot", winery: "50th Parallel", vintage: 2017),
        ]
    }
}
