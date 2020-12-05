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
    @IBOutlet weak var dateModeSegmentedControl: UISegmentedControl!
    
    @IBAction func dateModeSegmentedControl(_ sender: Any) {
        
        switch dateModeSegmentedControl.selectedSegmentIndex {
        case 0:
            //'compact' is only available in iOS 14.0 or newer
            datePicker.preferredDatePickerStyle = .compact
        case 1:
            datePicker.preferredDatePickerStyle = .wheels
        case 2:
            //'inline' is only available in iOS 14.0 or newer
            datePicker.preferredDatePickerStyle = .inline
        default:
            datePicker.preferredDatePickerStyle = .automatic
        }
        
    }
    
    @IBAction func datePickerChange(_ sender: Any) {
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
            var index = Int(self.dateSlider.value + 1)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                
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
                
                //image
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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 445,  width: 420, height: 360))
        view.addSubview(imageView)
        let animatedImage = UIImage.animatedImageNamed("PikuchiAndXiaozh", duration: 1)
        imageView.image = animatedImage
        imageView.alpha = 0.3
        
        dateFormater.dateFormat = "yyyy"
        dateSlider.minimumValue = 2011
        dateSlider.maximumValue = 2020
        dateSlider.value = 2011
        dateSlider.minimumTrackTintColor = .red
        datePicker.minimumDate = dateFormater.date(from: "2011")
        datePicker.maximumDate = dateFormater.date(from: "2020")
        datePicker.setDate(dateFormater.date(from: "2011")!, animated: true)
        showImageView.contentMode = .scaleAspectFit
        showImageView.image = UIImage(named: "Xiaozhi2011")
        autoSwitch.isOn = false
        autoSwitch.onTintColor = .red
        dateModeSegmentedControl.removeAllSegments()
        dateModeSegmentedControl.insertSegment(withTitle: "Compact", at: 0, animated: true)
        dateModeSegmentedControl.insertSegment(withTitle: "Wheels", at: 1, animated: true)
        dateModeSegmentedControl.insertSegment(withTitle: "Inline", at: 2, animated: true)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .red
        dateLabel.text = "2011"
        
        // Do any additional setup after loading the view.
    }

}

