//
//  DateView.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit
import SnapKit

class DateView: BaseView{
    let datePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    override func configureView() {
        addSubview(datePicker)
    }
    
    override func setConstraints() {
        datePicker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
