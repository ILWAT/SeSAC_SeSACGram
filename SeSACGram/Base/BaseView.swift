//
//  BaseView.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///addSubView
    func configureView(){
        self.backgroundColor = .white
        print("Base ConfigureView")
    }
    ///제약조건 등을 설정
    func setConstraints() {
        print("Base setContstraints")
    }
    

}
