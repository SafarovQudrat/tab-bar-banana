//
//  firstVC.swift
//  imtihon
//
//  Created by MacBook Pro on 25/09/22.
//

import UIKit
struct pearDM {
    var first:Int
    var second: Int
    var variants:[String]
    var trueanswer:String
}
class ThirdVC: UIViewController {
    @IBOutlet var pear1: [UIImageView]!
    @IBOutlet var pear2: [UIImageView]!
    @IBOutlet var answers: [UIButton]!
    
    @IBOutlet weak var resultlbl: UILabel!
    @IBOutlet weak var resultview: UIView!
    var anstrue = 0
    var peararr:[pearDM] = [
        pearDM(first: 3, second: 5, variants: ["3","7","8","10"], trueanswer: "8"),
        pearDM(first: 2, second: 4, variants: ["3","6","7","4"], trueanswer: "6"),
        pearDM(first: 4, second: 3, variants: ["8","7","6","5"], trueanswer: "7"),
        pearDM(first: 2, second: 5, variants: ["9","5","7","6"], trueanswer: "7"),
        pearDM(first: 4, second: 4, variants: ["1","7","8","4"], trueanswer: "8"),
        pearDM(first: 3, second: 2, variants: ["5","6","3","7"], trueanswer: "5"),
        pearDM(first: 5, second: 2, variants: ["4","7","6","3"], trueanswer: "7"),
        pearDM(first: 4, second: 3, variants: ["1","7","2","3"], trueanswer: "7"),
        pearDM(first: 3, second: 5, variants: ["3","4","8","9"], trueanswer: "8"),
        pearDM(first: 5, second: 5, variants: ["3","2","9","10"], trueanswer: "10"),
]
    var index1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        resultview.isHidden = true
        myphotos()
        
        }
    func myphotos() {
        if index1 > peararr.count-1
        {
            resultview.isHidden = false
            resultlbl.text = "\(anstrue) / \(peararr.count)"
            return
        }
        
        for i in 0..<pear1.count {
            if i < peararr[index1].first {
                pear1[i].isHidden = false
            } else {
                pear1[i].isHidden = true

            }
        }
        
        for i in 0..<pear2.count {
            if i < peararr[index1].second {
                pear2[i].isHidden = false
            } else {
                pear2[i].isHidden = true

            }
        }
        
        
        for ind in answers.enumerated() {
            answers.shuffled()
            ind.element.setTitle(peararr[index1].variants[ind.offset], for: .normal)
        }
        
        
        
    }
    func trueanswer1()-> Int {
        for op in peararr[index1].variants.enumerated() {
            if op.element == peararr[index1].trueanswer {
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
    
    @IBAction func answersbtn(_ sender: UIButton) {
        if sender.currentTitle == peararr[index1].trueanswer {
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
    
    @IBAction func restartbtn(_ sender: Any) {
        index1 = 0
        resultview.isHidden = true
        myphotos()
        
    }
    
    
    @IBAction func homebtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
        
    }
    
    
   
    
    

