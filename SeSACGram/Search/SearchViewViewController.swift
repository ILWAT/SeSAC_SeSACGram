//
//  SearchViewViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit
import Kingfisher

protocol PassselectedImageProtocol: AnyObject {
    func passImageString(image: String)
}

class SearchViewViewController: BaseViewController {

    let mainView = SearchView()
    
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    var imageURLArray: [String] = []
    
    weak var delegate: PassselectedImageProtocol?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addObserver보다 post가 먼저 신호를 보내면 addObserver가 신호를 받지 못한다!
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKeyword"), object: nil)
        
        //Asks UIKit to make this object the first responder in its window.
        //서치바가 있는 뷰가 뜨면 커서와 키보드가 등장
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
    }
    
    deinit {
        print("deinit", self)
    }
    
    override func configureView() {
        super.configureView()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }

    
    @objc func recommandKeywordNotificationObserver(notification: NSNotification) {
        print("recommandKeywordNotificationObserver")
    }
    
}

extension SearchViewViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //키보드 다운시키는 방법중 하나인 UISearchBar의 resignFirstResponder() 사용
        mainView.searchBar.resignFirstResponder()
        
        imageURLArray.removeAll()
        
        guard let inputText = mainView.searchBar.text else {return}
        
        APIService.shared.unsplashSearchImage(text: inputText) { reslut in
            DispatchQueue.global().async {
                for item in reslut.results{
                    self.imageURLArray.append(item.urls.full)
                }
                self.mainView.collectionView.reloadData()
            }
        }
    }
}


extension SearchViewViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLArray.count // imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell() }
        
//        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        cell.imageView.kf.setImage(with: URL(string: imageURLArray[indexPath.item]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(imageList[indexPath.item])
        
        //Notification을 통한 값 전달
//        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"])
        
        //delegate를 통한 값 전달
//        delegate?.passImageString(image: imageList[indexPath.item])
        delegate?.passImageString(image: imageURLArray[indexPath.item])
        
        dismiss(animated: true)
    }
    
}
