//
//  ViewController.swift
//  Test
//
//  Created by Евгений Шишкин on 07.02.17.
//  Copyright © 2017 Евгений Шишкин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button: [String: UIButton] = [:]
    var label: UILabel!
    let operators = ["=", "+", "\u{2212}", "\u{00D7}", "\u{00F7}"]
    let menu = ["AC", "\u{00B1}", "\u{0025}"]
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @IBOutlet var rootView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        addViews()

        addConstraint()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

