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
        showImageView.image = UIImage(named: "Xiaozhi\(year)")
        dateLabel.text = year

    }
    @IBAction func dateSliderValueChange(_ sender: Any) {
        let year = String(Int(dateSlider.value))
        let date = dateFormater.date(from: year)!
        datePicker.setDate(date, animated: true)
        showImageView.image = UIImage(named: "Xiaozhi\(year)")
        dateLabel.text = year
    }
    
    @IBAction func autoSwitch(_ sender: Any) {
        if autoSwitch.isOn {
            dateSlider.isEnabled = false
            datePicker.isEnabled = false
            //var year = String(Int(self.dateSlider.value))
            var index = Int(self.dateSlider.value + 1)
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (timer) in
                
                //reset 2020 to 2011
                if index > Int(self.dateSlider.maximumValue){
                    index = 2011
                }
                
                let year = String(index)
                //datePicker
                let date = self.dateFormater.date(from: year)!
                self.datePicker.setDate(date, animated: true)
                //dateSlider
                self.dateSlider.value = Float(Int(year)!)
                
                self.showImageView.image = UIImage(named: "Xiaozhi\(year)")
                self.dateLabel.text = year
                index += 1

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
        //init
        dateFormater.dateFormat = "yyyy"
        dateSlider.minimumValue = 2011
        dateSlider.maximumValue = 2020
        dateSlider.value = 2020
        datePicker.minimumDate = dateFormater.date(from: "2011")
        datePicker.maximumDate = dateFormater.date(from: "2020")
        let date = dateFormater.date(from: "2020")!
        datePicker.setDate(date, animated: true)
        showImageView.contentMode = .scaleAspectFit
        showImageView.image = UIImage(named: "Xiaozhi2011")
        autoSwitch.isOn = false
        
        // Do any additional setup after loading the view.
    }

}

