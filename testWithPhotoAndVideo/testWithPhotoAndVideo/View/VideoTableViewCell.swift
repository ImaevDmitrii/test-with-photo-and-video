//
//  VideoTableViewCell.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class VideoTableViewCell: UITableViewCell {
    
    private let thumbnailImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        
        thumbnailImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(thumbnailImageView.snp.width).multipliedBy(9.0/16.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configure(with video: Video) {
        if let thumbnailURL = URL(string: video.image) {
            thumbnailImageView.kf.setImage(with: thumbnailURL)
        }
    }
}
