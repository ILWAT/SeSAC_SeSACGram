//
//  SearchViewViewController.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/28.
//

import UIKit

class SearchViewViewController: BaseViewController {

    let mainView = SearchView()
    
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addObserver보다 post가 먼저 신호를 보내면 addObserver가 신호를 받지 못한다!
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKeyword"), object: nil)
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


extension SearchViewViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(imageList[indexPath.item])
        
        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"])
        dismiss(animated: true)
    }
    
}
