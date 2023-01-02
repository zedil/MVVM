//
//  ViewController.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 31.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    

    private let headerView = HomeHeaderCustomView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        view.addSubview(headerView)
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let headerViewConst = [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 65),
            headerView.widthAnchor.constraint(equalToConstant: (view.bounds.width) - 20)
        ]
        
        NSLayoutConstraint.activate(headerViewConst)
    }


}

