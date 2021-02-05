//
//  APIRequest.swift
//
//  Created by Ashok on 27/10/18.
//  Copyright © 2018 NFN Labs. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

import Foundation

let REQUEST_TIMEOUT: TimeInterval = 20

class APIRequest: NSObject {
    
    static let shared = APIRequest()
    var formatter = DateFormatter()
    var url = "https://quote-garden.herokuapp.com/api/v2/quotes/random"
    
    func networkRequest<T: BaseMappable>(ofType:T.Type, onSuccess: @escaping (T) -> Void, onError: @escaping (Error?) -> Void){
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil)
            .responseObject { (response:AFDataResponse<T>) in
                switch response.result{
                case .success(let value):
                    onSuccess(value)
                case .failure(let error):
                    onError(error)
                    
                    return
                }
            }
    }
}


