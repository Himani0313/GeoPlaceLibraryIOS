//
//  TableViewController_1st.swift
//  GeoPlaceDescription
//
//  Created by hjshah2 on 2/19/17.
//  Copyright © 2017 hjshah2. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController{
    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    var names:[String] = [String]()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let ASUWest:PlaceDescription = PlaceDescription(jsonStr: "{\"addresstitle\":\"ASU West Campus\",\"address\":\"13591 N 47th Ave$Phoenix AZ 85051\",\"elevation\":1100.0,\"latitude\":33.608979,\"longitude\":-112.159469,\"name\":\"ASU-West\",\"image\":\"asuwest\",\"description\":\"Home of ASU's Applied Computing Program\",\"category\":\"School\"}")
        let UAKAnchorage = PlaceDescription(jsonStr: "{\"addresstitle\":\"University of Alaska at Anchorage\",\"address\":\"290 Spirit Dr$Anchorage AK 99508\",\"elevation\":0.0,\"latitude\":61.189748,\"longitude\":-149.826721,\"name\":\"UAK-Anchorage\",\"image\":\"univalaska\",\"description\":\"University of Alaska's largest campus\",\"category\":\"School\"}")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(tableViewController.navigateToNextViewController))
        places = ["ASU-West":ASUWest,"UAK-Anchorage":UAKAnchorage]
        names = ["ASU-West","UAK-Anchorage"]
        
        self.title = "Places List"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func navigateToNextViewController(){
        self.performSegue(withIdentifier: "addPlace", sender: self)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("tableView editing row at: \(indexPath.row)")
        if editingStyle == .delete {
            let selectedPlace:String = names[indexPath.row]
            print("deleting the place \(selectedPlace)")
            places.removeValue(forKey: selectedPlace)
            names = Array(places.keys)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // don't need to reload data, using delete to make update
        }
    }
    // MARK: - Table view data source methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get and configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath)
        
        let aPlace = places[names[indexPath.row]]! as PlaceDescription
        cell.textLabel?.text = aPlace.name
        cell.detailTextLabel?.text = aPlace.description
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object (and model) to the new view controller.
        NSLog("seque identifier is \(segue.identifier)")
        if segue.identifier == "PlaceDetail" {
            let viewController:ViewController = segue.destination as! ViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            viewController.places = self.places
            viewController.selectedPlace = names[indexPath.row]
        }
    }
}
