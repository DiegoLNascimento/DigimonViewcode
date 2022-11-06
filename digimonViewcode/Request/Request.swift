//
//  Request.swift
//  digimonViewcode
//
//  Created by diego on 02/06/22.
//

import UIKit
import Alamofire

class Request: NSObject {
    
    func request(completion: @escaping(Digimon?,Bool) -> Void) {
        AF.request("https://digimon-api.vercel.app/api/digimon" , method: .get).response { response in
            if response.response?.statusCode == 200 {
                let digimon = try? JSONDecoder().decode(Digimon.self, from: response.data ?? Data())
                completion(digimon,true)
            } else {
                completion(nil,false)
            }
        }
    }
}
