//
//  LikedCell.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/21.
//

import UIKit

class LikedCell: UICollectionViewCell {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func configure(on cell: LikedCell) {
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
        
        heartImageView.isHidden = true
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
