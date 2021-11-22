//
//  ListAnimalsViewModel.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import Foundation

class ListAnimalsViewModel: ViewModelBase {
    private var itemsViewModel: [ItemAnimalViewModel] = [ItemAnimalViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isLoadingNext:Bool = false {
        didSet {
            self.updateLoadingStatusNext?()
        }
    }
    
    var next:String? = nil
    
    var search:((_ text: String?)->())?
    
    func processData(dataResponse: DataReponse) {
        var aux: [ItemAnimalViewModel] = [ItemAnimalViewModel]()
        self.next = dataResponse.pagination._links?.next?.href
        for animal in dataResponse.animals {
            aux.append(animal.createItemViewModel())
        }
        if isLoadingNext {itemsViewModel.append(contentsOf: aux) } else {itemsViewModel = aux}
    }
    
    func getAnimals(city:String? = nil, nextLink:String? = nil,type:String? = nil) {
        
        if type == nil {self.setLoader(isRelative: nextLink != nil, isLoading: true)}
        self.apiManager.getAnimals(city: city, nextLinkPagination: nextLink,type:type) { result in
            switch result {
            case .success(let dataResponse):
                self.processData(dataResponse: dataResponse)
                self.setLoader(isRelative: nextLink != nil, isLoading:false)
            case .failure(_):break
                self.itemsViewModel = []
            }
            
        }
    }
        
    func setLoader(isRelative:Bool,isLoading:Bool) {
        if isRelative {
            self.isLoadingNext = isLoading
        } else {
            self.isLoading = isLoading
        }
    }
    
    var numberOfRows: Int {
        return itemsViewModel.count
    }
    
    func getItemViewModel(at indexPath:IndexPath) -> ItemAnimalViewModel {
        return itemsViewModel[indexPath.row]
    }
    

    
    var reloadTableViewClosure: (()->())?
    var updateLoadingStatusNext: (() -> ())?
}
