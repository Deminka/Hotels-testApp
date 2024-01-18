//
//  TagView.swift
//  Hotels
//
//  Created by mac on 28.12.2023.
//

import UIKit

class TagView: UIView {

    let tagLabel = UILabel(text: "",
                           font: .ratingFont16(),
                           textColor: .tagLabelColor(),
                           backgrounColor: .tagLabelBackgroundColor())

    init(name: String) {
        super.init(frame: .zero)
        addSubViews()
        setupConstraints()
        tagLabel.text = name
    }

    private func addSubViews() {
        addSubview(tagLabel)
    }
    
    private func setupConstraints() {
        
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tagLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

