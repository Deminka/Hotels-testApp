//
//  BookingResultViewController.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class BookingResultViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    lazy var superImage: UIImageView = {
         var imageView = UIImageView()
         let image = UIImage(named: "Frame 610")
         imageView = UIImageView(image: image)
         imageView.frame = CGRect(x: 0, y: 0, width: 94, height: 94)
         imageView.contentMode = .scaleAspectFit
         return imageView
     }()
    
    let orderStatusLabel = UILabel(text: R.Strings.BookingResultVC.orderStatus, font: .font22(), textColor: .black)
    let infoLabel = UILabel(text: R.Strings.BookingResultVC.infoStatus, font: .font16(), textColor: R.Colors.infotextColor)
    
    let superButton = ForwardButtonView(titleButton: R.Strings.BookingResultVC.resultButton)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.orderPaid
        view.backgroundColor = .white
        
        infoLabel.textAlignment = .center
        
        customiseElements()
        addSubViews()
        setupConstraints()
        
        superButton.onRoom = { [weak self] in
            self?.coordinator?.openMainScreen()
        }
    }
}

extension BookingResultViewController {
    
    private func customiseElements() {
        superImage.translatesAutoresizingMaskIntoConstraints = false
        orderStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        superButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews() {
        view.addSubview(superImage)
        view.addSubview(orderStatusLabel)
        view.addSubview(infoLabel)
        view.addSubview(superButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            superImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            superImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 122),
            
            orderStatusLabel.topAnchor.constraint(equalTo: superImage.bottomAnchor, constant: 32),
            orderStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: orderStatusLabel.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            superButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            superButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            superButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            superButton.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
}


