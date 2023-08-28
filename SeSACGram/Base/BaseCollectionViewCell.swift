//
//  BaseCollectionViewCell.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit

class BaseCollectionViewCeoll: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() { }
    
    func setConstraints() { }
    
}
