//
//  ViewModelBase.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

class ViewModelBase {
    let apiManager:ApiManager
    
    init(apiManager:ApiManager = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var updateLoadingStatus: (()->())?
    var showAlertClosure: (()->())?
}
