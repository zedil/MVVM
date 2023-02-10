//
//  ViewController.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 31.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    

    private let headerView = HomeHeaderCustomView()
    
    private let headerTitleView = HomeHeaderTitleView()
    
    var circularProgressBarView = HomeProgressHeaderView()
    var circularViewDuration: TimeInterval = 2
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 30
        static let itemHeight: CGFloat = 100
    }
    
    var items: [Item] = []
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        //view.addSubview(headerView)
        //headerView.backgroundColor = .systemPink
        view.addSubview(headerTitleView)
        view.addSubview(circularProgressBarView)
        view.addSubview(collectionView)
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerTitleView.translatesAutoresizingMaskIntoConstraints = false
        circularProgressBarView.translatesAutoresizingMaskIntoConstraints = false
        

        
        items = [
            Item(title: "Army TYPE", desc: "deneme"),
            Item(title: "TEAM BONUS", desc: "deneme"),
            Item(title: "CIVILIZATION BONUS", desc: "deneme")
        ]
        /*
        let headerViewConst = [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            headerView.widthAnchor.constraint(equalToConstant: (view.bounds.width) - 20)
        ]
        
        NSLayoutConstraint.activate(headerViewConst)
        */
        
        let headerTitleViewConst = [
            headerTitleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerTitleView.heightAnchor.constraint(equalToConstant: 40),
            headerTitleView.widthAnchor.constraint(equalToConstant: (view.bounds.width) - 40)
        ]
        
        NSLayoutConstraint.activate(headerTitleViewConst)
        
        let circleViewConst = [
            circularProgressBarView.topAnchor.constraint(equalTo: headerTitleView.bottomAnchor, constant: 30),
            circularProgressBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circularProgressBarView.heightAnchor.constraint(equalToConstant: 100),
            circularProgressBarView.widthAnchor.constraint(equalToConstant: (view.bounds.width) - 40)
        ]
        
        NSLayoutConstraint.activate(circleViewConst)
        
        
        
        let collectionViewConst = [
            collectionView.topAnchor.constraint(equalTo: circularProgressBarView.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: circularProgressBarView.leadingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 400),
            collectionView.trailingAnchor.constraint(equalTo: circularProgressBarView.trailingAnchor)
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

