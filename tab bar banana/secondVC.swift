//
//  secondVC.swift
//  tab bar banana
//
//  Created by MacBook Pro on 29/09/22.
//

import UIKit
struct appleDM {
    var birinchi:Int
    var ikkinchi: Int
    var javoblar:[String]
    var togrijavob:String
}

class secondVC: UIViewController {
    @IBOutlet var applecollect: [UIImageView]!
    @IBOutlet var applecollect1: [UIImageView]!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var resultlbl: UILabel!
    @IBOutlet weak var resultview: UIView!
    var anstrue = 0
    var applearr:[appleDM] = [
    appleDM(birinchi: 3, ikkinchi: 5, javoblar: ["3","7","8","10"], togrijavob: "8"),
    appleDM(birinchi: 2, ikkinchi: 4, javoblar: ["3","6","7","4"], togrijavob: "6"),
    appleDM(birinchi: 4, ikkinchi: 3, javoblar: ["8","7","6","5"], togrijavob: "7"),
    appleDM(birinchi: 2, ikkinchi: 5, javoblar: ["9","5","7","6"], togrijavob: "7"),
    appleDM(birinchi: 4, ikkinchi: 4, javoblar: ["1","7","8","4"], togrijavob: "8"),
    appleDM(birinchi: 3, ikkinchi: 2, javoblar: ["5","6","3","7"], togrijavob: "5"),
    appleDM(birinchi: 5, ikkinchi: 2, javoblar: ["4","7","6","3"], togrijavob: "7"),
    appleDM(birinchi: 4, ikkinchi: 3, javoblar: ["1","7","2","3"], togrijavob: "7"),
    appleDM(birinchi: 3, ikkinchi: 5, javoblar: ["3","4","8","9"], togrijavob: "8"),
    appleDM(birinchi: 5, ikkinchi: 5, javoblar: ["3","2","9","10"], togrijavob: "10"),
]
    var index1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        resultview.isHidden = true
        myphotos()
        
    }
    
        
        
        
        func myphotos() {
            if index1 > applearr.count-1
            {
                resultview.isHidden = false
                resultlbl.text = "\(anstrue) / \(applearr.count)"
                return
            }
            
            for i in 0..<applecollect.count {
                if i < applearr[index1].birinchi {
                    applecollect[i].isHidden = false
                } else {
                    applecollect[i].isHidden = true

                }
            }
            
            for i in 0..<applecollect1.count {
                if i < applearr[index1].ikkinchi {
                    applecollect1[i].isHidden = false
                } else {
                    applecollect1[i].isHidden = true

                }
            }
            
            
            for ind in answers.enumerated() {
                answers.shuffled()

                ind.element.setTitle(applearr[index1].javoblar[ind.offset], for: .normal)
            }
            
            
            
        }
        func trueanswer1()-> Int {
            for op in applearr[index1].javoblar.enumerated() {
                if op.element == applearr[index1].togrijavob {
                    return op.offset
                }
            }
            return 0
        }
        
        
        
        
        
    
    
    
    
    @IBAction func nextbtn(_ sender: UIButton) {
            for i in answers {
                i.setTitleColor(.white, for: .normal)
                i.isEnabled = true
            }
            index1 += 1
            myphotos()
            
        }
        
    @IBAction   func answersbtn(_ sender: UIButton) {
            if sender.currentTitle == applearr[index1].togrijavob {
                anstrue += 1
                sender.setTitleColor(.green, for: .normal)
                for i in answers {
                    i.isEnabled = false
                }
            } else {
                sender.setTitleColor(.red, for: .normal)
                for i in answers {
                    i.isEnabled = false
                }
                let a = trueanswer1()
                answers[a].setTitleColor(.green, for: .normal)
            }
            
        }
        
    @IBAction    func restartbtn(_ sender: Any) {
            index1 = 0
            resultview.isHidden = true
            myphotos()
            
        }
        
        
    @IBAction  func homebtn(_ sender: Any) {
            self.dismiss(animated: true)
        }
    }


