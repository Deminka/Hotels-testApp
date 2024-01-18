//
//  ForwardButtonView.swift
//  Hotels
//
//  Created by mac on 12.09.2023.
//

import UIKit

class ForwardButtonView: UIView {

    var onRoom: (() -> Void)?
    
    lazy var forwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .locationButtonTitleColor()
        button.titleLabel?.font = .forwardButtonFont19()
        button.layer.cornerRadius = 15
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(toRoomsInfoTapped), for: .touchUpInside)
        return button
    }()
    
    init(titleButton: String) {
        super.init(frame: .zero)
        
        forwardButton.setTitle(titleButton, for: .normal)
        backgroundColor = .white
        setupConstraints()
    }
    
    @objc func toRoomsInfoTapped() {
        onRoom?()
    }
    
    private func setupConstraints() {
        addSubview(forwardButton)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forwardButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            forwardButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forwardButton.heightAnchor.constraint(equalToConstant: 48),
            forwardButton.widthAnchor.constraint(equalToConstant: 343)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
