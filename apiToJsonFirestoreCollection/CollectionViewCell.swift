//
//  CollectionViewCell.swift
//  apiToJsonFirestoreCollection
//
//  Created by 笹倉一也 on 2021/09/04.
//

import UIKit
import Firebase

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var collectionImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    
//        let user = Auth.auth().currentUser
//
//        let db = Firestore.firestore()
//
//        db.collection("users").document(user!.uid).collection("posts").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//
//                    self.label.text = document.data()["title"] as? String
//
//                    print("\(document.documentID) => \(String(describing: document.data()["title"]))")
//
//
//                }
//            }
//    }
    }
    
    
//    var recip:String {
//            didSet {
//                label.text = recip?.title
//                directed.text = recip?.artistName
//                let url = URL(string: recip?.smallImageUrl ?? "")
//                do {
//                    let data = try Data(contentsOf: url!)
//                    let image = UIImage(data: data)
//                    testImage.image = image
//                }catch let err {
//                    print("Error : \(err.localizedDescription)")
//                }
//            }
    }
    
    


//}
