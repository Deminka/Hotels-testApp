//
//  RatingNameView.swift
//  Hotels
//
//  Created by mac on 02.01.2024.
//

import UIKit

 class RatingNameView: UIView {
    
    let ratingView = RatingView()
    let nameLabel = UILabel(text: R.Strings.nameHotel,
                            font: .nameHotelFont22(),
                            textColor: .blackColor())
    let locationButton = UIButton(title: R.Strings.locationOfHotel,
                                  titleColor: .locationButtonTitleColor(),
                                  font: .locationTitleFont14(),
                                  alignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubViews()
        setupConstraints()
        customiseElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RatingNameView {
    
    private func customiseElements() {
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews() {
        addSubview(ratingView)
        addSubview(nameLabel)
        addSubview(locationButton)
        ratingView.layer.cornerRadius = 5
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingView.widthAnchor.constraint(equalToConstant: 165),
            ratingView.heightAnchor.constraint(equalToConstant: 29),
            
            nameLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            locationButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            locationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            locationButton.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
}
