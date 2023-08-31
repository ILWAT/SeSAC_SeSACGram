//
//  HomeViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/31.
//

import UIKit

//AnyObject : Class에만 상속을 구현할 수 있도록 제한하는 것
//The protocol to which all classes implicitly conform. : 모든 클래스가 암시적으로 준수하는 프로토콜.
protocol HomeViewProtocol: AnyObject{
    func didSelecteItemAt(indexPath: IndexPath)
}

class HomeViewController: BaseViewController{
    
    
    //MARK: - LifeCycle
    override func loadView() {
        let view = HomeView()
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
    }
    override func configureView() {
        
    }
}


extension HomeViewController: HomeViewProtocol{
    func didSelecteItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }
}
