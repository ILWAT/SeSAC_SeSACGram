//
//  TitleViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
    //MARK: - Properties
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요."
        return view
    }()
    
    //Closure 값 전달 - 1
    var completionHandler: ((String) -> Void)?
    
    deinit {
        print("deinit", self)
    }
    
    //MARK: - LifeCycle
    override func configureView() {
        super.configureView()
        view.backgroundColor = .white
        
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
    }
    
    override func setConstraints() {
        super.setConstraints()
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        guard let inputText = textField.text else {return}
//        //Clousure - 2
//        completionHandler?(inputText)
//    }
    
    
    //MARK: - Helper
    @objc func doneButtonClicked(_ sender: UIButton){
        guard let inputText = textField.text else {return}
        //Clousure - 2
        completionHandler?(inputText)
    }
}
