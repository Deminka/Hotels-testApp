//
//  StackView.swift
//  Hotels
//
//  Created by mac on 02.01.2024.
//

import UIKit

class StackView: UIStackView {
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.font = .locationTitleFont14()
        label.textColor = .tagLabelColor()
        label.textAlignment = .left
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.font = .locationTitleFont14()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    init(leftText: String, rightText: String, rightLabelAlignment: NSTextAlignment = .left, rightTextColor: UIColor = .black) {
        super.init(frame: .zero)
        
        self.leftLabel.text = leftText
        self.rightLabel.text = rightText
        self.rightLabel.textAlignment = rightLabelAlignment
        self.rightLabel.textColor = rightTextColor
        axis = .horizontal
        spacing = 15
        
        addView()
        customiseElements()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StackView {
    private func addView() {
        addArrangedSubview(leftLabel)
        addArrangedSubview(rightLabel)
    }
    
    private func customiseElements() {
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
