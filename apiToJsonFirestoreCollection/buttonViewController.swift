//
//  buttonViewController.swift
//  apiToJsonFirestoreCollection
//
//  Created by 笹倉一也 on 2021/09/03.
//

import UIKit

class buttonViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var recips = [SerchBookKList]()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        getRApi()
        
        // Do any additional setup after loading the view.
    }
    
    private func getRApi(){

        
        guard let url = URL(string:"https://app.rakuten.co.jp/services/api/BooksDVD/Search/20170404?format=json&artistName=%E5%8C%97%E9%87%8E%E6%AD%A6&booksGenreId=003&applicationId=1024730205059605378")

           else {return}

           let task = URLSession.shared.dataTask(with: url) { (data, response, err)in
               if let err = err {
                   print("情報の取得に失敗しました。:", err)
                   return
               }
               if let data = data{
                   do{
                       let resultList = try JSONDecoder().decode(SerchBookKList.self, from: data)
                       self.recips = [resultList]

                       DispatchQueue.main.async {
                                              self.tableview.reloadData()
                                          }
                    print("json: ", resultList)

                   }catch(let err){
                        print("情報の取得に失敗しました。:", err)

                   }
               }
           }
           task.resume()
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 80
       }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if (recips.count == 0) {
                          return recips.count
                      } else {
                        return recips[0].Items?.count ?? 0
            }
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        


        cell.recip = recips[0].Items?[indexPath.row].Item

        return cell

    }
    
    
}
