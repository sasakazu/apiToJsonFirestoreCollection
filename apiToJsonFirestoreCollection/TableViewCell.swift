//
//  TableViewCell.swift
//  apiToJsonFirestoreCollection
//
//  Created by 笹倉一也 on 2021/09/03.
//

import UIKit
import Firebase

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var recip: SerchBookKList.ItemDic.ItemInfo? {
            didSet {
                testLabel.text = recip?.title
                let url = URL(string: recip?.smallImageUrl ?? "")
                do {
                    let data = try Data(contentsOf: url!)
                    let image = UIImage(data: data)
                    testImage.image = image
                }catch let err {
                    print("Error : \(err.localizedDescription)")
                }
            }
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        let user = Auth.auth().currentUser
        
        db.collection("users").document(user!.uid).collection("posts").addDocument(data:[
            "title": recip?.title ?? "",
            "smallImageUrl": recip?.smallImageUrl ?? "",
            "artistName": recip?.artistName ?? ""
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
        
        }
        
    }
    
    
    
    }
    
    
}
