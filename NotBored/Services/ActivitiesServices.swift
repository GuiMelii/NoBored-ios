import Foundation
import Alamofire

final class ActivitiesService {
    
    let apiClient = AlamofireAPIClient()
    
    func getActivities(category: String, participants: Int?, completion: @escaping (Activity?) -> Void) {
        let finalActivityUrl = getActivitiesUrl("http://www.boredapi.com/api/activity", category, participants)
        
        apiClient.get(url: finalActivityUrl) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let activity = try JSONDecoder().decode(Activity.self, from: data)
                        completion(activity)
                    }
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    func getActivitiesUrl(_ url: String,_ category: String,_ participants: Int?) -> String {
        var auxUrl = url
        let lowerCaseCategory = category.lowercased()
        if category != "Random", let participants = participants {
        auxUrl += "?type=\(lowerCaseCategory)&participants=\(participants)"
        } else if category == "Random", let participants = participants {
            auxUrl += "?participants=\(participants)"
        } else if category != "Random" {
            auxUrl += "?type=\(lowerCaseCategory)"
        }
        
        return auxUrl
    }
}

