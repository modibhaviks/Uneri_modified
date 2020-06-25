//
//  ViewController.swift
//  Example
//
//  Created by Atsushi Yamamoto on 2019/07/29.
//  Copyright © 2019 jimmythai. All rights reserved.
//

import UIKit
import Uneri

final class ViewController: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var fillEmptyButton: UIButton!
    
    private lazy var uneri: Uneri = {
        let frame = CGRect(x: 0, y: circleView.frame.size.height-10, width: circleView.frame.size.width, height: circleView.frame.size.height)
        let uneri = Uneri(frame: frame)
        return uneri
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCircleView()
        setUneriView()
        fillEmptyButton.setTitle("Fill", for: .normal)
    }
    
    // MARK: - Private Methods
    /// Circle View Configuration
    func setCircleView() {
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.layer.borderColor = UIColor.lightGray.cgColor
        circleView.layer.borderWidth = 4
        circleView.addSubview(uneri)
        circleView.backgroundColor = .clear
        circleView.clipsToBounds = true
    }
    
    /// Uneri View Configuration
    func setUneriView() {
        uneri.mainGradientColors = [#colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.4588235294, green: 0.231372549, blue: 0.7411764706, alpha: 1)]
        uneri.mainAlpha = 1.0
        uneri.subGradientColors = [.clear]
        uneri.uneriSpeed = 2
        uneri.uneriHeight = 15
    }
    
    // MARK: - IBActions
    @IBAction func fillEmptyButtonTapped(_ sender: UIButton) {
        
        if fillEmptyButton.title(for: .normal) == "Fill" {
            fillEmptyButton.setTitle("Empty", for: .normal)
            /// Start animation to fill the circle
            UIView.animate(withDuration: 10) {
                self.uneri.frame = CGRect(x: 0, y: 10, width: self.circleView.frame.size.width, height: self.circleView.frame.size.height)
            }
        }
        else {
            fillEmptyButton.setTitle("Fill", for: .normal)
            UIView.animate(withDuration: 10) {
                self.uneri.frame = CGRect(x: 0, y: self.circleView.frame.size.height-10, width: self.circleView.frame.size.width, height: self.circleView.frame.size.height)
            }
        }
    }
}
