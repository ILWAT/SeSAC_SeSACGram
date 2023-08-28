//
//  ViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    //viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
    //super 메서드를 호출하면 내가 쓰려고 했던 뷰를 애플이 정의한 뷰로 덮어쓰기 될 가능성이 높음 -> 부모 메서드 재호출 안하는 것을 권장(애플 공식 문서 권장 사항이기도 함)
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
    }
    
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print("selectImageNotification")
        print(notification.userInfo?["name"])
        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    
    override func configureView() {
        super.configureView()
        mainView.searchBar.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }

    

    
    @objc func searchButtonClicked() {
        
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()])
        
        present(SearchViewViewController(), animated: true)
    }


}

