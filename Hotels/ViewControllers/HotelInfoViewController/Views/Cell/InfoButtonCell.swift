//
//  InfoButtonCell.swift
//  Hotels
//
//  Created by mac on 11.09.2023.
//

import UIKit

class InfoButtonCell: UITableViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.setupColor(color: .blackColor())
        image.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "SF Pro Display", size: 16)
        title.textColor = #colorLiteral(red: 0.1725490196, green: 0.1882352941, blue: 0.2078431373, alpha: 1)
        return title
    }()
    let aboutHotelLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "SF Pro Display", size: 14)
        title.textColor = #colorLiteral(red: 0.5098039216, green: 0.5294117647, blue: 0.5882352941, alpha: 1)
        return title
    }()

    let forwardImage: UIImageView = {
        var imageView = UIImageView()
        let image = UIImage(named: "Icons")
        imageView = UIImageView(image: image)
        imageView.setupColor(color: .blackColor())
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutHotelLabel.translatesAutoresizingMaskIntoConstraints = false
        forwardImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(aboutHotelLabel)
        contentView.addSubview(forwardImage)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            aboutHotelLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            aboutHotelLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            forwardImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            forwardImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
