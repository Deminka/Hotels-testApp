//
//  FirstTouristView.swift
//  Hotels
//
//  Created by mac on 03.01.2024.
//

import UIKit

class FirstTouristView: UIView {

    var doSomthing: (() -> Void)?

    private var maximizeViewConstraints: NSLayoutConstraint!
    private var minimizeViewConstraints: NSLayoutConstraint!
    var currentSizeView = true
    
    let touristLabel = UILabel(text: R.Strings.BookingRoomVC.TouristsCount.firstTourist,
                               font: .font22(),
                               textColor: .black,
                               backgrounColor: .clear)
    private let touristButton = TouristButton()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    let grayView1 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.FirstTouristView.firstName)
    let grayView2 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.FirstTouristView.lastName)
    let grayView3 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.FirstTouristView.birthDay, keyboardType: .numberPad)
    let grayView4 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.FirstTouristView.citizenship)
    let grayView5 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.FirstTouristView.passportNumber, keyboardType: .numberPad)
    let grayView6 = GrayBackgroundView(placeHolder: R.Strings.BookingRoomVC.FirstTouristView.validatePeriodPassport, keyboardType: .numberPad)
    
    init(viewName: String, fullView: Bool) {
        super.init(frame: .zero)
        
        touristLabel.text = viewName
        currentSizeView = fullView
        
        backgroundColor = .white
        addSubViews()
        setupConstraints()
        customiseElements()
        
        touristButton.addTarget(self, action: #selector(minimizeView), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func minimizeView() {
        if let action = doSomthing {
            action()
        }
//        } else {
//            defaultAction()
//        }
    }

//    private func defaultAction() {
//        currentSizeView.toggle()
//
//        let imageSize: UIImage?
//        if currentSizeView {
//            imageSize = R.Images.upArrow
//            minimizeViewConstraints.isActive = false
//            maximizeViewConstraints.isActive = true
//            stackView.isHidden = false
//
//        } else {
//            imageSize = R.Images.downArrow
//            minimizeViewConstraints.isActive = true
//            maximizeViewConstraints.isActive = false
//            stackView.isHidden = true
//        }
//        touristButton.imgView.image = imageSize
//    }

    func setButtonImage(image: UIImage) {
        touristButton.imgView.image = image
    }

    func customiseElements() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        touristLabel.translatesAutoresizingMaskIntoConstraints = false
        touristButton.translatesAutoresizingMaskIntoConstraints = false
        grayView1.translatesAutoresizingMaskIntoConstraints = false
        grayView2.translatesAutoresizingMaskIntoConstraints = false
        grayView3.translatesAutoresizingMaskIntoConstraints = false
        grayView4.translatesAutoresizingMaskIntoConstraints = false
        grayView5.translatesAutoresizingMaskIntoConstraints = false
        grayView6.translatesAutoresizingMaskIntoConstraints = false
        
        touristButton.imgView.image = currentSizeView ? R.Images.upArrow : R.Images.downArrow
    }
    
    func addSubViews() {
        addSubview(touristLabel)
        addSubview(touristButton)
        addSubview(stackView)
        stackView.addArrangedSubview(grayView1)
        stackView.addArrangedSubview(grayView2)
        stackView.addArrangedSubview(grayView3)
        stackView.addArrangedSubview(grayView4)
        stackView.addArrangedSubview(grayView5)
        stackView.addArrangedSubview(grayView6)
    }
    
    func setupConstraints() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        maximizeViewConstraints = heightAnchor.constraint(equalToConstant: 430)
        minimizeViewConstraints = heightAnchor.constraint(equalToConstant: 58)
        
        if currentSizeView {
            maximizeViewConstraints.isActive = true
        } else {
            minimizeViewConstraints.isActive = true
            stackView.isHidden = true
        }
        
        NSLayoutConstraint.activate([
            touristLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            touristLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            touristButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            touristButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: touristLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    //MARK: func touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stackView.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        backgroundColor = nil
    }
}





