//
//  BasicInfo.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class BasicInfoHotelView: UIView {
    
    private var viewModel = ViewModel()
    var carouselPhoto = CarouselImageCollectionView()
    let ratingView = RatingView()
    let nameLabel = UILabel(text: "",
                            font: .nameHotelFont22(),
                            textColor: .blackColor())
    
    let locationButton = UIButton(title: "",
                                  titleColor: .locationButtonTitleColor(),
                                  font: .locationTitleFont14(),
                                  alignment: .left)
    
    let costLabel = UILabel(text: "",
                            font: .costTitleFont30(),
                            textColor: .blackColor())
    
    let costDetailLabel = UILabel(text: "",
                                  font: .costDetailFont16(),
                                  textColor: .costDetailColor())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        ratingView.layer.cornerRadius = 5
        
        bindViewModel()
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubview(carouselPhoto)
        addSubview(ratingView)
        addSubview(nameLabel)
        addSubview(locationButton)
        addSubview(costLabel)
        addSubview(costDetailLabel)
    }
    
    private func setupConstraints() {
        
        carouselPhoto.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            carouselPhoto.topAnchor.constraint(equalTo: self.topAnchor),
            carouselPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            carouselPhoto.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            carouselPhoto.heightAnchor.constraint(equalTo: carouselPhoto.widthAnchor, multiplier: 0.75),
            
            ratingView.topAnchor.constraint(equalTo: carouselPhoto.bottomAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ratingView.widthAnchor.constraint(equalToConstant: 165),
            ratingView.heightAnchor.constraint(equalToConstant: 29),
            
            nameLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            locationButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            locationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            locationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            locationButton.heightAnchor.constraint(equalToConstant: 17),
            
            costLabel.bottomAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 52),
            costLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            costLabel.widthAnchor.constraint(equalToConstant: 174),
            costLabel.heightAnchor.constraint(equalToConstant: 40),
            
            costDetailLabel.bottomAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 40),
            costDetailLabel.leadingAnchor.constraint(equalTo: costLabel.trailingAnchor, constant: 8)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BasicInfoHotelView {
    
    func bindViewModel() {
       
        viewModel.images.bind({ (images) in
            DispatchQueue.main.async {
                self.carouselPhoto.setup(images: images)
            }
        })
        viewModel.statusNameHotel.bind({ (statusNameHotel) in
            DispatchQueue.main.async {
                self.nameLabel.text = statusNameHotel
            }
        })
        viewModel.statusAdressHotel.bind({ (statusAdressHotel) in
            DispatchQueue.main.async {
                self.locationButton.setTitle(statusAdressHotel, for: .normal)
            }
        })
        viewModel.statusMinimalPrice.bind({ (statusMinimalPrice) in
            DispatchQueue.main.async {
                self.costLabel.text = "от " + "\(statusMinimalPrice)".chunked(by: 3).joined(separator: " ") + " ₽"
            }
        })
        viewModel.statusPrice_for_it.bind({ (statusPrice) in
            DispatchQueue.main.async {
                self.costDetailLabel.text = statusPrice
            }
        })
        viewModel.statusNumberRating.bind({ (statusNumberRating) in
            DispatchQueue.main.async {
                self.ratingView.ratingNumberLabel.text = statusNumberRating
            }
        })
        viewModel.statusConditionRating.bind({ (statusConditionRating) in
            DispatchQueue.main.async {
                self.ratingView.ratingConditionLabel.text = statusConditionRating
            }
        })
        viewModel.data()
    }
}

