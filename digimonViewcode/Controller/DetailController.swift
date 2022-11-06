//
//  DetailController.swift
//  digimonViewcode
//
//  Created by diego on 02/06/22.
//

import UIKit
import SDWebImage

class DetailController: NSObject {
    var detailDigimon: DigimonElement?
    
    
    var imageTreated: String {
        return detailDigimon?.img ?? ""
    }
    
    var titleTreated: String {
        return detailDigimon?.name ?? ""
    }
    
    var descriptionTreated: String {
        return detailDigimon?.level?.rawValue ?? ""
 }
    func detailTreated(digimons: DigimonElement) {
        self.detailDigimon = digimons
    }
}
