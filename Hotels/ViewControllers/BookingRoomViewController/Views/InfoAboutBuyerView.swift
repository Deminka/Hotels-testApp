//
//  InfoAboutBuyerView.swift
//  Hotels
//
//  Created by mac on 02.01.2024.
//

import UIKit

class InfoAboutBuyerView: UIView {
    
    let infoAboutBuyerlabel = UILabel(text: R.Strings.BookingRoomVC.InfoAboutBuyerView.infoAboutBuyer, font: .nameHotelFont22(), textColor: .black)
    let grayView1 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.InfoAboutBuyerView.phoneNumber, keyboardType: .phonePad)
    let grayView2 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.InfoAboutBuyerView.mail, keyboardType: .emailAddress, autocapitalization: .none)
    let infoLabel = UILabel(text: R.Strings.BookingRoomVC.infoText, font: .font14(), textColor: R.Colors.infotextColor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubViews()
        setupConstraints()
        customiseElements()
//        grayView1.textField.delegate = self
//        grayView2.textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoAboutBuyerView {
    
    private func addSubViews() {
        addSubview(infoAboutBuyerlabel)
        addSubview(grayView1)
        addSubview(grayView2)
        addSubview(infoLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            infoAboutBuyerlabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            infoAboutBuyerlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infoAboutBuyerlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            infoAboutBuyerlabel.heightAnchor.constraint(equalToConstant: 25),
            
            grayView1.topAnchor.constraint(equalTo: infoAboutBuyerlabel.bottomAnchor, constant: 15),
            grayView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            grayView1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            grayView2.topAnchor.constraint(equalTo: grayView1.bottomAnchor, constant: 8),
            grayView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            grayView2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            infoLabel.topAnchor.constraint(equalTo: grayView2.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            infoLabel.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    private func customiseElements() {
        infoAboutBuyerlabel.translatesAutoresizingMaskIntoConstraints = false
        grayView1.translatesAutoresizingMaskIntoConstraints = false
        grayView1.layer.cornerRadius = 10
        grayView2.translatesAutoresizingMaskIntoConstraints = false
        grayView2.layer.cornerRadius = 10
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: func touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
