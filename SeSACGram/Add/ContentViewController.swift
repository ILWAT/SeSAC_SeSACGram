//
//  ContentViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요."
        view.backgroundColor = .lightGray
        return view
    }()
    
    //Closure 값 전달 - 1
    var completionHandler: ((String) -> Void)?
    
    override func configureView() {
        super.configureView()
        view.backgroundColor = .white
        view.addSubview(textField)
    }
    
    override func setConstraints() {
        super.setConstraints()
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        guard let inputText = textField.text else {return}
        //Clousure - 2
        completionHandler?(inputText)
        
        navigationController?.popViewController(animated: true)
    }
}

