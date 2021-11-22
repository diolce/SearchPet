//
//  GetCredentialsViewController.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

class GetCredentialsViewController: UIViewController {
    @IBOutlet weak var buttonGetCredentials: UIButton!
    
    var viewModel: GetCredentialsViewModel = GetCredentialsViewModel()
    weak var coordinator: MainCoordinator?
    
    let child = SpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func tapped_get_credentials(_ sender: UIButton) {
        UIView.animate(withDuration: 0.6,
            animations: {
                self.buttonGetCredentials.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.6) {
                    self.buttonGetCredentials.transform = CGAffineTransform.identity
                }
            })
        
        self.viewModel.getCredentials()
    }
    
    func initViewModel() {
        self.viewModel.updateLoadingStatus = {[weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                self?.spinner(childSpinner:self!.child,status:isLoading)
            }
        }
        
        self.viewModel.successReponse = {
            [weak self] () in
            DispatchQueue.main.async {
                self?.coordinator?.loadTabBar()
            }
        }
    }
}
