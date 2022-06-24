import Foundation
import Alamofire

final class ActivitiesService {
    
    let apiClient = AlamofireAPIClient()
    
    func getActivities(category: String, participants: Int, completion: @escaping (Activity?) -> Void) {
        var activitiesURL = "http://www.boredapi.com/api/activity"
        
        let lowerCaseCategory = category.lowercased()
        if category != "Random" {
            activitiesURL += "?type=\(lowerCaseCategory)&participants=\(participants)"
        } else {
            activitiesURL += "?participants=\(participants)"
        }
        
        print(activitiesURL)
        apiClient.get(url: activitiesURL) { response in
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
}

