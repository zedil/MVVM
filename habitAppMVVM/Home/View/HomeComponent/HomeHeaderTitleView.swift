//
//  HomeHeaderTitleView.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 10.02.2023.
//

import UIKit

class HomeHeaderTitleView: UIView {
    
    init() {
        super.init(frame: .zero)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.backgroundColor = .green
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleChallenge: UILabel = {
        let label = UILabel()
        label.text = "My Challenges"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Wed, 18"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.tintColor = .black
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private func addSubViews() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleChallenge)
        verticalStackView.addArrangedSubview(dateLabel)
        addSubview(plusButton)
    }
    
    private func configureContents() {
        let verticalStackViewConst = [
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            verticalStackView.heightAnchor.constraint(equalToConstant: 50),
            verticalStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20)
        ]
        
        NSLayoutConstraint.activate(verticalStackViewConst)
        
        let plusButtonConst = [
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            plusButton.centerYAnchor.constraint(equalTo: verticalStackView.centerYAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            plusButton.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(plusButtonConst)
    }

}
