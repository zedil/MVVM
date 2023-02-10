//
//  HomeProgressHeaderView.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 10.02.2023.
//

import UIKit

class HomeProgressHeaderView: UIView {
    
    let circle = CircleProgressBar()
    
    private let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You are almost there!"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "1/3 day goals completed"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubViews() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 20
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)
        
        addSubview(circle)
        
        configureContents()

    }
    
    private func configureContents() {
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalStackViewConst = [
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            verticalStackView.heightAnchor.constraint(equalToConstant: 70),
            verticalStackView.widthAnchor.constraint(equalToConstant: 250)
        ]
        
        NSLayoutConstraint.activate(verticalStackViewConst)
        
        let circleConst = [
            circle.centerYAnchor.constraint(equalTo: verticalStackView.centerYAnchor),
            circle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ]
        
        NSLayoutConstraint.activate(circleConst)
    }
    
    
    
}
