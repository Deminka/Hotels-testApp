//
//  BookingDetailsView.swift
//  Hotels
//
//  Created by mac on 02.01.2024.
//

import UIKit

class BookingDetailsView: UIView {
    
    let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 16
        return stack
    }()
        
    let firstStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.departure, rightText: "")
    let secondStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.countryCity, rightText: "")
    let thirdStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.dates, rightText: "")
    let fourthStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.nightsCount, rightText: "")
    let fifthStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.hotel, rightText: R.Strings.nameHotel)
    let sixthStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.room, rightText: "")
    let seventhStack = StackView(leftText: R.Strings.BookingRoomVC.BookingDetailsView.nutrition, rightText: "")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubViews()
        setupConstraints()
        customiseElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookingDetailsView {
    
    private func customiseElements() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        thirdStack.translatesAutoresizingMaskIntoConstraints = false
        fourthStack.translatesAutoresizingMaskIntoConstraints = false
        fifthStack.translatesAutoresizingMaskIntoConstraints = false
        sixthStack.translatesAutoresizingMaskIntoConstraints = false
        seventhStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(firstStack)
        verticalStackView.addArrangedSubview(secondStack)
        verticalStackView.addArrangedSubview(thirdStack)
        verticalStackView.addArrangedSubview(fourthStack)
        verticalStackView.addArrangedSubview(fifthStack)
        verticalStackView.addArrangedSubview(sixthStack)
        verticalStackView.addArrangedSubview(seventhStack)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
