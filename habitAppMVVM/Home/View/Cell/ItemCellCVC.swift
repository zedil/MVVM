//
//  ItemCellCVC.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 18.01.2023.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

// https://dribbble.com/shots/18341366-Habit-tracking-app/attachments/13552060?mode=media

class ItemCellCVC: UICollectionViewCell {
    
    private enum Constants {
        static let contentViewCornerRadius: CGFloat = 4.0

        static let imageHeight: CGFloat = 20

        static let verticalSpacing: CGFloat = 3.0
        static let horizontalPadding: CGFloat = 8.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.image = UIImage(named: "image")
        return image
    }()
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.backgroundColor = .brown
        label.layer.cornerRadius = 8
        label.textAlignment = .center
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    let insideView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white

        contentView.addSubview(title)
        
        contentView.addSubview(image)
        contentView.addSubview(view)
        view.addSubview(insideView)
        
    }
    
    private func setupLayouts() {
        image.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30)
            
        ])
        
        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            title.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            view.heightAnchor.constraint(equalToConstant: 30),
            view.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        insideView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            insideView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            insideView.heightAnchor.constraint(equalToConstant: 20),
            insideView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setup(with item: Item) {
        title.text = item.title
        
    }
    
}

extension ItemCellCVC: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
