//
//  ViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit
import SeSACFrameWork

//Protocol 값 전달 1.
protocol PassDateDelegate {
    func receiveDate(date: Date)
}

class AddViewController: BaseViewController {
    //MARK: - Properties
    let mainView = AddView()
    
    
    //MARK: - LifeCycle
    //viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
    //super 메서드를 호출하면 내가 쓰려고 했던 뷰를 애플이 정의한 뷰로 덮어쓰기 될 가능성이 높음 -> 부모 메서드 재호출 안하는 것을 권장(애플 공식 문서 권장 사항이기도 함)
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
        
//        override sesacShowAlert(title: <#T##String#>, message: <#T##String#>, buttonTitle: <#T##String#>)
        
        APIService.shared.callRequest()
    }
    
    //viewWillAppear에 addObserver가 불필요하게 Observer 등록이 이루어짐(Push와 같은 viewWillAppear가 계속 이루어지는 상황에는 Observer가 쌓임)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name.selectedImage, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //불필요하게 쌓인 Observer를 제거
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.selectedImage, object: nil)
    }
    

    
    
    //MARK: - setupUI
    override func configureView() {
        super.configureView()
        
        mainView.searchBar.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        mainView.dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
        mainView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonClicked), for: .touchUpInside)
        mainView.titleButton.addTarget(self, action: #selector(titleButtonClicked), for: .touchUpInside)
        mainView.contentButton.addTarget(self, action: #selector(closureButtonClicked), for: .touchUpInside)
    }

    

    
    //MARK: - Helper
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print("selectImageNotification")
        print(notification.userInfo?["name"])
        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    @objc func searchButtonClicked() {
        
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        
//        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
        
        present(SearchViewViewController(), animated: true) //post가 옵저버를 추가하기 전에 일어났던 일이기 때문에 발생했던 일은 신호를 받지 못한다.
    }
    
    @objc func dateButtonClicked(_ sender: UIButton){
        
        //Protocol 값 전달 5.
        let vc = DateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchProtocolButtonClicked(_ sender: UIButton) {
        let vc = SearchViewViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func titleButtonClicked() {
        let vc = TitleViewController()
        
        //Closure - 3
        vc.completionHandler = { text in
            self.mainView.titleButton.setTitle(text, for: .normal)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func closureButtonClicked(_ sener: UIButton){
        let vc = ContentViewController()
        
        vc.completionHandler = { text in
            self.mainView.contentButton.setTitle(text, for: .normal)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }


}

//Protocol 값 전달 4.
extension AddViewController: PassDateDelegate{
    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
    
    
}

extension AddViewController: PassselectedImageProtocol{
    func passImageString(image: String) {
        mainView.photoImageView.image = UIImage(systemName: image)
    }
}

