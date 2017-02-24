//
//  addViewController.swift
//  GeoPlaceDescription
//
//  Created by hjshah2 on 2/24/17.
//  Copyright © 2017 hjshah2. All rights reserved.
//

import UIKit

class addViewController :UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var addName: UITextField!
    @IBOutlet weak var addDescription: UITextField!
    @IBOutlet weak var addCategory: UITextField!
    @IBOutlet weak var addAddressTitle: UITextField!
    @IBOutlet weak var addAddrStreet: UITextView!
    @IBOutlet weak var addElevation: UITextField!
    @IBOutlet weak var addLatitude: UITextField!
    @IBOutlet weak var addLongitude: UITextField!
    var places:[String:PlaceDescription] = [String:PlaceDescription]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
