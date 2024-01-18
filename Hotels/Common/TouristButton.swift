//
//  TouristButton.swift
//  Hotels
//
//  Created by mac on 11.01.2024.
//

import UIKit

class TouristButton: UIButton {
    
    let imgView = UIImageView()
    
    init(image: UIImage? = R.Images.upArrow){
        super.init(frame: .zero)
        
        self.imgView.image = image?.withRenderingMode(.alwaysTemplate)
        addViews()
        setupConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TouristButton {
    
    func addViews() {
        addSubview(imgView)
    }
    
    func setupConstraints() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 32),
            imgView.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    func configure() {
        layer.cornerRadius = 6
        makeSystem(self)
    }
}
