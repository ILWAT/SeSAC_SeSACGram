//
//  ContentViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
    //MARK: - Properties
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요."
        view.backgroundColor = .lightGray
        return view
    }()
    
    let sampleView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let greenView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    
    
    //Closure 값 전달 - 1
    var completionHandler: ((String) -> Void)?
    
    deinit {
        print("deinit", self)
    }
    
    //MARK: - SettingUI
    override func configureView() {
        super.configureView()
        
        view.addSubview(textField)
        view.addSubview(sampleView)
        view.addSubview(greenView)
        setAnimation()
    }
    
    override func setConstraints() {
        super.setConstraints()
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
        
        sampleView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view)
        }
        greenView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view).offset(80)
        }
        
    }
    
    //MARK: - LifeCycle
    override func viewDidDisappear(_ animated: Bool) {
        guard let inputText = textField.text else {return}
        //Clousure - 2
        completionHandler?(inputText)
        
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper
    func setAnimation(){
        //시작
        sampleView.alpha = 0
        greenView.alpha = 0
        //끝
        UIView.animate(withDuration: 1, delay: 2, options: [.repeat, .autoreverse]) {
            self.sampleView.alpha = 1
            self.sampleView.backgroundColor = .blue
        } completion: { bool in
            self.greenView.alpha = 0.5
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 1.0
            UIView.animate(withDuration: 0.3){
                self.greenView.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 0.5
            UIView.animate(withDuration: 0.3){
                self.greenView.alpha = 1.0
            }
        }
    }

}

