//
// Created by Евгений Шишкин on 11.02.17.
// Copyright (c) 2017 Евгений Шишкин. All rights reserved.
//

import UIKit

extension ViewController {
    func upTouch(btn: UIButton) {
        label.text = btn.title(for: .normal)!
    }

    func addViews() {
        for char in numbers + operators + menu + [","] {
            button[char] = UIButton()
            let btn: UIButton = button[char]!
            btn.setTitle(char, for: .normal)
            btn.titleLabel!.font = UIFont(name: "HelveticaNeue-UltraLight", size: 42)!
            btn.addTarget(self, action: #selector(upTouch(btn: )), for: .touchUpInside)
            rootView.addSubview(btn)
        }

        for char in operators {
            let btn: UIButton = button[char]!
            btn.setBackgroundColor(color: .orange, forState: .normal)
            btn.setBackgroundColor(color: UIColor.orange.darker()!, forState: .highlighted)
            btn.setTitleColor(.white, for: .normal)
        }

        for char in numbers + [","] {
            let btn: UIButton = button[char]!
            btn.setBackgroundColor(color: .lightGray, forState: .normal)
            btn.setBackgroundColor(color: UIColor.lightGray.darker()!, forState: .highlighted)
            btn.setTitleColor(.black, for: .normal)
        }

        for char in menu {
            let btn: UIButton = button[char]!
            btn.setBackgroundColor(color: .gray, forState: .normal)
            btn.setBackgroundColor(color: UIColor.gray.darker()!, forState: .highlighted)
            btn.setTitleColor(.black, for: .normal)
        }

        label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 72 * 1.5)
        label.numberOfLines = 1
        label.text = "0,"
        rootView.addSubview(label)
    }

    func addConstraint() {
        let border: CGFloat = 0.5

        for (i, char) in (numbers + operators + menu + [","]).enumerated() {
            let btn = button[char]!
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            if i != 0 {
                btn.widthAnchor.constraint(equalTo: btn.heightAnchor).isActive = true
                btn.heightAnchor.constraint(equalTo: button["0"]!.heightAnchor).isActive = true
            } else {
                //btn.heightAnchor.constraint(equalTo: btn.widthAnchor, multiplier: 2).isActive = true
            }
        }

        for (i, char) in operators.enumerated() {
            let btn = button[char]!
            btn.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -border).isActive = true
            btn.bottomAnchor.constraint(equalTo: (i == 0 ? rootView.bottomAnchor : button[operators[i - 1]]!.topAnchor),
                    constant: -border).isActive = true
        }

        for (i, char) in numbers.enumerated() {
            let btn = button[char]!
            if i == 0 {
                btn.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -border).isActive = true
                btn.trailingAnchor.constraint(equalTo: button[","]!.leadingAnchor, constant: -border).isActive = true
                btn.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: border).isActive = true
            } else if i % 3 == 1 {
                btn.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: border).isActive = true
                btn.bottomAnchor.constraint(equalTo: button[numbers[i > 3 ? i - 3 : 0]]!.topAnchor,
                        constant: -border).isActive = true
                btn.trailingAnchor.constraint(equalTo: button[numbers[i + 1]]!.leadingAnchor,
                        constant: -border).isActive = true
            } else if i % 3 == 2 {
                btn.bottomAnchor.constraint(equalTo: button[numbers[i > 3 ? i - 3 : 0]]!.topAnchor,
                        constant: -border).isActive = true
                btn.trailingAnchor.constraint(equalTo: button[numbers[i + 1]]!.leadingAnchor,
                        constant: -border).isActive = true
            } else {
                btn.bottomAnchor.constraint(equalTo: button[i > 3 ? numbers[i - 3] : ","]!.topAnchor,
                        constant: -border).isActive = true
                btn.trailingAnchor.constraint(equalTo: button[operators[i / 3]]!.leadingAnchor,
                        constant: -border).isActive = true
            }
        }

        for (i, char) in menu.enumerated() {
            let btn = button[char]!
            if i == 0 {
                btn.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: border).isActive = true
            }
            btn.bottomAnchor.constraint(equalTo: button[numbers[7 + i]]!.topAnchor, constant: -border).isActive = true
            btn.trailingAnchor.constraint(
                    equalTo: button[i < menu.count - 1 ? menu[i + 1] : operators.last!]!.leadingAnchor,
                    constant: -border).isActive = true
        }

        let btn = button[","]!
        btn.trailingAnchor.constraint(equalTo: button[operators.first!]!.leadingAnchor,
                constant: -border).isActive = true
        btn.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -border).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalTo: button["0"]!.heightAnchor).isActive = true
        let labelBorder = border * 15
        label.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -labelBorder).isActive = true
        label.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: labelBorder).isActive = true
        label.bottomAnchor.constraint(equalTo: button[operators.last!]!.topAnchor,
                constant: -labelBorder).isActive = true
    }
}
