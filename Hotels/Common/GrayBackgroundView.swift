//
//  GrayBackgroundView.swift
//  Hotels
//
//  Created by mac on 02.01.2024.
//

import UIKit

class GrayBackgroundView: UIView, UITextFieldDelegate {
            
    var litleLabel = UILabel(text: "ggggg", font: .font12(), textColor: .litleTextColor(), backgrounColor: .clear)
    let textField = UITextField()
    var placeHolderText = ""
    
    init(placeHolder: String, keyboardType: UIKeyboardType = .default, autocapitalization: UITextAutocapitalizationType = .words ) {
        super.init(frame: .zero)
        self.textField.placeholder = placeHolder
        placeHolderText = placeHolder
        self.textField.textColor = R.Colors.bigTextColor
        litleLabel.isHidden = true
        textField.keyboardType = keyboardType
        textField.autocorrectionType = .no
        textField.autocapitalizationType = autocapitalization
        
        backgroundColor = R.Colors.aboutBuyerBackgroundColor
        addSubViews()
        setupConstraints()
        customiseElements()
        textField.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GrayBackgroundView {
    private func addSubViews() {
        addSubview(litleLabel)
        addSubview(textField)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            litleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            litleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            litleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func customiseElements() {
        litleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
    }
}
extension GrayBackgroundView {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let currentText = (textField.text ?? "")

        if !currentText.isEmpty {
            litleLabel.isHidden = false
            litleLabel.text = placeHolderText
        } else {
            litleLabel.isHidden = true
        }
    }
}
