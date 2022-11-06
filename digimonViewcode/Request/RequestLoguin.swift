//
//  RequestLoguin.swift
//  digimonViewcode
//
//  Created by diego on 05/06/22.
//

import UIKit
import Alamofire

class RequestLoguin: NSObject {
    
    func requesLoguin(userName: String, passWord: String, completion: @escaping(Bool) -> Void) {
        let url = "https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/signin"
        let param = ["email": userName, "password": passWord]
        
        AF.request( url, method: .post, parameters: param, encoder: JSONParameterEncoder.default).response { response in
            if response.response?.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
