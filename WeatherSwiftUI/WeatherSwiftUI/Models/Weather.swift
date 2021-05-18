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
}
