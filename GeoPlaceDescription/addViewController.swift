//
//  addViewController.swift
//  GeoPlaceDescription
//
//  Created by hjshah2 on 2/25/17.
//  Copyright © 2017 hjshah2. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    var placeDescriptionObject : PlaceDescription = PlaceDescription()
    let placeDescriptionLibraryObject = PlaceDescriptionLibrary()
    @IBOutlet weak var nameDisplay: UITextField!
    @IBOutlet weak var descriptionDisplay: UITextField!
    @IBOutlet weak var categoryDisplay: UITextField!
    @IBOutlet weak var addTitleDisplay: UITextField!
    @IBOutlet weak var addStreetDisplay: UITextView!
    @IBOutlet weak var elevationDisplay: UITextField!
    @IBOutlet weak var latitudeDisplay: UITextField!
    @IBOutlet weak var longitudeDisplay: UITextField!
    @IBAction func cancelbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func savebutton(_ sender: Any) {
        placeDescriptionObject.name = nameDisplay.text!
        placeDescriptionObject.description = descriptionDisplay.text!
        placeDescriptionObject.category = categoryDisplay.text!
        placeDescriptionObject.addresstitle = addTitleDisplay.text!
        placeDescriptionObject.address = addStreetDisplay.text!
        placeDescriptionObject.elevation = Float(elevationDisplay.text!)!
        placeDescriptionObject.latitude = Float(latitudeDisplay.text!)!
        placeDescriptionObject.longitude = Float(longitudeDisplay.text!)!
        placeDescriptionLibraryObject.add(selectedPlace: placeDescriptionObject, placeTitle: nameDisplay.text!)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add a Place"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
