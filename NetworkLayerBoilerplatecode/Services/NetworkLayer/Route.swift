//
//  Route.swift
//  NetworkLayerBoilerplatecode
//
//  Created by Farhan on 06/11/22.
//

import Foundation
import Alamofire

protocol RouteProtocol {
    var url : String { get }
}


/// Declare endpoints used by API's in your api calls
enum Route : String , RouteProtocol {
    
    // ADD Required API's here
    case getData = "---API-END-POINT-HERE---"
    
    
    var url : String {
        guard BaseConstants.baseURL != "--ENTER-THE-BASE-URL---" else {
            fatalError("OOPS!! Please provide base url")
        }
        return BaseConstants.baseURL+self.rawValue
    }
    
   
}
