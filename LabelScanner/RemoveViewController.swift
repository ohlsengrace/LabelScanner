//
//  RemoveViewController.swift
//  LabelScanner
//
//  Created by Grace Ohlsen on 8/12/20.
//  Copyright © 2020 Grace Ohlsen. All rights reserved.
//

import UIKit

class RemoveViewController: UIViewController {

    @IBOutlet weak var numInStock: UITextView!
    
    @IBOutlet weak var numToRemove: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        let removeNumber: Int? = Int(numToRemove.text)
        let stockNumber: Int? = Int(numInStock.text)
        
        guard let remove = removeNumber else {
            print("Exiting Function addButtonTapped nil remove")
            return
        }
        guard let stock = stockNumber else {
            print("Exiting Function addButtonTapped nil stock")
            return
        }
        
        if(remove < stock){
        numToRemove.text = "\(remove + 1)"
        }
    }
    
    @IBAction func subtractButtonTapped(_ sender: UIButton) {
        
        let removeNumber: Int? = Int(numToRemove.text)
        
            
            guard let remove = removeNumber else {
                print("Exiting Function subButtonTapped nil remove")
                return
            }
            
            if(remove > 0){
            numToRemove.text = "\(remove - 1)"
            }
        }
        
    
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        
        let stockNum: Int? = Int(numInStock.text)
        let removeNum: Int? = Int(numToRemove.text)
        
        guard let stock = stockNum else {
            print("Exiting Function updateButtonTapped nil remove")
            return
        }
        guard let remove = removeNum else {
            print("Exiting Function updateButtonTapped nil stock")
            return
        }
        
        numInStock.text = "\(stock - remove)"
        numToRemove.text = "0"
        
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
