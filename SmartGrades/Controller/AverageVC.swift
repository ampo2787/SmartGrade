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
    @IBOutlet weak var retakeOnOffImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func retakeBtnTouched(_ sender: UIButton) {
        
        if self.retakeBtn.tag == 1 {
            self.retakeView.alpha = 0
            self.retakeView.isHidden = false
            self.retakeBtn.tag = 0
            self.retakeBtn.setTitle("재이수 안했어요.", for: .normal)
           
            UIView.animate(withDuration: 1, animations: {
                if #available(iOS 13.0, *) {
                               self.retakeOnOffImage.image = UIImage.init(systemName: "minus.circle")
                           } else {
                               self.retakeOnOffImage.image = UIImage.init(named: "minus.circle")
                               // Fallback on earlier versions
                           }
                           
                self.retakeView.alpha = 1
            })
        }
        else {
            self.retakeBtn.tag = 1
            self.retakeBtn.setTitle("재이수 과목이 있다면 ?", for: .normal)
            
            
            UIView.animate(withDuration: 1, animations: {
                if #available(iOS 13.0, *) {
                    self.retakeOnOffImage.image = UIImage.init(systemName: "keyboard.chevron.compact.down")
                } else {
                    self.retakeOnOffImage.image = UIImage.init(named: "keyboard.chevron.compact.down")
                    // Fallback on earlier versions
                }
                                    self.retakeView.alpha = 0

            }) { (complete) in
                if complete == true {
                    self.retakeView.isHidden = true
                }
            }
            
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
                
            }
            else {
                let retakePrevious = Float(self.retakePreviousTF.text!)
                let retakeAfter = Float(self.retakeAfterTF.text!)
                let retakeScore = Float(self.retakeScore.text!)
                Calculator.MyCalculator.Calculate(lastAv: lastAverage!, allScore: allScore!, thisAv: thisAverage!, thisScore:thisScore!, retakePre: retakePrevious!, retakeAfter: retakeAfter!, retakeScore: retakeScore!)
            }
            
            let AlertView = UIAlertController(title: "예상 성적입니다!", message: "당신의 점수는! " + String(Calculator.result) + "입니다.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "고생했어요!", style: .cancel, handler: nil)
            AlertView.addAction(defaultAction)
            present(AlertView, animated: true, completion: nil)
                   
            
        }
        
        
       
        
    }
    
    
}
