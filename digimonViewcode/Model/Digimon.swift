//// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let digimon = try? newJSONDecoder().decode(Digimon.self, from: jsonData)

import Foundation

// MARK: - DigimonElement
struct DigimonElement: Codable {
    let name: String?
    let img: String?
    let level: Level?
}

enum Level: String, Codable {
    case armor = "Armor"
    case champion = "Champion"
    case fresh = "Fresh"
    case inTraining = "In Training"
    case mega = "Mega"
    case rookie = "Rookie"
    case training = "Training"
    case ultimate = "Ultimate"
}

typealias Digimon = [DigimonElement]

