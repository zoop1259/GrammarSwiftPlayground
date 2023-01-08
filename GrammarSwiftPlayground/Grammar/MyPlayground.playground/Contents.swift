import Foundation
import UIKit

//if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.24.1/data/ko_KR/champion.json") {
//    var request = URLRequest.init(url:  url)
//
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//        guard let data = data else { return }
//
//        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//            if let data = json["data"] as? String {
//                print(data)
//
//            }
//        }
//    }.resume()
//}

let task = URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/11.24.1/data/ko_KR/champion.json")!) { data, response, error in
    if let dataJson = data {
        do {
            let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! [String:Any]
            //print(json)
            let datas = json
            
            var nameArr = [String]()
            
            if let chamname = datas["Aatrox"] as? [String:Any] {
                for (_, index) in chamname {
                    print(index)
                }
            }
            
            
        }
        catch {}
    }
}
task.resume()
