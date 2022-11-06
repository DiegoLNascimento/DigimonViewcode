//
//  CellController.swift
//  digimonViewcode
//
//  Created by diego on 05/06/22.
//

import UIKit

class CellController: NSObject {
    
    var detailCell: DigimonElement?
    
    
    func cellTreated(digimons: DigimonElement?) {
        self.detailCell = digimons
        
      }
    
    var imageCell:String {
        return detailCell?.img ?? ""
    }
    
    var titleCell: String {
        return detailCell?.name ?? ""
    }
}
