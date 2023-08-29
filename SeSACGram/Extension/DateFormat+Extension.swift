//
//  DateFormat+Extension.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import Foundation

extension DateFormatter {
    
    static let format = {
        let format = DateFormatter()
        format.dateFormat = "yy년 mm월 dd일"
        return format
    }()
    
    ///현재의 날짜를 유동적으로 String으로 전달하는 메서드
    static func today() -> String{
        return format.string(from: Date())
    }
    
    ///특정 Date를 기점으로 문자열로 전달하는 메서드
    static func convertDate(date: Date) -> String {
        return format.string(from: date)
    }
}
