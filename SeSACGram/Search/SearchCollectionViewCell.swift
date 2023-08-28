//
//  SearchViewCollectionViewCell.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCeoll{
    
    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        return view
    }()
    
    override func configureView() {
        contentView.addSubview(imageView)
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
