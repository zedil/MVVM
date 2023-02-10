//
//  ViewController.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 31.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    

    private let headerView = HomeHeaderCustomView()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 10
        static let itemHeight: CGFloat = 80
    }
    
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        view.addSubview(headerView)
        view.addSubview(collectionView)
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false

        
        items = [
            Item(title: "Army TYPE", desc: "deneme"),
            Item(title: "TEAM BONUS", desc: "deneme"),
            Item(title: "CIVILIZATION BONUS", desc: "deneme")
        ]
        
        let headerViewConst = [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            headerView.widthAnchor.constraint(equalToConstant: (view.bounds.width) - 20)
        ]
        
        NSLayoutConstraint.activate(headerViewConst)
        
        let collectionViewConst = [
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            collectionView.leftAnchor.constraint(equalTo: headerView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: headerView.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(collectionViewConst)
        
        collectionView.backgroundColor = .green
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemCellCVC.self, forCellWithReuseIdentifier: ItemCellCVC.identifier)
        
        collectionView.reloadData()
    }


}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCellCVC.identifier, for: indexPath) as! ItemCellCVC
        
        let item = items[indexPath.row]
        cell.setup(with: item)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: 0)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}

public struct Item {
    let title: String
    let desc: String
}

