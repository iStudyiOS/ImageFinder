//
//  ViewController.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/16.
//

import UIKit

class FeedViewController: UIViewController {
    var feedCollectionView: UICollectionView!
    var cellId = "feedCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        getPhotos()
    }
    
    // MARK: - UI Methods
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let size = (view.frame.width - 80) / 2
        layout.sectionInset = UIEdgeInsets(top: 20,
                                           left: 30,
                                           bottom: 20,
                                           right: 30)
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: size, height: size)
        
        feedCollectionView = UICollectionView(frame: self.view.frame,
                                              collectionViewLayout: layout)
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
        feedCollectionView.register(LikedCell.self, forCellWithReuseIdentifier: cellId)
        feedCollectionView.backgroundColor = .systemBackground
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(feedCollectionView)
        
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            feedCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    // MARK: - Call API Methods
    func getPhotos() {
        let unsplash = UnsplashPhotoPickerConfiguration()
        NetworkService().request(request: .get, url: unsplash.apiURL + "photos/?client_id" + unsplash.accessKey, body: nil) { result in
            print(result)
        }
    }
}

// MARK: - UICollectionViewDataSource & Delegate Methods
extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LikedCell
        cell.backgroundColor = .black
        
        cell.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            cell.imageView.topAnchor.constraint(equalTo: cell.topAnchor),
            cell.imageView.leftAnchor.constraint(equalTo: cell.leftAnchor),
            cell.imageView.rightAnchor.constraint(equalTo: cell.rightAnchor),
            cell.imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
        ])
        return cell
    }
}
