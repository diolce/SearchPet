//
//  DetailAnimalViewModel.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import Foundation

class DetailAnimalViewModel: ViewModelBase {
    let id:Int
    
    init(id:Int) {
        self.id = id
    }
    
    var info: ItemAnimalViewModel? = nil {
        didSet {
            if let _ = info {
                self.reloadView?()
            }
        }
    }
    
    func proccessData(detailAnimal:DetailAnimal) {
        info = detailAnimal.animal.createItemViewModel()
    }
    
    func getDetailAnimal() {
        self.isLoading = true
        self.apiManager.getDetailAnimal(id: self.id) {result in
            switch result {
            case .success(let detailAnimal):
                self.proccessData(detailAnimal: detailAnimal)
            case .failure(_):break
            }
            self.isLoading = false
        }
        
    }
    
    var reloadView: (()->())?
}
