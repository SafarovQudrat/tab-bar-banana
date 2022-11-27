//
//  fourthVC.swift
//  tab bar banana
//
//  Created by MacBook Pro on 29/09/22.
//

import UIKit
struct peachDM {
    var first:Int
    var second: Int
    var variants:[String]
    var trueanswer:String
}
class fourthVC: UIViewController {

    @IBOutlet var peach1: [UIImageView]!
    @IBOutlet var peach2: [UIImageView]!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var resultview: UIView!
    @IBOutlet weak var resultlbl: UILabel!
    var anstrue = 0
    var peacharr:[peachDM] = [
        peachDM(first: 3, second: 5, variants: ["3","7","8","10"], trueanswer: "8"),
        peachDM(first: 2, second: 4, variants: ["3","6","7","4"], trueanswer: "6"),
        peachDM(first: 4, second: 3, variants: ["8","7","6","5"], trueanswer: "7"),
        peachDM(first: 2, second: 5, variants: ["9","5","7","6"], trueanswer: "7"),
        peachDM(first: 4, second: 4, variants: ["1","7","8","4"], trueanswer: "8"),
        peachDM(first: 3, second: 2, variants: ["5","6","3","7"], trueanswer: "5"),
        peachDM(first: 5, second: 2, variants: ["4","7","6","3"], trueanswer: "7"),
        peachDM(first: 4, second: 3, variants: ["1","7","2","3"], trueanswer: "7"),
        peachDM(first: 3, second: 5, variants: ["3","4","8","9"], trueanswer: "8"),
        peachDM(first: 5, second: 5, variants: ["3","2","9","10"], trueanswer: "10"),
]
    var index1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        resultview.isHidden = true
        myphotos()
        
    }
    
    
    func myphotos() {
        if index1 > peacharr.count-1
        {
            resultview.isHidden = false
            resultlbl.text = "\(anstrue) / \(peacharr.count)"
            return
        }
        
        for i in 0..<peach1.count {
            if i < peacharr[index1].first {
                peach1[i].isHidden = false
            } else {
                peach1[i].isHidden = true

            }
        }
        
        for i in 0..<peach2.count {
            if i < peacharr[index1].second {
                peach2[i].isHidden = false
            } else {
                peach2[i].isHidden = true

            }
        }
        
        answers.shuffled()
        for ind in answers.enumerated() {
         
            ind.element.setTitle(peacharr[index1].variants[ind.offset], for: .normal)
        }
        
        
        
    }
    func trueanswer1()-> Int {
        for op in peacharr[index1].variants.enumerated() {
            if op.element == peacharr[index1].trueanswer {
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
        if sender.currentTitle == peacharr[index1].trueanswer {
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
