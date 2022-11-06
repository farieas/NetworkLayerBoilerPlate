//
//  BaseResponse.swift
//  NetworkLayerBoilerplatecode
//
//  Created by Farhan on 06/11/22.
//

import Foundation

class BaseResponse<T:Codable> : Codable {
    
    let errorCode : Int?
    let data : T?
    let message : String?
    
}
