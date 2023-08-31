//
//  DateViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController{
    //MARK: - Properties
    let mainView = DateView()
    
    //Protocol 값 전달 2.
    var delegate: PassDateDelegate?
    
    
    //MARK: - LifeCycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit", self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Protocol 값 전달 3.
        delegate?.receiveDate(date: mainView.datePicker.date)
    }
    
}
