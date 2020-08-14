////
////  ScannedItem.swift
////  LabelScanner
////
////  Created by Grace Ohlsen on 8/10/20.
////  Copyright © 2020 Grace Ohlsen. All rights reserved.
////
//
//import Foundation
//
//struct ScannedItem {
//
//  // what data we are grabbing from JSON web file
//
//  let inventoryId:String
//  let name:String
//  let size:String
//  let unitPrice:String
//  let numInStock:String
//  let numInReorder:String
//
//  // serialization
//
//  enum SerializationError: Error {
//      case missing(String) // data missing
//      case invalid(String, Any) // data doesn't work or isn't right
//  }
//
//    // !!! Come back to here... json[""] needs to match what the data is called in the spreadsheet
//
//  init(json:[String:Any]) throws {
//    guard let inventoryId = json["inventoryId"] as? String else {throw SerializationError.missing("inventoryId is not available")}
//
//    guard let name = json["name"] as? String else {throw SerializationError.missing("name is not available")}
//
//    guard let size = json["size"] as? String else {throw SerializationError.missing("size is not available")}
//
//    guard let unitPrice = json["unitPrice"] as? String else {throw SerializationError.missing("unitPrice is not available")}
//
//    guard let numInStock = json["numInStock"] as? String else {throw SerializationError.missing("numInStock is not available")}
//
//    guard let numInReorder = json["numInReorder"] as? String else{throw SerializationError.missing("numInReorder is not available")}
//
//    self.inventoryId = inventoryId
//    self.name = name
//    self.size = size
//    self.unitPrice = unitPrice
//    self.numInStock = numInStock
//    self.numInReorder = numInReorder
//
//  }
//
//    /// API entry link
//    static let basePath = "https://spreadsheets.google.com/feeds/cells/1piMS47R99IaOf0QepEZ3gkklUDz0ub1c3MoX7MLwquY/od6/public/basic"
//
//    // https://.../basic/R1C1?alt=json (+ add "/\(row)\(column)?alt=json"
//
//    // make one getScannedItem func and call the following methods:
//    // retrieveItemId() -> C1
//    // retrieveItemName() -> C2
//    // retrieveItemSize() -> C3
//    //retrieveItemPrice() -> C4
//    //retrieveItemStock() -> C5
//    //retrieveItemRestock() -> C6
//
//    // delete getScannedItem method
//
//    static func getScannedItem(withItemId itemId:String){
//
//        let id = itemId.suffix(4)
//
//        inventoryId = retrieveItemId(withItemId: String)
//        //C1
//           // retrieveItemName() -> C2
//           // retrieveItemSize() -> C3
//           //retrieveItemPrice() -> C4
//           //retrieveItemStock() -> C5
//           //retrieveItemRestock() -> C6
//
//
//    }
//
//    static func getScannedItem (withItemId itemId:String, completion: @escaping ([ScannedItem]) -> ()){
//        let url = basePath + itemId
//        let request = URLRequest(url: URL(string: url)!)
//
//        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
//
//            var inventoryArray:[ScannedItem] = []
//
//            if let data = data {
//                do{
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
//
//                        // !!! Figure out what to put here and rename it
//
//                        // going through each array of data in json file until you get to the one you want
//
//                        if let dailyForecast = json["daily"] as? [String:Any]{
//                            if let dailyData = dailyForecast["data"] as? [[String:Any]]{
//                                for dataPoint in dailyData {
//                                    if let scannedItemObject = try? ScannedItem(json : dataPoint){
//                                        inventoryArray.append(scannedItemObject)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }catch {
//                    print(error.localizedDescription)
//                }
//            }
//    }
//
//        task.resume()
//}
//}
//
//func retrieveItemId (withItemId itemId:String) -> String{}
//
//
//// so here is my thoughts...
//
//// get item from qr code
//
//// then after it's decided which view controller,
//
//// get info from google spreadsheet using itemId
//
//// should be named under GetViewController
