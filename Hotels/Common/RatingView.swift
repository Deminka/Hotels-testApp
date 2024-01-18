//
//  RatingView.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class RatingView: UIView {
    
   lazy var starImage: UIImageView = {
        var imageView = UIImageView()
        let image = UIImage(systemName: "star.fill")
        imageView = UIImageView(image: image)
        imageView.setupColor(color: .ratingLabelColor())
        imageView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let ratingNumberLabel = UILabel(text: "",
                              font: .ratingFont16(),
                              textColor: .ratingLabelColor(),
                              backgrounColor: .ratingLabelBackgroundColor().withAlphaComponent(0))
    
    let ratingConditionLabel = UILabel(text: "",
                                       font: .ratingFont16(),
                                       textColor: .ratingLabelColor(),
                                       backgrounColor: .ratingLabelBackgroundColor().withAlphaComponent(0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .ratingLabelBackgroundColor()
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubview(starImage)
        addSubview(ratingNumberLabel)
        addSubview(ratingConditionLabel)
    }
    
    private func setupConstraints() {
        
        starImage.translatesAutoresizingMaskIntoConstraints = false
        ratingNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingConditionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            ratingNumberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ratingNumberLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 3),
            
            ratingConditionLabel.centerYAnchor.constraint(equalTo: ratingNumberLabel.centerYAnchor),
            ratingConditionLabel.leadingAnchor.constraint(equalTo: ratingNumberLabel.trailingAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
