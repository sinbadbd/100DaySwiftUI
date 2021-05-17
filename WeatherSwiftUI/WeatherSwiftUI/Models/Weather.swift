//
//  Weather.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 17, 2021

import Foundation

struct Weather : Codable {

        let descriptionField : String?
        let icon : String?
        let id : Int?
        let main : String?

        enum CodingKeys: String, CodingKey {
                case descriptionField = "description"
                case icon = "icon"
                case id = "id"
                case main = "main"
        }
    
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
//                icon = try values.decodeIfPresent(String.self, forKey: .icon)
//                id = try values.decodeIfPresent(Int.self, forKey: .id)
//                main = try values.decodeIfPresent(String.self, forKey: .main)
//        }

}
