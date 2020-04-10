import Foundation

struct Achievements:Response {
    var success: Bool
    var status: Int
    var _id:String
    var overview:OverView
    var achievements:[Achievement]
}

struct Achievements2:Codable {
    var success: Bool
    var status: Int
    var _id:String
    var overview:OverView
    var achievements:[Achievement]
}

struct Achievement:Codable {
    var id:Int
    var level:String
    var progress:Int
    var total:Int
    var bg_image_url:String
    var accessible:Bool
}

struct OverView:Codable {
    var title:String
}



