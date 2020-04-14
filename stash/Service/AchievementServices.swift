import Foundation

class AchievementServices {
    
    func getAchievements(parameters: [String: Any], completion: @escaping (Achievements?, Error?) -> ()) {
        // api
        let api = AchievementsAPI()
        // api loader
        let apiRequestLoader = APILoader(apiRequest: api)
        
        apiRequestLoader.loadAPIRequest(requestData: parameters) { (result, error) in
            completion(result, error)
        }
    }
}


