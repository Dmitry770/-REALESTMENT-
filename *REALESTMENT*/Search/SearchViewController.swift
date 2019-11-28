//
//  SearchViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 04/11/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var searchPlaceTextField: UITextField!
    @IBOutlet weak var projectProgressPicker: UIPickerView!
    @IBOutlet weak var searchClosingDataTextField: UITextField!
    @IBOutlet weak var searchMinInvestmentTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    var progressType = ["Not selected", "Projected", "Under construction", "Completed"]
    var selectedType: String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return progressType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return progressType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = progressType[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchClosingDataTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
        searchClosingDataTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneAction() {
        getDateFromPicker()
        view.endEditing(true)
    }
    
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        searchClosingDataTextField.text = formatter.string(from: datePicker.date)
    }
    
var filtredObjects: [Article] = []
    
    func createFilter () {
        var filterArray: [Article] = []
        for object in articles {
            if  searchMinInvestmentTextField.text == "" {
                if object.place.lowercased().contains(searchPlaceTextField.text!.lowercased()) {
                    filterArray.append(object)
                }
            }
            if searchPlaceTextField.text == "" {
                if Int(object.minInvestment) != nil && Int(searchMinInvestmentTextField.text!) != nil {
                        let searchValue:String = searchMinInvestmentTextField.text!
                        let searchValueInt:Int = Int(searchValue)!
                        let objectInt:Int = Int(object.minInvestment)!
                     if objectInt >= searchValueInt {
                        filterArray.append(object)
                    }
                }
            }
            else {
                if Int(object.minInvestment) != nil && Int(searchMinInvestmentTextField.text!) != nil {
            let searchValue:String = searchMinInvestmentTextField.text!
            let searchValueInt:Int = Int(searchValue)!
            let objectInt:Int = Int(object.minInvestment)!
                
            if objectInt >= searchValueInt && object.place.lowercased().contains(searchPlaceTextField.text!.lowercased()) {
                filterArray.append(object)
                }
            }
        }
}
        print(filterArray.count)
        print(selectedType)
        filtredObjects = filterArray
}
        
    @IBAction func searchTapped(_ sender: Any) {
              createFilter()
        let st = UIStoryboard(name: "Main", bundle: .main)
        let controller = st.instantiateViewController(identifier: "MainTVC") as! TableViewController
            controller.objectsArray = filtredObjects
        tabBarController?.selectedIndex = 0
          }
}

