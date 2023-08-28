//
//  AddView.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit

class AddView: BaseView {
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let searchBar = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    ///addSubView 등을 수행하는 method
    override func configureView(){
        super.configureView()
        self.addSubview(photoImageView)
        self.addSubview(searchBar)
    }
    
    ///뷰의 제약조건을 설정하는 method
    override func setConstraints() { //제약조건
        super.setConstraints()
        print("Add setConstraints")
        photoImageView.snp.makeConstraints { make in
            make.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(self).multipliedBy(0.3)
        }
        
        searchBar.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }
    }
}
