//
//  UserResponse.swift
//  CFAPI
//
//  Created by Alumno on 27/08/25.
//

import Foundation

// the Codeforces API with user.info method returns a JSON with two fields:
//  status: "OK" or "FAILED"
//  comment: only present if failed. contains the error
//  result: list of user objectsm, only if status is "OK"
struct UserResponse : Identifiable, Decodable, Hashable {
    var id = UUID()
    var status : String
    var comment : String?
    var result : [User]?
    
    enum CodingKeys : String, CodingKey {
        case status
        case comment
        case result
    }
}
