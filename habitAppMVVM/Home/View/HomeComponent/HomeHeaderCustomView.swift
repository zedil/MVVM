//
//  HomeHeaderCustomView.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 31.12.2022.
//

import UIKit

class HomeHeaderCustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let leftButton: UIImageView = {
       
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    private let profileImageView: UIImageView = {
       
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    private func addCustomView() {
        
        self.addSubview(leftButton)
        self.addSubview(profileImageView)
        
        let leftButtonConst = [
            leftButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            leftButton.heightAnchor.constraint(equalToConstant: 30),
            leftButton.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(leftButtonConst)
        
        let profileImageViewConst = [
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(profileImageViewConst)
        
    }

}
