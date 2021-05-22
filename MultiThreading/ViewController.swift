//
//  ViewController.swift
//  MultiThreading
//
//  Created by mdy on 20.05.2021.
//

import UIKit


class ViewController: UIViewController {

  @IBOutlet weak var tableView: TableView! {
    didSet {
      tableView.delegate = self
      tableView.dataSource = self
    }
  }
  
  var imageSet = DataImgSet.shared.imageStr
    
  override func viewDidLoad() {
    super.viewDidLoad()
    let searchCtrl = UISearchController(searchResultsController: nil)
    navigationItem.searchController = searchCtrl
    
    //print(navigationItem.title)
    //print(navigationController)
    
    //imageSet.forEach { print($0) }
    
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return imageSet.count - 1
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(300)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                for: indexPath) as! TableViewCell
//    let imgName = "0\(indexPath.row).square"
//    if let sysImg = UIImage(systemName: imgName) {
//      cell.imageCell.image = sysImg }
    
    cell.configImgView(str: imageSet[indexPath.row])
    
    return cell
  
  }
  
  
}
