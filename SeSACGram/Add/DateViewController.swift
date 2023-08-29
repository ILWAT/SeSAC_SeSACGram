//
//  DateViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController{
    let mainView = DateView()
    
    //Protocol 값 전달 2.
    var delegate: PassDateDelegate?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Protocol 값 전달 3.
        delegate?.receiveDate(date: mainView.datePicker.date)
    }
    
}
