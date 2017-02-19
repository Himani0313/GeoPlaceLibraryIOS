/*
 * Copyright 2017 Himani Shah,
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * instuctor and the University with the right to build and evaluate the software package for the purpose of determining your grade and program assessment
 * Purpose: Example of single view application
 * Allows to display the objects of a class to access the GUI
 *
 * Ser423 Mobile Applications
 * @author Himani Shah Himani.shah@asu.edu
 *         Software Engineering, CIDSE, ASU Poly
 * @version January 2017
 */


import UIKit

class ViewController: UIViewController , UITextViewDelegate{
    //Mark: Properties
    @IBOutlet weak var displayName: UITextField!
    @IBOutlet weak var displayDescription: UITextField!
    @IBOutlet weak var displayCategory: UITextField!
    @IBOutlet weak var displayAddressTitle: UITextField!
    @IBOutlet weak var displayAddress: UITextView!
    @IBOutlet weak var displayLatitude: UITextField!
    @IBOutlet weak var displayLongitude: UITextField!
    @IBOutlet weak var displayElevation: UITextField!

    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    var selectedPlace:String = "unknown"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayName.text = "\(places[selectedPlace]!.name)"
        displayDescription.text = "\(places[selectedPlace]!.description)"
        displayCategory.text = "\(places[selectedPlace]!.category)"
        displayAddressTitle.text = "\(places[selectedPlace]!.addresstitle)"
        displayAddress.text = "\(places[selectedPlace]!.address)"
        displayLatitude.text = "\(places[selectedPlace]!.latitude)"
        displayLongitude.text = "\(places[selectedPlace]!.longitude)"
        displayElevation.text = "\(places[selectedPlace]!.elevation)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.displayName.resignFirstResponder()
        self.displayDescription.resignFirstResponder()
        self.displayAddressTitle.resignFirstResponder()
        self.displayAddress.resignFirstResponder()
        self.displayElevation.resignFirstResponder()
        self.displayLatitude.resignFirstResponder()
        self.displayLongitude.resignFirstResponder()
    }
    
    // UITextFieldDelegate Method
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.displayName.resignFirstResponder()
        self.displayDescription.resignFirstResponder()
        self.displayAddressTitle.resignFirstResponder()
        self.displayAddress.resignFirstResponder()
        self.displayElevation.resignFirstResponder()
        self.displayLatitude.resignFirstResponder()
        self.displayLongitude.resignFirstResponder()
        return true
    }

}

