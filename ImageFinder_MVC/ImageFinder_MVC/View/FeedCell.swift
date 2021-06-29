//
//  FeedCell.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/24.
//

import UIKit

class FeedCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let heartImageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        return imageVIew
    }()
    
//    lazy var likeAnimator = LikeAnimator(container: contentView, layout)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func configure(on cell: FeedCell) {
        NSLayoutConstraint.activate([
            cell.imageView.topAnchor.constraint(equalTo: cell.topAnchor),
            cell.imageView.leftAnchor.constraint(equalTo: cell.leftAnchor),
            cell.imageView.rightAnchor.constraint(equalTo: cell.rightAnchor),
            cell.imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
        ])
    }
    
    func addViews() {
        addSubview(imageView)
        addSubview(heartImageView)
    }
    
    func addGetsureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
