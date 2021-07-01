//
//  MoviePersonResponse.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 21/5/21.
//

import Foundation

//
//  MoviePersonResponse.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 21, 2021

import Foundation

struct MoviePersonResponse : Codable {
    let adult : Bool?
    let also_known_as : [String]?
    let biography : String?
    let birthday : String?
    let deathday : String?
    let gender : Int?
    let homepage : String?
    let id : Int?
    let imdb_id : String?
    let known_for_department : String?
    let name : String?
    let place_of_birth : String?
    let popularity : Double?
    let profile_path : String?

    enum CodingKeys: String, CodingKey {

        case adult = "adult"
        case also_known_as = "also_known_as"
        case biography = "biography"
        case birthday = "birthday"
        case deathday = "deathday"
        case gender = "gender"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case known_for_department = "known_for_department"
        case name = "name"
        case place_of_birth = "place_of_birth"
        case popularity = "popularity"
        case profile_path = "profile_path"
    }
}
