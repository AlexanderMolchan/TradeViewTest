//
//  TradeViewController.swift
//  newTest2210
//
//  Created by Александр Молчан on 21.10.23.
//

import UIKit
import WebKit

final class TradeViewController: UIViewController {
    
    // MARK: -
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        label.text = "Trade"
        return label
    }()
    
    private lazy var balanceBanner: UIView = {
        let balanceBanner = UIView()
        let titleLabel = UILabel()
        balanceBanner.backgroundColor = UIColor(red: 0.204, green: 0.216, blue: 0.282, alpha: 1)
        balanceBanner.layer.cornerRadius = 10
        balanceBanner.addSubview(titleLabel)
        titleLabel.text = "Balance"
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
        }
        return balanceBanner
    }()
    
    private lazy var balanceLabel: UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.text = "\(totalBalance)"
        balanceLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        balanceLabel.textColor = .white
        return balanceLabel
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 0.373, green: 0.714, blue: 0.471, alpha: 1)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var sellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sell", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 0.918, green: 0.310, blue: 0.298, alpha: 1)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var currencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.204, green: 0.216, blue: 0.282, alpha: 1)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.setTitle(selectedCurrencyType.rawValue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceRightToLeft
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 0).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: 36).isActive = true
        return button
    }()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.backgroundColor = .clear
        webView.layer.borderWidth = 0
        return webView
    }()
    
    private lazy var timerBanner: UIView = {
        let banner = UIView()
        let label = UILabel()
        banner.addSubview(label)
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        label.text = "Timer"
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
        }
        banner.backgroundColor = UIColor(red: 0.204, green: 0.216, blue: 0.282, alpha: 1)
        banner.layer.cornerRadius = 10
        return banner
    }()
    
    private lazy var pickerField: UITextField = {
        let field = UITextField()
        let minutes = (totalSecond % 3600) / 60
        let seconds = (totalSecond % 3600) % 60
        let timeString = String(format:"%02i:%02i",  minutes, seconds)
        field.text = timeString
        field.addDoneButtonToKeyboard(myAction: #selector(self.pickerField.resignFirstResponder))
        field.textColor = .white
        field.keyboardType = .numberPad
        return field
    }()
    
    private lazy var minusTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "minus"), for: .normal)
        button.tintColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return button
    }()
    
    private lazy var plusTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.tintColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return button
    }()
    
    private lazy var investmentBanner: UIView = {
        let banner = UIView()
        let label = UILabel()
        banner.addSubview(label)
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        label.text = "Investment"
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
        }
        banner.backgroundColor = UIColor(red: 0.204, green: 0.216, blue: 0.282, alpha: 1)
        banner.layer.cornerRadius = 10
        return banner
    }()
    
    private lazy var investmentField: UITextField = {
        let field = UITextField()
        field.textColor = .white
        field.keyboardType = .numberPad
        field.text = "\(investmentSum)"
        field.addDoneButtonToKeyboard(myAction: #selector(self.investmentField.resignFirstResponder))
        return field
    }()
    
    private lazy var minusInvestmentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "minus"), for: .normal)
        button.tintColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return button
    }()
    
    private lazy var plusInvestmentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.tintColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return button
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(blurEffectView)
        view.alpha = 0.95
        return view
    }()
    
    private lazy var indicator: UIProgressView = {
        let indicator = UIProgressView()
        indicator.progress = 0.0
        indicator.backgroundColor = .lightGray.withAlphaComponent(0.5)
        indicator.trackTintColor = .clear
        indicator.progressTintColor = UIColor(red: 0.373, green: 0.714, blue: 0.471, alpha: 1)
        indicator.layer.cornerRadius = 15
        indicator.layer.sublayers?[1].cornerRadius = 15
        indicator.clipsToBounds = true
        indicator.subviews[1].clipsToBounds = true
        return indicator
    }()
    
    private lazy var indicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var successLabel = {
        let successLabel = UILabel()
        successLabel.font = UIFont(name: "Marker Felt", size: 40)
        successLabel.textColor = UIColor(red: 0.373, green: 0.714, blue: 0.471, alpha: 1)
        successLabel.text = "SUCCESS"
        successLabel.alpha = 0
        return successLabel
    }()
    
    // MARK: -
    // MARK: - Properties
    
    private var progress: Float = 0.0
    private var timer: Timer?
    private var totalSecond = 0
    private var totalBalance = 10000
    private var investmentSum = 100
    var selectedCurrencyType: CurrencyTypes = .gpbUsd
    
    // MARK: -
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutElements()
        makeConstraints()
        addButtonActions()
        loadChart(type: .eurUsd)
        registerKeyboardNotifications()
        startAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeSuccessLabel()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // MARK: -
    // MARK: - Logic
    
    private func loadChart(type: CurrencyTypes) {
        let url = URL(string: type.url)
        guard let url else { return }
        webView.load(URLRequest(url: url))
        webView.reload()
    }
    
    private func progressImitation() {
        var newProgress: Float = 0.0
        var progressString = "\(Int(newProgress * 100))%"
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            newProgress = self.progress + 0.25
            progressString = "\(Int(newProgress * 100))%"
            self.indicator.setProgress(newProgress, animated: true)
            self.indicatorLabel.text = progressString
            self.progress = newProgress
            if self.progress == 1 {
                self.timer?.invalidate()
                self.animatedProgressRemove()
            }
        }
    }
    
    private func addButtonActions() {
        currencyButton.addTarget(self, action: #selector(changeCurrency), for: .touchUpInside)
        plusTimerButton.addTarget(self, action: #selector(timerAction(sender: )), for: .touchUpInside)
        minusTimerButton.addTarget(self, action: #selector(timerAction(sender: )), for: .touchUpInside)
        plusInvestmentButton.addTarget(self, action: #selector(investmentAction(sender: )), for: .touchUpInside)
        minusInvestmentButton.addTarget(self, action: #selector(investmentAction(sender: )), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(buyAction), for: .touchUpInside)
        sellButton.addTarget(self, action: #selector(sellAction), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: -
    // MARK: - Layout
    
    private func layoutElements() {
        tabBarController?.setTabBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red: 0.114, green: 0.122, blue: 0.173, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(balanceBanner)
        balanceBanner.addSubview(balanceLabel)
        view.addSubview(buyButton)
        view.addSubview(sellButton)
        view.addSubview(timerBanner)
        view.addSubview(investmentBanner)
        view.addSubview(currencyButton)
        view.addSubview(webView)
        timerBanner.addSubview(pickerField)
        timerBanner.addSubview(minusTimerButton)
        timerBanner.addSubview(plusTimerButton)
        investmentBanner.addSubview(investmentField)
        investmentBanner.addSubview(minusInvestmentButton)
        investmentBanner.addSubview(plusInvestmentButton)
    }
    
    private func makeConstraints() {
        let screen = UIScreen.main.bounds.width
        let bottomElementsWidth = (screen - 71) / 2
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(67)
            make.centerX.equalToSuperview()
        }
        
        balanceBanner.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(54)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
        }
        
        buyButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(90)
            make.height.equalTo(54)
            make.width.equalTo(bottomElementsWidth)
        }
        
        sellButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(90)
            make.height.equalTo(54)
            make.width.equalTo(bottomElementsWidth)
        }
        
        timerBanner.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.bottom.equalTo(sellButton.snp.top).inset(-12)
            make.height.equalTo(54)
            make.width.equalTo(bottomElementsWidth)
        }
        
        investmentBanner.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(buyButton.snp.top).offset(-12)
            make.height.equalTo(54)
            make.width.equalTo(bottomElementsWidth)
        }
        
        currencyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(54)
            make.bottom.equalTo(timerBanner.snp.top).inset(-12)
        }
        
        webView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(balanceBanner.snp.bottom).offset(25)
            make.bottom.equalTo(currencyButton.snp.top).offset(-16)
        }
        
        pickerField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(7)
        }
        
        investmentField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(7)
        }
        
        minusTimerButton.snp.makeConstraints { make in
            make.centerY.equalTo(pickerField.snp.centerY)
            make.leading.equalToSuperview().offset(15)
        }
        
        minusInvestmentButton.snp.makeConstraints { make in
            make.centerY.equalTo(pickerField.snp.centerY)
            make.leading.equalToSuperview().offset(15)
        }
        
        plusTimerButton.snp.makeConstraints { make in
            make.centerY.equalTo(pickerField.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
        
        plusInvestmentButton.snp.makeConstraints { make in
            make.centerY.equalTo(pickerField.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    // MARK: -
    // MARK: - Actions
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        guard let keyboardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        self.view.frame.origin.y = 0 - keyboardFrameSize.height
    }
    
    @objc private func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
    @objc private func endEditing() {
        pickerField.endEditing(true)
        investmentField.endEditing(true)
    }
    
    @objc private func changeCurrency() {
        let currencyVc = CurrencyViewController(selectedCurrency: selectedCurrencyType)
        currencyVc.changeCurrency = { currencyType in
            self.selectedCurrencyType = currencyType
            self.currencyButton.setTitle(currencyType.rawValue, for: .normal)
            self.loadChart(type: currencyType)
        }
        navigationController?.pushViewController(currencyVc, animated: true)
    }
    
    @objc private func timerAction(sender: UIButton) {
        if sender == plusTimerButton {
            totalSecond += 1
        } else {
            guard totalSecond > 0 else { return }
            totalSecond -= 1
        }
        let minutes = (totalSecond % 3600) / 60
        let seconds = (totalSecond % 3600) % 60
        let timeString = String(format:"%02i:%02i",  minutes, seconds)
        pickerField.text = timeString
    }
    
    @objc private func investmentAction(sender: UIButton) {
        if sender == plusInvestmentButton {
            investmentSum += 100
        } else {
            guard investmentSum >= 100 else { return }
            investmentSum -= 100
        }
        investmentField.text = "\(investmentSum)"
    }
    
    @objc private func buyAction() {
        guard !investmentField.text.isEmptyOrNil else { return }
        guard let textFromField = investmentField.text,
              let summFromField = Int(textFromField)
        else { return }
        investmentSum = summFromField
        guard totalBalance >= investmentSum else { return }
        totalBalance = totalBalance - investmentSum
        balanceLabel.text = "\(totalBalance)"
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { _ in
            let random = Int.random(in: 0...100)
            if random > 30 {
                self.successAnimation()
                let profitSumm = self.investmentSum * 2
                self.totalBalance = self.totalBalance + profitSumm
                self.balanceLabel.text = "\(self.totalBalance)"
            }
        }
    }
    
    @objc private func sellAction() {
        guard !investmentField.text.isEmptyOrNil else { return }
        guard let textFromField = investmentField.text,
              let summFromField = Int(textFromField)
        else { return }
        investmentSum = summFromField
        totalBalance = totalBalance + investmentSum
        balanceLabel.text = "\(totalBalance)"
        successAnimation()
    }
    
    // MARK: -
    // MARK: - Animations
    
    private func startAnimation() {
        view.addSubview(blurView)
        blurView.frame = view.bounds
        blurView.addSubview(indicator)
        indicator.addSubview(indicatorLabel)
        indicator.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(30)
            make.center.equalTo(view.snp.center)
        }
        indicatorLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        progressImitation()
    }
    
    private func animatedProgressRemove() {
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self else { return }
            self.indicator.alpha = 0
            self.blurView.alpha = 0
            self.indicatorLabel.alpha = 0
        } completion: { isFinish in
            guard isFinish else { return }
            UIView.animate(withDuration: 0.4) { [weak self] in
                guard let self else { return }
                self.indicatorLabel.removeFromSuperview()
                self.indicator.removeFromSuperview()
                self.blurView.removeFromSuperview()
                self.tabBarController?.setTabBarHidden(false, animated: true)
            } completion: {isFinish in
                guard isFinish else { return }
                NotificationManager().requestNotifications()
            }
        }
    }
    
    private func successAnimation() {
        view.addSubview(successLabel)
        successLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        UIView.animate(withDuration: 0.2) {
            self.successLabel.alpha = 1
        } completion: {  isFinish in
            guard isFinish else { return }
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self else { return }
                self.successLabel.alpha = 0
            } completion: { isFinish in
                guard isFinish else { return }
                UIView.animate(withDuration: 0.2) { [weak self] in
                    guard let self else { return }
                    self.successLabel.alpha = 1
                } completion: {  isFinish in
                    guard isFinish else { return }
                    UIView.animate(withDuration: 0.2) { [weak self] in
                        guard let self else { return }
                        self.successLabel.alpha = 0
                    } completion: {  isFinish in
                        guard isFinish else { return }
                        self.successLabel.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    private func removeSuccessLabel() {
        successLabel.removeFromSuperview()
    }

}

