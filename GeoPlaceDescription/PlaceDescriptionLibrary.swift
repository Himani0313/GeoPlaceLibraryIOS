//
//  PlaceDescriptionLibrary.swift
//  GeoPlaceDescription
//
//  Created by hjshah2 on 2/24/17.
//  Copyright © 2017 hjshah2. All rights reserved.
//

import Foundation

public class PlaceDescriptionLibrary{
    
    //let placeDescriptionObject : PlaceDescription
    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    var placeNames:[String] = [String]()
    
    public init(){
        
        let place1: PlaceDescription = PlaceDescription(jsonStr:"{\"addressTitle\":\"ASU West Campus\",\"addressStreet\":\"13591 N 47th Ave$Phoenix AZ 85051\",\"elevation\":1100.0,\"latitude\":33.608979,\"longitude\":-112.159469,\"name\":\"ASU-West\",\"description\":\"Home of ASU's Applied Computing Program\",\"category\":\"School\"}")
        
        let place2: PlaceDescription = PlaceDescription(jsonStr:"{\"addressTitle\":\"University of Alaska at Anchorage\",\"addressStreet\":\"290 Spirit Dr$Anchorage AK 99508\",\"elevation\":0.0,\"latitude\": 61.189748,\"longitude\":-149.826721,\"name\":\"UAK-Anchorage\",\"description\":\"University of Alaska's largest campus\",\"category\":\"School\"}")
        
        places = ["ASU-West":place1, "UAK-Anchorage":place2]
        placeNames = Array(places.keys)
        
    }
    
    func getPlaceTitles() -> [String]{
        return placeNames
    }
    
    func getPlaceDescription(placeTitle : String) -> PlaceDescription{
        return places[placeTitle]!
    }
}

