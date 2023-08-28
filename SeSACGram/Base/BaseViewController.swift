//
//  BaseViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
    }
    
    ///addSubView
    func configureView(){
        print("Base ConfigureView")
    }
    
    ///제약조건 등을 설정
    func setConstraints() {
        print("Base setContstraints")
    }
    


}
