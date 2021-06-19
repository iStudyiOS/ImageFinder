//
//  LikedViewController.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/18.
//

import UIKit

class LikedViewController: UIViewController {
    
    var photoCollectionView: UICollectionView?

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
        
        photoCollectionView = UICollectionView(frame: self.view.frame,
                                              collectionViewLayout: layout)
        guard let collectionView = photoCollectionView else { return }
        collectionView.backgroundColor = .blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoCollectionView ?? UIView())
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
