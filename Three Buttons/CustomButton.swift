//
//  CustomButton.swift
//  Three Buttons
//
//  Created by Вова on 04.07.2023.
//

import UIKit
 
class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setupButton()
    }
    
    func setupButton () {
//        backgroundColor = .blue
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        titleLabel?.numberOfLines = 1
        setupConfig()
    }
    
    func setupConfig() {
        var config = UIButton.Configuration.filled()
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = UIImage(systemName: "arrow.right.circle")
        config.imagePadding = 8
        config.imagePlacement = .trailing
        self.configuration = config
        addTarget(self, action: #selector(self.animateUp(_:)), for: .touchUpInside)
        addTarget(self, action: #selector(self.animateUp(_:)), for: .touchUpOutside)
        addTarget(self, action: #selector(self.animateDown(_:)), for: .touchDown)
    }
    
    @objc func animateUp(_ sender: UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
              sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }

    
    @objc func animateDown(_ sender: UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
}
