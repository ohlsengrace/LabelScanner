//
//  GetViewController.swift
//  LabelScanner
//
//  Created by Grace Ohlsen on 7/20/20.
//  Copyright © 2020 Grace Ohlsen. All rights reserved.
//

import UIKit

class GetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(scanLink)
        
        // where issues occur!!
        
        fetchProductData { (product) in
            
            print(product.name!)
            print(product.size!)
            print(product.numDaysLeft!)
            
        }
        
    }
    
    // scanLink is "" until ScannerViewController passes a link from the QR Code
    
    var scanLink: String = ""
    
    
    
    // completionHandler allows for delay to fetch data instead of immediately returning nil if data not fetched quickly
    
    func fetchProductData(completionHandler: @escaping (Product) -> Void){
        
        
        // gets 
        
        let url = URL(string: getLink())!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do{
                let productData = try JSONDecoder().decode((Product.self), from: data)
                
                completionHandler(productData)
                
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
    func getLink() -> String {
        return scanLink
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
