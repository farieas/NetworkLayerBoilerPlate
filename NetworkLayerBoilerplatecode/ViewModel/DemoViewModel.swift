//
//  DemoViewModel.swift
//  NetworkLayerBoilerplatecode
//
//  Created by WC-64 on 06/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation

class DemoViewModel {
    
    let apiService : ApiSerivce!
    var demoData : DemoModel?
    
    init(apiService: ApiSerivce = ApiSerivce.shared) {
        self.apiService = apiService
    }
    
    
    func getData() {
        Task.init { [weak self] in
            guard let strongSelf = self else { return }
            do {
                // Creating a request
                // Create a model of your reponse and replace with DemoModel
                // Set Route (End Point of API in Route.swift file), Request type, and parameters if any required of leave it as nil
                let resource = Resource<DemoModel>(route: .getData,method: .get,parameters: nil)
                var result = try await apiService.performReques(resourse: resource)
                // Handle Success, Error and update UI
                switch result {
                case .success(let response):
                    strongSelf.demoData = response.data
                case .failure(let error):
                    print("OOPS!! , \(error.localizedDescription)")
                }
            } catch (let error) {
                print("Oh no!! , \(error.localizedDescription)")
            }
           
            
        }
    }
    
}
