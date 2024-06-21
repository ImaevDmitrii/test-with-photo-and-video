//
//  FullScreenImageViewController.swift
//  testWithPhotoAndVideo
//
//  Created by Dmitrii Imaev on 21.06.2024.
//

import UIKit
import SnapKit

final class FullScreenImageViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let closeButton = UIButton()
    private let image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        closeButton.setTitle("✕", for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
        }
    }
    
    @objc private func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
}

