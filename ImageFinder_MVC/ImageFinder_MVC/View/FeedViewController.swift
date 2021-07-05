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
    var photos: Photos = []
    var images: [UIImage] = []

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
        feedCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
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
        NetworkService().request(request: .get, url: unsplash.apiURL + "photos/?client_id=" + unsplash.accessKey, body: nil) { result in
            switch result {
            case .success(let data):
                self.parse(json: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        do {
            let photos = try decoder.decode(Photos.self, from: json)
            self.photos.append(contentsOf: photos)
            photos.forEach { photo in
                let url = URL(string: photo.urls.thumb)
                let data = try! Data(contentsOf: url!)
                guard let image = UIImage(data: data) else { return }
                self.images.append(image)
            }
            DispatchQueue.main.async {
                self.feedCollectionView.reloadData()
            }
        } catch {
            print(error)
        }
    }
}

// MARK: - UICollectionViewDataSource & Delegate Methods
extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        cell.layer.cornerRadius = 8
        cell.imageView.layer.cornerRadius = 8
        cell.imageView.clipsToBounds = true
        
        cell.configure(on: cell)
        cell.isUserInteractionEnabled = false
        
        if !photos.isEmpty {
            DispatchQueue.main.async {
                cell.imageView.image = self.images[indexPath.row]
            }
        }
        
        return cell
    }
}
