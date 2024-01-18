//
//  RoomsInfoCell.swift
//  Hotels
//
//  Created by mac on 27.12.2023.
//

import UIKit

class RoomsInfoCell: UITableViewCell {
    
    var onBookingRoom: (() -> Void)?
    var carouselPhoto = CarouselImageCollectionView()
    let nameLabel = UILabel(text: "",
                            font: .nameHotelFont22(),
                            textColor: .blackColor())
    
    var tagLabelView1 = TagView(name: "")
    var tagLabelView2 = TagView(name: "")
    var tagLabelView3 = TagView(name: "")
    let moreDetailButton = MoreDetailButton(text: R.Strings.Common.moreDetailAboutRoom)
    let costLabel = UILabel(text:"",
                            font: .costTitleFont30(),
                            textColor: .blackColor())
    
    let costDetailLabel = UILabel(text: "",
                                  font: .costDetailFont16(),
                                  textColor: .costDetailColor())
    
    private lazy var chooseRoomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать номер", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .locationButtonTitleColor()
        button.titleLabel?.font = .forwardButtonFont19()
        button.layer.cornerRadius = 15
        button.contentHorizontalAlignment = .center

        button.addTarget(self, action: #selector(toBookingRoomTapped), for: .touchUpInside)
        return button
    }()

    @objc func toBookingRoomTapped() {
        onBookingRoom?()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
    }
}

extension RoomsInfoCell {
    
    private func setupConstraints() {
        carouselPhoto.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabelView1.translatesAutoresizingMaskIntoConstraints = false
        tagLabelView2.translatesAutoresizingMaskIntoConstraints = false
        tagLabelView3.translatesAutoresizingMaskIntoConstraints = false
        moreDetailButton.translatesAutoresizingMaskIntoConstraints = false
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseRoomButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carouselPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            carouselPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            carouselPhoto.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            carouselPhoto.heightAnchor.constraint(equalTo: carouselPhoto.widthAnchor, multiplier: 0.70),
            
            nameLabel.topAnchor.constraint(equalTo: carouselPhoto.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            tagLabelView1.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -8),
            tagLabelView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tagLabelView1.heightAnchor.constraint(equalToConstant: 20),
            
            tagLabelView2.centerYAnchor.constraint(equalTo: tagLabelView1.centerYAnchor),
            tagLabelView2.leadingAnchor.constraint(equalTo: tagLabelView1.trailingAnchor, constant: 8),
            tagLabelView2.heightAnchor.constraint(equalToConstant: 20),
            
            tagLabelView3.topAnchor.constraint(equalTo: tagLabelView1.bottomAnchor, constant: 8),
            tagLabelView3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tagLabelView3.heightAnchor.constraint(equalToConstant: 20),
            
            moreDetailButton.topAnchor.constraint(equalTo: tagLabelView3.bottomAnchor, constant: 8),
            moreDetailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            moreDetailButton.heightAnchor.constraint(equalToConstant: 29),
            
            costLabel.topAnchor.constraint(equalTo: moreDetailButton.bottomAnchor, constant: 16),
            costLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            costLabel.heightAnchor.constraint(equalToConstant: 40),
            
            costDetailLabel.bottomAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: -15),
            costDetailLabel.leadingAnchor.constraint(equalTo: costLabel.trailingAnchor, constant: 16),
            
            chooseRoomButton.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 8),
            chooseRoomButton.heightAnchor.constraint(equalToConstant: 48),
            chooseRoomButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            chooseRoomButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func addSubViews() {
        contentView.addSubview(carouselPhoto)
        contentView.addSubview(nameLabel)
        contentView.addSubview(tagLabelView1)
        contentView.addSubview(tagLabelView2)
        contentView.addSubview(tagLabelView3)
        contentView.addSubview(moreDetailButton)
        contentView.addSubview(costLabel)
        contentView.addSubview(costDetailLabel)
        contentView.addSubview(chooseRoomButton)
    }
}
