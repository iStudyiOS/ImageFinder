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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .red
        return imageView
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
            cell.imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            
            heartImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: cell.bounds.width / 3),
            heartImageView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: cell.bounds.width / 3),
            heartImageView.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.3),
            heartImageView.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.3)
        ])
        
        cell.addGetsureRecognizer()
        heartImageView.isHidden = true
    }
    
    func addViews() {
        addSubview(imageView)
        addSubview(heartImageView)
    }
    
    func heartAnimation() {
        heartImageView.isHidden = false
        UIView.animate(withDuration: 0.1, animations: {
            self.heartImageView.transform.scaledBy(x: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.heartImageView.transform = CGAffineTransform.identity
            })
            self.heartImageView.isHidden = true
        }
    }
    
    func addGetsureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped() {
        heartAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
