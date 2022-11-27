//
//  firstVC.swift
//  homework banana struct
//
//  Created by MacBook Pro on 28/09/22.
//

import UIKit
struct bananasDM {
    var first:Int
    var second: Int
    var variants:[String]
    var trueanswer:String
}

class firstVC: UIViewController {
    @IBOutlet var bananascollect: [UIImageView]!
    @IBOutlet var bananascollect1: [UIImageView]!
    @IBOutlet var ansvers: [UIButton]!
    @IBOutlet weak var resultlbl: UILabel!
    @IBOutlet weak var resultview: UIView!
    var anstrue = 0
    var bananasarr:[bananasDM] = [
    bananasDM(first: 3, second: 5, variants: ["3","7","8","10"], trueanswer: "8"),
    bananasDM(first: 2, second: 4, variants: ["3","6","7","4"], trueanswer: "6"),
    bananasDM(first: 4, second: 3, variants: ["8","7","6","5"], trueanswer: "7"),
    bananasDM(first: 2, second: 5, variants: ["9","5","7","6"], trueanswer: "7"),
    bananasDM(first: 4, second: 4, variants: ["1","7","8","4"], trueanswer: "8"),
    bananasDM(first: 3, second: 2, variants: ["5","6","3","7"], trueanswer: "5"),
    bananasDM(first: 5, second: 2, variants: ["4","7","6","3"], trueanswer: "7"),
    bananasDM(first: 4, second: 3, variants: ["1","7","2","3"], trueanswer: "7"),
    bananasDM(first: 3, second: 5, variants: ["3","4","8","9"], trueanswer: "8"),
    bananasDM(first: 5, second: 5, variants: ["3","2","9","10"], trueanswer: "10"),
]
    var index1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        resultview.isHidden = true
        myphotos()
        
    }
    
    
    
    func myphotos() {
        if index1 > bananasarr.count-1
        {
            resultview.isHidden = false
            resultlbl.text = "\(anstrue) / \(bananasarr.count)"
            return
        }
        
        for i in 0..<bananascollect.count {
            if i < bananasarr[index1].first {
                bananascollect[i].isHidden = false
            } else {
                bananascollect[i].isHidden = true

            }
        }
        
        for i in 0..<bananascollect1.count {
            if i < bananasarr[index1].second {
                bananascollect1[i].isHidden = false
            } else {
                bananascollect1[i].isHidden = true

            }
        }
        
        
        for ind in ansvers.enumerated() {
            ansvers.shuffled()

            ind.element.setTitle(bananasarr[index1].variants[ind.offset], for: .normal)
        }
        
        
        
    }
    func trueanswer1()-> Int {
        for op in bananasarr[index1].variants.enumerated() {
            if op.element == bananasarr[index1].trueanswer {
                return op.offset
            }
        }
        return 0
    }
    
    
    
    
    
    
    @IBAction func nextbtn(_ sender: UIButton) {
        for i in ansvers {
            i.setTitleColor(.white, for: .normal)
            i.isEnabled = true
        }
        index1 += 1
        myphotos()
        
    }
    
    @IBAction func answersbtn(_ sender: UIButton) {
        if sender.currentTitle == bananasarr[index1].trueanswer {
            anstrue += 1
            sender.setTitleColor(.green, for: .normal)
            for i in ansvers {
                i.isEnabled = false
            }
        } else {
            sender.setTitleColor(.red, for: .normal)
            for i in ansvers {
                i.isEnabled = false
            }
            let a = trueanswer1()
            ansvers[a].setTitleColor(.green, for: .normal)
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
