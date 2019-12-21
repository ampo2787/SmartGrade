//
//  AverageVC.swift
//  SmartGrades
//
//  Created by JihoonPark on 24/06/2019.
//  Copyright © 2019 JihoonPark. All rights reserved.
//

import UIKit

class AverageVC: UIViewController {

    @IBOutlet weak var lastAverage: UITextField!
    @IBOutlet weak var AllScore: UITextField!
    @IBOutlet weak var currentAverage: UITextField!
    @IBOutlet weak var currentScore: UITextField!
    
    @IBOutlet weak var retakeBtn: UIButton!
    @IBOutlet weak var retakeView: UIView!
    
    @IBOutlet weak var retakePreviousTF: UITextField!
    @IBOutlet weak var retakeAfterTF: UITextField!
    @IBOutlet weak var retakeScore: UITextField!
    
    @IBOutlet weak var resultScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func retakeBtnTouched(_ sender: UIButton) {
        
        if self.retakeBtn.tag == 1 {
            self.retakeView.isHidden = false
            self.retakeBtn.tag = 0
            self.retakeBtn.setTitle("재이수 안했어요.", for: .normal)
        }
        else {
            self.retakeView.isHidden = true
            self.retakeBtn.tag = 1
            self.retakeBtn.setTitle("재이수 과목이 있다면 ?", for: .normal)
        }
        
    }
    
    @IBAction func calculateBtnTouched(_ sender: Any) {
        
        if self.lastAverage.text!.isEmpty || self.AllScore.text!.isEmpty || self.currentAverage.text!.isEmpty ||
        self.currentScore.text!.isEmpty {
            let AlertView = UIAlertController(title: "주의", message: "아직 입력하지 않은 성적이 있어요.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            AlertView.addAction(defaultAction)
            present(AlertView, animated: true, completion: nil)
            
        }
        else {
            let lastAverage = Float(self.lastAverage.text!)
            let allScore = Float(self.AllScore.text!)
            let thisAverage = Float(self.currentAverage.text!)
            let thisScore = Float(self.currentScore.text!)
            
            if self.retakeBtn.tag == 1 {
                Calculator.MyCalculator.Calculate(lastAv: lastAverage!, allScore: allScore!, thisAv: thisAverage!, thisScore:thisScore!)
                self.resultScore.text = String(Calculator.result)
                
                
            }
            else {
                let retakePrevious = Float(self.retakePreviousTF.text!)
                let retakeAfter = Float(self.retakeAfterTF.text!)
                let retakeScore = Float(self.retakeScore.text!)
                Calculator.MyCalculator.Calculate(lastAv: lastAverage!, allScore: allScore!, thisAv: thisAverage!, thisScore:thisScore!, retakePre: retakePrevious!, retakeAfter: retakeAfter!, retakeScore: retakeScore!)
                self.resultScore.text = String(Calculator.result)
            }
            
                   
            
        }
        
        
       
        
    }
    
    
}
