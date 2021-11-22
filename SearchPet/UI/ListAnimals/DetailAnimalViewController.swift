//
//  DetailAnimalViewController.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import UIKit

class DetailAnimalViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var coat: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    //var coordinator: SecondCoordinator?
    var viewModel: DetailAnimalViewModel?
    let child = SpinnerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModelDetailAnimal()
        // Do any additional setup after loading the view.
    }

    func initViewModelDetailAnimal() {
        self.viewModel?.updateLoadingStatus = {[weak self] () in
                DispatchQueue.main.async {
                    let isLoading = self?.viewModel?.isLoading ?? false
                    self?.spinner(childSpinner:self!.child,status:isLoading)
            }
        }
        
        self.viewModel?.reloadView = {[weak self] () in
            DispatchQueue.main.async {
                if let info = self?.viewModel?.info {
                    self?.name.text = info.name
                    self?.gender.text = info.gender
                    self?.age.text = info.age
                    self?.coat.text = info.coat
                    self?.overview.text = info.description
                    if let image = info.image {
                        self?.animalImage.image = ImageManager.shared.image(path: image)
                    }
                }
            }
        }
        
        
        self.viewModel?.getDetailAnimal()
    }
}
