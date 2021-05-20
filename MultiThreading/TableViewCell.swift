//
//  TableViewCell.swift
//  MultiThreading
//
//  Created by mdy on 20.05.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var imageCell: UIImageView!
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  private var path: String!
  
  override func prepareForReuse() {
    imageCell.image = nil
  }
  
  func configImgView(str: String) {
    
    self.path = str
    indicator.startAnimating()
    //print(str)
    //print(URL(string: str))
    
    DispatchQueue.global(qos: .userInitiated).async {
      
      if let url = URL(string: str),
         let data = try? Data(contentsOf: url),
         let img = UIImage(data: data),
         str == self.path {
        DispatchQueue.main.async {
          self.imageCell.image = img
          self.indicator.stopAnimating()
        }
        
      }
    }
  }


  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
