//
//  PlaceDescriptionLibrary.swift
//  GeoPlaceDescription
//
//  Created by hjshah2 on 2/24/17.
//  Copyright © 2017 hjshah2. All rights reserved.
//

import Foundation

public class PlaceDescriptionLibrary{
    
    let pdo1: PlaceDescription = PlaceDescription()
    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    var placeNames:[String] = [String]()
    static var id:Int = 0
    let urlString:String = "http://127.0.0.1:8090"
    var url:String
    public init(){
        self.url = urlString
        if let jsonpath = Bundle.main.path(forResource: "places", ofType: "json"){
            do{
                let jdata = try Data(contentsOf: URL(fileURLWithPath: jsonpath), options: .alwaysMapped)
                let jsonObj = JSON(data: jdata)
                if jsonObj != JSON.null{
                    for (key,value):(String, JSON) in jsonObj {
                        print("/n/nkey:"+key)
                        
//                        let straddt = "{\"addressTitle\":"+value["address-title"].string!
//                        let stradds = ",\"addressStreet\":"+value["address-street"].string!
//                        let strelev = ",\"elevation\":" + String(value["elevation"].float!)
//                        let strlat = ",\"latitude\":" + String(value["latitude"].float!)
//                        let strlong = ",\"longitude\":" + String(value["longitude"].float!)
//                        let strnam = ",\"name\":"+value["name"].string!
//                        let strdes = ",\"description\":"+value["description"].string!
//                        let strcate = ",\"category\":"+value["category"].string!+"}"
//                        let str = straddt + stradds + strelev + strlat + strlong + strnam + strdes + strcate
//                        let place1: PlaceDescription = PlaceDescription(jsonStr: str)
                        let pdo: PlaceDescription = PlaceDescription(name: value["name"].string!, description: value["description"].string!, category: value["category"].string!, addressTitle: value["address-title"].string!, addressStreet: value["address-street"].string!, elevation: value["elevation"].double!, latitude: value["latitude"].double!, longitude: value["longitude"].double!)
                        places[key] = pdo
                    }
                }
                else{
                    print("Could not get json from file, make sure that file contains valid JSON.")
                }
            }catch let error {
                print(error.localizedDescription)
            }
        }
        else{
            print("Name of file is invalid.")
        }
        
        
//        let place1: PlaceDescription = PlaceDescription(jsonStr:"{\"addressTitle\":\"ASU West Campus\",\"addressStreet\":\"13591 N 47th Ave$Phoenix AZ 85051\",\"elevation\":1100.0,\"latitude\":33.608979,\"longitude\":-112.159469,\"name\":\"ASU-West\",\"description\":\"Home of ASU's Applied Computing Program\",\"category\":\"School\"}")
//        
//        let place2: PlaceDescription = PlaceDescription(jsonStr:"{\"addressTitle\":\"University of Alaska at Anchorage\",\"addressStreet\":\"290 Spirit Dr$Anchorage AK 99508\",\"elevation\":0.0,\"latitude\": 61.189748,\"longitude\":-149.826721,\"name\":\"UAK-Anchorage\",\"description\":\"University of Alaska's largest campus\",\"category\":\"School\"}")
//        
//        places = ["ASU-West":place1, "UAK-Anchorage":place2]
        placeNames = Array(places.keys)
        
    }
    
    func getPlaceTitles() -> [String]{
        return placeNames
    }
    
    func getPlaceDescription(placeTitle : String) -> PlaceDescription{
        return places[placeTitle]!
    }
    func remove(selectedPlace: String){
        places.removeValue(forKey: selectedPlace)
        self.placeNames = Array(places.keys)
    }
    func add(selectedPlace: PlaceDescription, placeTitle : String) {
        places[placeTitle] = selectedPlace
        self.placeNames = Array(places.keys)
    }
    // used by methods below to send a request asynchronously.
    // asyncHttpPostJson creates and posts a URLRequest that attaches a JSONRPC request as a Data object
    func asyncHttpPostJSON(url: String,  data: Data,
                           completion: @escaping (String, String?) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.httpBody = data
        HTTPsendRequest(request: request, callback: completion)
    }
    
    // sendHttpRequest
    func HTTPsendRequest(request: NSMutableURLRequest,
                         callback: @escaping (String, String?) -> Void) {
        // task.resume() below, causes the shared session http request to be posted in the background
        // (independent of the UI Thread)
        // the use of the DispatchQueue.main.async causes the callback to occur on the main queue --
        // where the UI can be altered, and it occurs after the result of the post is received.
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            if (error != nil) {
                callback("", error!.localizedDescription)
            } else {
                DispatchQueue.main.async(execute: {callback(NSString(data: data!,
                                                                     encoding: String.Encoding.utf8.rawValue)! as String, nil)})
            }
        }
        task.resume()
    }
    func getNames(callback: @escaping (String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceDescriptionLibrary.id = PlaceDescriptionLibrary.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"getNames", "params":[ ], "id":PlaceDescriptionLibrary.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions(rawValue: 0))
            self.asyncHttpPostJSON(url: self.url, data: reqData, completion: callback)
            ret = true
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
    func get(name: String, callback: @escaping (String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceDescriptionLibrary.id = PlaceDescriptionLibrary.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"get", "params":[name], "id":PlaceDescriptionLibrary.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions(rawValue: 0))
            self.asyncHttpPostJSON(url: self.url, data: reqData, completion: callback)
            ret = true
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
}

