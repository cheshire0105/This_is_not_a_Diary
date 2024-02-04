//
//  ThirdView.swift
//  This_is_not_a_Diary
//
//  Created by cheshire on 1/29/24.
//


import UIKit
import SnapKit

class ThirdView: UIViewController, GradientAnimatable {
    var textView: UITextView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyGradientAnimation(on: self.view)
        navigationBarHidden()
        navigationBackSwipeMotion()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        setupKeyboardNotifications()
        setupKeyboardAccessoryView() // 액세서리 뷰 설정 호출

    }

    //MARK: - 네비게이션 바 숨기는 함수
    func navigationBarHidden() {
        self.navigationController?.navigationBar.isHidden = true
    }

    //MARK: - 네비게이션 백 스와이프 모션으로도 뒤로가기가 가능하도록 만들어주는 함수
    func navigationBackSwipeMotion() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    func setupTextView() {
        textView = UITextView()
        textView.backgroundColor = .clear // 투명 배경
        textView.textColor = .white // 흰색 텍스트
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.tintColor = .white // 텍스트 뷰 커서 색상 변경

        view.addSubview(textView)

        textView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        textView.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardSize.height)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        textView.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func setupKeyboardAccessoryView() {
        let accessoryView = UIView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 44))
        accessoryView.backgroundColor = .clear // 적당한 배경색 선택

        let sendButton = UIButton(type: .system)
        if let paperplaneImage = UIImage(systemName: "paperplane") {
            sendButton.setImage(paperplaneImage, for: .normal)
        }
        sendButton.tintColor = .white // 아이콘 색상 설정
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)

        accessoryView.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }

        textView.inputAccessoryView = accessoryView
    }


    @objc func sendButtonTapped() {
         let fourViewController = FourView()
         fourViewController.userText = textView.text
         fourViewController.isKorean = isKoreanText(textView.text) // 여기서 언어를 판별하는 로직을 사용하여 isKorean 값을 설정합니다.
         navigationController?.pushViewController(fourViewController, animated: true)
     }

    func isKoreanText(_ text: String) -> Bool {
        for scalar in text.unicodeScalars {
            if scalar.isHangul {
                return true
            }
        }
        return false
    }

}

extension UnicodeScalar {
    var isHangul: Bool {
        return (0xAC00...0xD7A3).contains(self.value)
    }
}
