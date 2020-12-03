//
//  ViewController.swift
//  10YearChallenge
//
//  Created by Marso on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    let dateFormater = DateFormatter()
    var timer: Timer?
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var dateSlider: UISlider!
    @IBOutlet weak var autoSwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func datePickerChanged(_ sender: Any) {
//        let today = Date()
//        print ("today: \(today)")
        
        let year = dateFormater.string(from: datePicker.date)
        dateSlider.value = Float(Int(year)!)
        //dateSlider.setValue(Float(Int(year)!), animated: true)
        dateLabel.text = year

    }
    @IBAction func dateSliderValueChange(_ sender: Any) {

        let year = String(Int(dateSlider.value))
        let date = dateFormater.date(from: year)!
        datePicker.setDate(date, animated: true)
        dateLabel.text = year

    }
    @IBAction func autoSwitch(_ sender: Any) {
        if autoSwitch.isOn {
            dateSlider.isEnabled = false
            datePicker.isEnabled = false
           
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (timer) in
                let year = String(Int(self.dateSlider.value)+1)
                let date = self.dateFormater.date(from: year)!
                print("date:\(date)")
                self.datePicker.setDate(date, animated: true)
                //let year2 = self.dateFormater.string(from: self.datePicker.date)
                self.dateSlider.value = Float(Int(year)!)
                //print("year:\(year2)")
                self.dateLabel.text = year
                if (self.dateSlider.value == 2020.0){
                    self.dateSlider.value = 2010.0
                
                    }
                
                    })
        }
        else {
            dateSlider.isEnabled = true
            datePicker.isEnabled = true
            timer?.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormater.dateFormat = "yyyy"
        
        dateSlider.minimumValue = 2010
        dateSlider.maximumValue = 2020
        datePicker.minimumDate = dateFormater.date(from: "2010")
        datePicker.maximumDate = dateFormater.date(from: "2020")
        
        // Do any additional setup after loading the view.
    }

}

