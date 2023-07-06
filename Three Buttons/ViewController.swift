//
//  ViewController.swift
//  Three Buttons
//
//  Created by Вова on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    func addButtons () {
        let textArray = ["First Button", "Second Medium Button", "Third"]
        for i in 1...textArray.count {
            let button = CustomButton()
            button.setTitle(textArray[i-1], for: .normal)
            if i == 3 {
                button.addTarget(self, action: #selector(self.goToModal), for: .touchUpInside)
            }
            stackView.addArrangedSubview(button)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        addButtons()
        setConstraints()
    }
    
    func setConstraints () {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    @objc func goToModal () {
        let vc = SecondViewController()
        self.present(vc, animated: true)
        stackView.arrangedSubviews.forEach({ $0.backgroundColor = .systemGray2 })
    }
}

