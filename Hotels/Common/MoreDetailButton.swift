//
//  MoreDetailButton.swift
//  Hotels
//
//  Created by mac on 10.01.2024.
//

import UIKit

final class MoreDetailButton: UIButton {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.rightArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    init(text: String){
        super.init(frame: .zero)
        
        self.label.text = text
        
        addViews()
        setupConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MoreDetailButton {
    
    func addViews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    func setupConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func configure() {
        
        backgroundColor = R.Colors.arrowBackgroundColor
        layer.cornerRadius = 5
        label.textColor = R.Colors.arrowColor
        label.font = .font16()
        iconView.tintColor = R.Colors.arrowColor
        makeSystem(self)
    }
}
