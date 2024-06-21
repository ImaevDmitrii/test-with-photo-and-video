//
//  PhotoCollectionViewCell.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with photo: Photo) {
        guard let urlString = photo.urls?.small, let url = URL(string: urlString) else { return }
        imageView.kf.setImage(with: url)
    }
}
