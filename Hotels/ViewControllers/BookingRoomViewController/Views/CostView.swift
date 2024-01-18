//
//  CostView.swift
//  Hotels
//
//  Created by mac on 03.01.2024.
//

import UIKit

class CostView: UIView {
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 30
        return stack
    }()
    
    let stack1 = StackView(leftText: R.Strings.BookingRoomVC.CostView.tour, rightText: "", rightLabelAlignment: .right)
    let stack2 = StackView(leftText: R.Strings.BookingRoomVC.CostView.fuel, rightText: "", rightLabelAlignment: .right)
    let stack3 = StackView(leftText: R.Strings.BookingRoomVC.CostView.service, rightText: "", rightLabelAlignment: .right)
    
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

extension CostView {
    
    private func customiseElements() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stack1.translatesAutoresizingMaskIntoConstraints = false
        stack2.translatesAutoresizingMaskIntoConstraints = false
        stack3.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews() {
        
        addSubview(stackView)
        stackView.addArrangedSubview(stack1)
        stackView.addArrangedSubview(stack2)
        stackView.addArrangedSubview(stack3)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}


