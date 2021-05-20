//
//  Data.swift
//  LeroyMerlin
//
//  Created by mdy on 26.04.2021.
//

import UIKit

class DataImgSet {
    
    static let shared = DataImgSet()
    
    var imageStr: [String] = []
    
    private init() { initImageStr() }
    
    func initImageStr() {
        guard let csvPath = Bundle.main.path(forResource: "ItemLeroy", ofType: "csv") else { return }
        do {
            let csvData = try String(contentsOfFile: csvPath)
//            print(csvData)
            imageStr = csvData.components(separatedBy: "\r\n")
          
//            let parsedCSV: [[String]] = csvData.components(separatedBy: "\r\n")
//                                        .map{ $0.components(separatedBy: ";") }
//
//            for elem in parsedCSV {
//
//                guard let url = URL(string: elem[1])  else { break }
//
//                guard let data = try? Data(contentsOf: url) else { break }
     //           self.imageStr.append(elem[0])
//
     
        }
         catch {
            print(error)
        }

    }
   
    
}
