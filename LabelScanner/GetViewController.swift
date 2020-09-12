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
            
            let identifier = self.chooseIdentifier(product: product)
            
            
            self.performSegue(withIdentifier: identifier, sender: nil)
            
        }
        
        
    }
    
    // scanLink is "" until ScannerViewController passes a link from the QR Code
    
    var scanLink: String = ""
    
    
    // completionHandler allows for delay to fetch data instead of immediately returning nil if data not fetched quickly
    
    func fetchProductData(completionHandler: @escaping (Product) -> Void){
        
        
        // gets 
        
        let url = URL(string: getLink())!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            if let data = data {
                DispatchQueue.main.async {
                
            do{
                let productData = try JSONDecoder().decode((Product.self), from: data)
                
                completionHandler(productData)
                
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
                }
        }
        }.resume()
    }
    
    
    func getLink() -> String {
        return scanLink
    }
    
    func chooseIdentifier(product: Product) -> String{
        
        var identifier = ""

        
        if(product.numDaysLeft >= 2){
                
            identifier = "goToFreshItemViewController"
            
        } else if(product.numDaysLeft == 1){
            
            identifier = "goToOrangeViewController"
   
        } else if(product.numDaysLeft == 0){
    
            identifier = "goToSpoiledViewController"
            
        }
        
        return identifier
    }
 
    
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "goToFreshItemViewController" {
//             let vc = segue.destination as? FreshItemViewController
//
//            vc?.freshness = "Good to go"
//
//         } else if segue.identifier == "goToOrangeViewController"{
//            let vc = segue.destination as? OrangeViewController
//
//            vc?.freshness = "Meh. Last day"
//
//         } else if segue.identifier == "goToSpoiledViewController"{
//            let vc = segue.destination as? SpoiledViewController
//
//            vc?.freshness = "Time to hit the road."
//
//        }
//
//     }
    
    
    
}
