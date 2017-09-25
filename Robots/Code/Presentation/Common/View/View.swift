//
//  View.swift
//  Robots
//
//  Created by Сергей Полозов on 25.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class View: UIView {

    // MARK: View state

    enum State {
        case initial, loading, items, error, zero
    }

    var state: State = .initial {
        didSet { didSet(state: state) }
    }

    private func didSet(state: State) {
        switch state {
        case .initial: setInitialState()
        case .loading: setLoadingState()
        case .items: setItemsState()
        case .error: setErrorState()
        case .zero: setZeroState()
        }
    }

    func setInitialState() {}
    func setLoadingState() {}
    func setItemsState() {}
    func setErrorState() {}
    func setZeroState() {}

    // MARK: Properties

    var errorBlock: Block?
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let errorView: UIView = UIView()
    let errorLabel: UILabel = ErrorViewLabelLabel()
    let errorButton: UIButton = GreenTextButton(type: .custom)

    let errorButtonWidth: CGFloat = CGFloat(220)
    let errorButtonHeight: CGFloat = CGFloat(45)

    // MARK: Initialization and deinitialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        addEndEditingGesture()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        addEndEditingGesture()
    }

    // MARK: Internal helpers

    func finishEditing() {
        endEditing(true)
    }

    func errorAction() {
        errorBlock?()
    }

    // MARK: Private Helpers

    private func initSubviews() {
        initErrorView()
        initSpinner()
    }

    private func initSpinner() {
        spinner.hidesWhenStopped = true
        spinner.isHidden = true
        addCentered(subview: spinner)
    }

    private func initErrorView() {
        errorView.isHidden = true
        addSubview(errorView)
        errorView.backgroundColor = .clear
        errorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        errorView.addSubview(errorLabel)
        errorView.addSubview(errorButton)
        initErrorLabel()
        initErrorButton()
        sendSubview(toBack: errorView)
    }

    private func initErrorLabel() {
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.text = .ErrorViewLabel
        errorLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    private func initErrorButton() {
        errorButton.setTitle(.ErrorButtonText, for: .normal)
        errorButton.addTarget(self, action: #selector(errorAction), for: .touchUpInside)
        errorButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(errorButtonWidth)
            make.height.equalTo(errorButtonHeight)
            make.top.equalTo(errorLabel.snp.bottom).offset(15)
        }
    }

    private func addEndEditingGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(View.finishEditing))
        gesture.delaysTouchesBegan = false
        gesture.cancelsTouchesInView = false
        gesture.delegate = self
        addGestureRecognizer(gesture)
    }
}

extension View: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return !(touch.view?.isKind(of: UIControl.self) ?? false)
    }
}
