//
//  ViewController.swift
//  This_is_not_a_Diary
//
//  Created by cheshire on 1/29/24.
//

import UIKit

class FirstView: UIViewController, GradientAnimatable {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyGradientAnimation(on: self.view)
        navigationBarHidden()
        navigationBackSwipeMotion()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        setupLabel()


    }

    //MARK: - 네비게이션 바 숨기는 함수
    func navigationBarHidden() {
        self.navigationController?.navigationBar.isHidden = true
    }

    //MARK: - 네비게이션 백 스와이프 모션으로도 뒤로가기가 가능하도록 만들어주는 함수
    func navigationBackSwipeMotion() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    func setupLabel() {
        let label = UILabel()
        label.text = "Get into the emotions..."
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }

    func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap() {
        let secondViewController = SecondView()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
