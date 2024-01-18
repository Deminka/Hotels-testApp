//
//  HotelInfoViewController.swift
//  Hotels
//
//  Created by mac on 06.09.2023.
//

import UIKit

class HotelInfoViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        return contentView
    }()
    
    let basicInfoHotelView = BasicInfoHotelView()
    let detailInfiHotelView = DetailInfoHotelView()
    let forwardButtonView = ForwardButtonView(titleButton: R.Strings.Common.toChangeRoom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = R.Strings.hotel
        view.backgroundColor = .white
        
        addSubviews()
        custimizeElements()
        setupConstraints()
        forwardButtonView.onRoom = { [weak self] in
            self?.coordinator?.openRoomsInfoVC()
        }
        basicInfoHotelView.carouselPhoto.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
    }
}

extension HotelInfoViewController {
    
    private func custimizeElements() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        basicInfoHotelView.translatesAutoresizingMaskIntoConstraints = false
        detailInfiHotelView.translatesAutoresizingMaskIntoConstraints = false
        forwardButtonView.translatesAutoresizingMaskIntoConstraints = false
        basicInfoHotelView.layer.cornerRadius = 12
        detailInfiHotelView.layer.cornerRadius = 12
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(basicInfoHotelView)
        contentView.addSubview(detailInfiHotelView)
        contentView.addSubview(forwardButtonView)
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            basicInfoHotelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            basicInfoHotelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicInfoHotelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            basicInfoHotelView.heightAnchor.constraint(equalToConstant: 450),
            
            detailInfiHotelView.topAnchor.constraint(equalTo: basicInfoHotelView.bottomAnchor, constant: 10),
            detailInfiHotelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailInfiHotelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailInfiHotelView.heightAnchor.constraint(equalToConstant: 450),
            
            forwardButtonView.topAnchor.constraint(equalTo: detailInfiHotelView.bottomAnchor, constant: 10),
            forwardButtonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            forwardButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            forwardButtonView.heightAnchor.constraint(equalToConstant: 50),
            forwardButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
