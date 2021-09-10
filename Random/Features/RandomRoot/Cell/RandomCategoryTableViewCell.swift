//
//  RandomCategoryTableViewCell.swift
//  Random
//
//  Created by Andrey Dorofeev on 06.09.2021.
//

import Coordinators
import UIKit

private let yOffset: CGFloat = 4.0
private let xOffset: CGFloat = 16.0

class RandomCategoryTableViewCell: CTableViewCell<RandomCategory> {
    
    lazy var categoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onCategorySelected), for: .touchUpInside)
        return button
    }()
    
    override var item: RandomCategory? {
        didSet {
            categoryButton.setTitle(item?.name, for: .normal)
        }
    }
    
    override func setupStyle() {
        super.setupStyle()
        categoryButton.setTitleColor(.black, for: .normal)
    }
    
    override func setupLayout() {
        super.setupLayout()
        selectionStyle = .none
        
        addSubview(categoryButton)
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: yOffset),
            categoryButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: yOffset),
            categoryButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: xOffset),
            categoryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: xOffset),
            categoryButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
    
    @objc private func onCategorySelected() {
        item?.onSelected()
    }
}
