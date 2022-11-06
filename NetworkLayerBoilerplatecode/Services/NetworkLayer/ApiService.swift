//
//  ApiService.swift
//  NetworkLayerBoilerplatecode
//
//  Created by Farhan on 06/11/22.
//

import Foundation
import Alamofire

typealias Response<T:Codable> = (Result<BaseResponse<T>, AFError>)

class ApiSerivce {
    
    static let shared = ApiSerivce()
    
    func performReques<T>(resourse:Resource<T>) async throws -> Response<T> {
        return try await withCheckedThrowingContinuation({ continuation in
            AF.request(resourse).responseDecodable { (response: DataResponse<BaseResponse<T>, AFError>) in
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: .success(result))
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
    
}
