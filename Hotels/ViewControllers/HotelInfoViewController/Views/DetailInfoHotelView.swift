//
//  DetailInfoHotelView.swift
//  Hotels
//
//  Created by mac on 11.09.2023.
//

import UIKit

class DetailInfoHotelView: UIView {
    
    var viewModel = ViewModel()
    var peculiaritiesArray = [""]
    let aboutHotelLabel = UILabel(text: R.Strings.aboutHotel,
                                  font: .aboutHotelFont26(),
                                  textColor: .blackColor())
    lazy var tag1 = createTag(text: "")
    lazy var tag2 = createTag(text: "")
    lazy var tag3 = createTag(text: "")
    lazy var tag4 = createTag(text: "")
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .costDetailFont16()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    let infoButtonsView = InfoButtonsView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        bindViewModel()
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        addSubview(aboutHotelLabel)
        addSubview(tag1)
        addSubview(tag2)
        addSubview(tag3)
        addSubview(tag4)
        addSubview(detailLabel)
        addSubview(infoButtonsView)
        
        aboutHotelLabel.translatesAutoresizingMaskIntoConstraints = false
        tag1.translatesAutoresizingMaskIntoConstraints = false
        tag2.translatesAutoresizingMaskIntoConstraints = false
        tag3.translatesAutoresizingMaskIntoConstraints = false
        tag4.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        infoButtonsView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            aboutHotelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            aboutHotelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            aboutHotelLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            tag1.topAnchor.constraint(equalTo: self.topAnchor, constant: 58),
            tag1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            tag2.topAnchor.constraint(equalTo: tag1.bottomAnchor, constant: 5),
            tag2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            tag3.topAnchor.constraint(equalTo: tag1.bottomAnchor, constant: 5),
            tag3.leadingAnchor.constraint(equalTo: tag2.trailingAnchor, constant: 10),
            
            tag4.topAnchor.constraint(equalTo: tag3.bottomAnchor, constant: 5),
            tag4.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            detailLabel.topAnchor.constraint(equalTo: tag4.bottomAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            detailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            infoButtonsView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 30),
            infoButtonsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            infoButtonsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            infoButtonsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailInfoHotelView {
    
    private func createTag(text: String) -> UILabel {
        self.layoutIfNeeded()
        let tag = UILabel(text: text,
                          font: .tegFont19(),
                          textColor: #colorLiteral(red: 0.5098039216, green: 0.5294117647, blue: 0.5882352941, alpha: 1),
                          backgrounColor: #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9882352941, alpha: 1))
        return tag
    }
}

extension DetailInfoHotelView {
    
    func bindViewModel() {
       
        viewModel.statusDescription.bind({ (statusDescription) in
            DispatchQueue.main.async {
                self.detailLabel.text = statusDescription
            }
        })
        viewModel.statusPeculiarities.bind({ (statusPeculiarities) in
            DispatchQueue.main.async {
                self.peculiaritiesArray = statusPeculiarities
                self.tag1.text = self.peculiaritiesArray[0]
                self.tag2.text = self.peculiaritiesArray[1]
                self.tag3.text = self.peculiaritiesArray[2]
                self.tag4.text = self.peculiaritiesArray[3]
            }
        })
        viewModel.data()
    }
}
