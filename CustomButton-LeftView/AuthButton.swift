//
//  AuthButton.swift
//  CustomButton-LeftView
//
//  Created by Muller Alexander on 01.05.2022.
//

import UIKit

class AuthButton: UIControl {
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .label
        $0.font = .preferredFont(forTextStyle: .headline)
        return $0
    }(UILabel(frame: .zero))
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView(image: nil))
    
    override var isHighlighted: Bool {
        didSet {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: isHighlighted ? 0.2 : 0.5, delay: 0) {
                self.alpha = self.isHighlighted ? 0.4 : 1
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: UIView.noIntrinsicMetric, height: 56)
    }
    
    func configure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthButton {
    
    private func setupConstraints() {
        addSubview(titleLabel)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            { $0.priority = .defaultHigh; return $0 }(titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: imageView.trailingAnchor, constant: 16)),
            
            { $0.priority = .defaultHigh; return $0 }(trailingAnchor.constraint(greaterThanOrEqualTo: imageView.trailingAnchor, constant: 16)),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension AuthButton {
    
    private func setupApperance() {
        layer.cornerCurve = .continuous
        layer.cornerRadius = intrinsicContentSize.height / 2
        layer.borderColor = UIColor.label.cgColor
        layer.borderWidth = 1
    }
}
