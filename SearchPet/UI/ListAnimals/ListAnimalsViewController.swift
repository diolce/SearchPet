//
//  ListAnimalsViewController.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

class ListAnimalsViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var coordinator: SecondCoordinator!
    let child = SpinnerViewController()
    var viewModel: ListAnimalsViewModel = ListAnimalsViewModel()
    let spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coordinator = SecondCoordinator(navigationController: self.navigationController!)
        
        
        self.registerCell()
        self.setDelegates()
        // Do any additional setup after loading the view.
        
        self.initViewModelAnimals()
    }

    func registerCell() {
        self.tableView.register(CatTableViewCell.nib, forCellReuseIdentifier: CatTableViewCell.identifier)
        self.tableView.register(DogTableViewCell.nib, forCellReuseIdentifier: DogTableViewCell.identifier)
        self.tableView.register(RabbitTableViewCell.nib, forCellReuseIdentifier: RabbitTableViewCell.identifier)
        self.tableView.register(AnimalTableViewCell.nib, forCellReuseIdentifier: AnimalTableViewCell.identifier)
    }
    
    func setDelegates() {
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func initViewModelAnimals() {
        self.viewModel.updateLoadingStatus = {[weak self] () in
                DispatchQueue.main.async {
                    let isLoading = self?.viewModel.isLoading ?? false
                    self?.spinner(childSpinner:self!.child,status:isLoading)
                }
        }
        
        self.viewModel.updateLoadingStatusNext = {[weak self] () in
            DispatchQueue.main.async {
                if self?.viewModel.next != nil {
                    if let isLoading = self?.viewModel.isLoadingNext {
                        if self?.tableView.tableFooterView == nil {
                            self?.tableView.tableFooterView = self?.spinner
                        }
                        (self?.tableView.tableFooterView as! UIActivityIndicatorView).startAnimating()
                        self?.tableView.tableFooterView?.isHidden = true
                    } else {
                        if self?.tableView.tableFooterView == nil {
                            self?.tableView.tableFooterView = self?.spinner
                        }
                        (self?.tableView.tableFooterView as! UIActivityIndicatorView).stopAnimating()
                        self?.tableView.tableFooterView?.isHidden = true
                    }
                } else {
                    self?.tableView.tableFooterView = nil
                    self?.tableView.tableFooterView?.removeFromSuperview()
                    self?.tableView.layoutIfNeeded()
                }
            }
        }
    
    
        self.viewModel.reloadTableViewClosure = {[weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        self.viewModel.search = { text in
            DispatchQueue.main.async {
                if let text = text {
                    //Buscamos por ()
                    print("Buscamos \(text)")
                    self.viewModel.getAnimals(type:text)
                } else {
                    //reset items normal
                    self.viewModel.getAnimals(city:"New York")
                }
            }
        }
        
        
        
        self.viewModel.getAnimals(city:"New York")
    }
}

extension ListAnimalsViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = viewModel.getItemViewModel(at: indexPath)
        var cell:UITableViewCell
        switch cellVM.type {
        case "Cat":
            cell = tableView.dequeueReusableCell(withIdentifier: CatTableViewCell.identifier, for: indexPath) as! CatTableViewCell
            (cell as! CatTableViewCell).itemVM = cellVM
        case "Dog":
            cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.identifier, for: indexPath) as! DogTableViewCell
            (cell as! DogTableViewCell).itemVM = cellVM
        case "Rabbit":
            cell = tableView.dequeueReusableCell(withIdentifier: RabbitTableViewCell.identifier, for: indexPath) as! RabbitTableViewCell
            (cell as! RabbitTableViewCell).itemVM = cellVM
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.identifier, for: indexPath) as! AnimalTableViewCell
            (cell as! AnimalTableViewCell).itemVM = cellVM
        }
        return cell
    }
    
    
}

extension ListAnimalsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getItemViewModel(at: indexPath).heightItem
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.seeAnimal(id: viewModel.getItemViewModel(at: indexPath).id)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = viewModel.numberOfRows - 1
        if indexPath.row == lastElement {
            if let next = viewModel.next {
                self.viewModel.next = nil
                self.viewModel.getAnimals(nextLink: next)
            }
        }
    }
}

extension ListAnimalsViewController:UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.viewModel.search?("")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.viewModel.search?(nil)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.search?(nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.search?(searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            self.viewModel.search?(nil)
        } else {
            self.viewModel.search?(searchBar.text)
        }
    }
    
}
