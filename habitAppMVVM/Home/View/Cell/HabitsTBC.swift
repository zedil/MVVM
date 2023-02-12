//
//  HabitsTBC.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 11.02.2023.
//

import UIKit

class HabitsTBC: UITableViewCell {
    
    let habitImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let habitTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = "dlfdkfskksfk"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let clockLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .purple
        label.layer.cornerRadius = 5
        label.text = "343242342"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let clockImageView:UIImageView = {
        let img = UIImageView(image: UIImage(named: "clock"))
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    var habit:Habit? {
            didSet {
                guard let habitItem = habit else {return}
                if let imageName = habitItem.habitImage {
                    habitImageView.image = UIImage(named: imageName)
                }
                if let habitTitle = habitItem.habitName {
                   habitTitleLabel.text = habitTitle
                }
               
                if let habitClock = habitItem.habitClock {
                    clockLabel.text = habitClock
                }
            }
        }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(containerView)
        contentView.addSubview(habitImageView)
        containerView.addSubview(habitTitleLabel)
        containerView.addSubview(clockLabel)
        contentView.addSubview(clockImageView)
        
        configureContents()
        
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func configureContents() {
        
        let habitImageViewConst = [
            habitImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            habitImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            habitImageView.heightAnchor.constraint(equalToConstant: 50),
            habitImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(habitImageViewConst)
        
        let containerViewConst = [
            containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.habitImageView.trailingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(containerViewConst)
        
        
        let habitTitleLabelConst = [
            habitTitleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            habitTitleLabel.leadingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(habitTitleLabelConst)
        
        
        let clockLabelConst = [
            clockLabel.topAnchor.constraint(equalTo: self.habitTitleLabel.bottomAnchor, constant: 10),
            clockLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            clockLabel.trailingAnchor.constraint(equalTo: self.habitTitleLabel.trailingAnchor),
        ]
        NSLayoutConstraint.activate(clockLabelConst)
        
        let clockImageViewConst = [
            clockImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            clockImageView.heightAnchor.constraint(equalToConstant: 50),
            clockImageView.widthAnchor.constraint(equalToConstant: 50),
            clockImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(clockImageViewConst)
        
        
    }

}
