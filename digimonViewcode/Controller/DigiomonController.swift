//
//  DigiomonController.swift
//  digimonViewcode
//
//  Created by diego on 02/06/22.
//

import UIKit

class DigiomonController: NSObject {
    var digiElements: DigimonElement?
    var digimon: Digimon?
    let requetDigi = Request()
    
    func numberOfItemsInSection() -> Int {
        return digimon?.count ?? 0
    }
    
    func getIndexDigimon(indexPath: IndexPath) -> DigimonElement? {
        return digimon?[indexPath.row]
    }
    
    var imageCell: String {
        return digiElements?.img ?? ""
    }
    var titileCell: String {
        return digiElements?.name ?? ""
    }
    

    func request(completion: @escaping(Bool) -> Void) {
        requetDigi.request { [weak self] digimon, success in
            
            if success {
                self?.digimon = digimon
                completion(true)
            }else {
                completion(false)
            }
        }
    }
}
