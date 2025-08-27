//
//  User.swift
//  CFAPI
//
//  Created by Alumno on 27/08/25.
//

import Foundation

// Codeforces API for user.info method returns a list of user objects with these fields
struct User : Identifiable, Codable, Hashable {
    var id = UUID()
    var handle : String
    var email : String?
    var vkId : String?
    var openId : String?
    var firstName : String?
    var lastName : String?
    var country : String?
    var city : String?
    var organization : String?
    var contribution : Int
    var rank : String
    var rating : Int
    var maxRank : String
    var maxRating : Int
    var lastOnlineTimeSeconds : Int
    var registrationTimeSeconds : Int
    var friendOfCount : Int
    var avatar : String
    var titlePhoto : String
    
    enum CodingKeys : String, CodingKey {
        case handle
        case email
        case vkId
        case openId
        case firstName
        case lastName
        case country
        case city
        case organization
        case contribution
        case rank
        case rating
        case maxRank
        case maxRating
        case lastOnlineTimeSeconds
        case registrationTimeSeconds
        case friendOfCount
        case avatar
        case titlePhoto
    }
}
