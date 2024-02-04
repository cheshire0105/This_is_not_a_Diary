//
//  GradientAnimatable.swift
//  This_is_not_a_Diary
//
//  Created by cheshire on 1/29/24.
//

import Foundation
import UIKit

protocol GradientAnimatable {
    func applyGradientAnimation(on view: UIView)
}

extension GradientAnimatable where Self: UIViewController {
    func applyGradientAnimation(on view: UIView) {
        view.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.604, green: 0.451, blue: 0.71, alpha: 1).cgColor,
            UIColor(red: 0.38, green: 0.224, blue: 0.561, alpha: 1).cgColor
        ]
        self.view.layer.insertSublayer(gradientLayer, at: 0)

        animateGradient(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    func animateGradient(_ gradientLayer: CAGradientLayer) {
        let color1 = UIColor(red: 0.604, green: 0.451, blue: 0.71, alpha: 1).cgColor
        let color2 = UIColor(red: 0.38, green: 0.224, blue: 0.561, alpha: 1).cgColor
        let color3 = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1).cgColor
        let color4 = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [color1, color2]
        animation.toValue = [color3, color4]
        animation.duration = 5.0 // 애니메이션 지속 시간
        animation.autoreverses = true // 애니메이션이 반대로도 재생
        animation.repeatCount = Float.infinity // 애니메이션 무한 반복

        gradientLayer.add(animation, forKey: nil)
    }
}
