//
//  ViewController.swift
//  10YearChallenge
//
//  Created by Marso on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var dateSlider: UISlider!
    @IBOutlet weak var autoSwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func datePickerChanged(_ sender: Any) {
//        let today = Date()
//        print ("today: \(today)")
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy"
        let year = dateFormater.string(from: datePicker.date)
        dateSlider.value = Float(Int(year)!)
        //dateSlider.setValue(Float(Int(year)!), animated: true)
        dateLabel.text = year

    }
    @IBAction func dateSliderValueChange(_ sender: Any) {

        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy"
        let year = String(Int(dateSlider.value))
        let date = dateFormater.date(from: year)!
        datePicker.setDate(date, animated: true)
        dateLabel.text = year

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateSlider.minimumValue = 2010
        dateSlider.maximumValue = 2020
        let dateFormater = DateFormatter()
        datePicker.minimumDate = dateFormater.date(from: "2010/01/01")
        datePicker.maximumDate = dateFormater.date(from: "2020/01/01")
        
        // Do any additional setup after loading the view.
    }

}

