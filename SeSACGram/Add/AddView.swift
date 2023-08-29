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
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let searchBar = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    let dateButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle(DateFormatter.today(), for: .normal)
        return button
    }()
    
    let searchProtocolButton = {
        let view = UIButton()
        view.backgroundColor = .systemBrown
        return view
    }()
    
    let titleButton = {
        let button = UIButton()
        button.setTitle("오늘의 사진", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    let contentButton = {
        let button = UIButton()
        button.setTitle("클로저 활용", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    ///addSubView 등을 수행하는 method
    override func configureView(){
        super.configureView()
        self.addSubview(photoImageView)
        self.addSubview(searchBar)
        self.addSubview(dateButton)
        self.addSubview(searchProtocolButton)
        self.addSubview(titleButton)
        self.addSubview(contentButton)
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
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        searchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.leading.equalTo(photoImageView)
        }
        
        titleButton.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        contentButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
}
