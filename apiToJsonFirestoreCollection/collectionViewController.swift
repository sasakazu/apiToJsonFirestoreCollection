//
//  collectionViewController.swift
//  apiToJsonFirestoreCollection
//
//  Created by 笹倉一也 on 2021/09/03.
//

import UIKit
import Firebase
import SDWebImage

class collectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    private var titledata: [String] = []
    private var imageItems: [String] = []
    var imageData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
                self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        let db = Firestore.firestore()
        let user = (Auth.auth().currentUser?.uid)!

        db.collection("users").document(user).collection("posts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {

                    
                    print("\(document.documentID) => \(String(describing: document.data()["title"]))")

//                    titleを取得
                    self.titledata = querySnapshot!.documents.compactMap { $0.data()["title"] as? String }
                    
                    self.imageItems = querySnapshot!.documents.compactMap { $0.data()["smallImageUrl"] as? String }
                    
                    print(self.imageItems)
                    
//
                }
                    

                          // コレクションビューを更新
                          self.collectionView.reloadData()
                    
                    
                }
            }
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        postの数分
        return titledata.count
        
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
//        cell.label.text = titledata[indexPath.row]
        
        self.imageData = imageItems[indexPath.row]
            
        cell.collectionImage.sd_setImage(with: URL(string:imageData), placeholderImage: UIImage(named: "placeholder.png"))

            
        
        return cell
        
        
    }
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
  


}
