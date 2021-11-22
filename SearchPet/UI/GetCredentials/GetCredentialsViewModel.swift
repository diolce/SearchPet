//
//  GetCredentialsViewModel.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

class GetCredentialsViewModel: ViewModelBase {

    
    
    init(){
        
    }
    

    
    
    
    
    func getCredentials() {
        self.isLoading = true
        self.apiManager.getCredentials {result in
            switch result {
            case.success(let credentials):
                DispatchQueue.main.async {
                    //get token and save
                    RealmService.shared.createOrUpdate(credentials)
                }
                self.successReponse?()
            case .failure(let error):
                print(error)
            }
            self.isLoading = false
        }
    }
    
    var successReponse: (()->())?
}

