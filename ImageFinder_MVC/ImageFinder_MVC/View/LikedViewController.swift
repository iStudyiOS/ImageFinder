//
//  LikedViewController.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/18.
//

import UIKit

class LikedViewController: UIViewController {
    
    var likedCollectionView: UICollectionView!
    var cellId = "likedCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
    }
    
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let size = (view.frame.width - 120) / 2
        layout.sectionInset = UIEdgeInsets(top: 20,
                                           left: 40,
                                           bottom: 20,
                                           right: 40)
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: size, height: size)
        
        likedCollectionView = UICollectionView(frame: self.view.frame,
                                              collectionViewLayout: layout)
        likedCollectionView.dataSource = self
        likedCollectionView.delegate = self
        likedCollectionView.register(LikedCell.self, forCellWithReuseIdentifier: cellId)
        likedCollectionView.backgroundColor = .systemBackground
        likedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(likedCollectionView)
        
        NSLayoutConstraint.activate([
            likedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            likedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            likedCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            likedCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource & Delegate Methods
extension LikedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LikedCell
        cell.backgroundColor = .black
        return cell
    }
}
