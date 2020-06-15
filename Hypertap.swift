import Foundation

struct HypertapAttribution : Codable {
    let linkID : String
    let channel : String
    
    enum CodingKeys: String, CodingKey {
        case linkID = "link_id"
        case channel
    }
}

class Hyper : NSObject {
    @objc static func tap(_ completion: @escaping (String, String)->()) {
        guard let url = URL(string: "https://hypertap.co/lookup") else {
           return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            
            guard let res = try? JSONDecoder().decode(HypertapAttribution.self, from: data) else {
                return
            }
            
            guard res.linkID != "" else { return }
            completion(res.linkID, res.channel)
        }.resume()
    }
}
