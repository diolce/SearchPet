//
//  extension+UIViewController.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit

extension UIViewController {
    func spinner(childSpinner:SpinnerViewController,status: Bool) {
        if status {
            showSpinner(childSpinner:childSpinner)
        } else {
            hideSpinner(childSpinner:childSpinner)
        }
    }
    
    func showSpinner(childSpinner: SpinnerViewController){
        addChild(childSpinner)
        childSpinner.view.frame = view.bounds
        view.addSubview(childSpinner.view)
        childSpinner.view.translatesAutoresizingMaskIntoConstraints = false
        childSpinner.view.topAnchor.constraint(equalTo:view.topAnchor, constant: 0).isActive = true
        childSpinner.view.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: 0).isActive = true
        childSpinner.view.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 0).isActive = true
        childSpinner.view.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: 0).isActive = true
        childSpinner.didMove(toParent: self)
    }
    
    func hideSpinner(childSpinner: SpinnerViewController){
        childSpinner.willMove(toParent: nil)
        childSpinner.view.removeFromSuperview()
        childSpinner.removeFromParent()
    }
}
