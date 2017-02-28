//
//  ViewController.swift
//  Assignment02BMI
//
//  Created by Phong Vu on 2/23/17.
//  Copyright © 2017 Phong Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var displayResultLabel: UILabel!
    @IBOutlet var unitSwitch: UISwitch!
    @IBOutlet var bodyImage: UIImageView!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()

    override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
        
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResultLabel.text = ""
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        if unitSwitch.isOn {
            let heightValue = Double(heightTextField.text!)
            let weightValue = Double(weightTextField.text!)
            if heightValue != nil && weightValue != nil {
                let bmi = weightValue! / (heightValue! * heightValue!)
                
                switch bmi {
                case 1..<16:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " SevereThinness"
                    bodyImage.image = UIImage(named: "severe")
                case 16..<17:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Moderate Thinness"
                    bodyImage.image = UIImage(named: "moderate")
                case 17..<18.50:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Mild Thinness"
                    bodyImage.image = UIImage(named: "mild")
                case 18.50..<25:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Normal Range"
                    bodyImage.image = UIImage(named: "normal")
                case 25..<30:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Overweight"
                    bodyImage.image = UIImage(named: "overweight")
                case 30..<35:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Obese Class I"
                    bodyImage.image = UIImage(named: "class1")
                case 35..<40:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Obese Class II"
                    bodyImage.image = UIImage(named: "class2")
                default:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Obese Class III"
                    bodyImage.image = UIImage(named: "superman")
                }
            }else {
                displayResultLabel.text = "Please enter your height and weight!"
                bodyImage.image = UIImage(named: "")
            }
        }else {
            let heightValue = Double(heightTextField.text!)
            let weightValue = Double(weightTextField.text!)
            if heightValue != nil && weightValue != nil {
                let h = heightValue! / 39.37
                let w = weightValue! * 0.45359237
                let bmi = w / (h * h)
                
                switch bmi {
                case 1..<16:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " SevereThinness"
                    bodyImage.image = UIImage(named: "severe")
                case 16..<17:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Moderate Thinness"
                    bodyImage.image = UIImage(named: "moderate")
                case 17..<18.50:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Mild Thinness"
                    bodyImage.image = UIImage(named: "mild")
                case 18.50..<25:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Normal Range"
                    bodyImage.image = UIImage(named: "normal")
                case 25..<30:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Overweight"
                    bodyImage.image = UIImage(named: "overweight")
                case 30..<35:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Obese Class I"
                    bodyImage.image = UIImage(named: "class1")
                case 35..<40:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Obese Class II"
                    bodyImage.image = UIImage(named: "class2")
                default:
                    displayResultLabel.text = numberFormatter.string(from: NSNumber(value: bmi))! + " Obese Class III"
                    bodyImage.image = UIImage(named: "superman")
                }
            }else {
                displayResultLabel.text = "Please enter your height and weight!"
                bodyImage.image = UIImage(named: "")
            }
        }
    }
}

