//
//  MainViewController.swift
//  Calendar
//
//  Created by 김동혁 on 2022/06/13.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private lazy var openCalendarButton: UIButton = {
        let button = UIButton()
        button.setTitle("달력 나와라!!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23.0, weight: .bold)
        button.titleLabel?.textColor = .systemBackground
        button.addTarget(self, action: #selector(tapOpenCalendarButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
    }
    
    func setupButton() {
        view.addSubview(openCalendarButton)
        
        openCalendarButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(32.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    func showCalendarVC() {
        let vc = CalendarViewController()
        
        guard let presentation = vc.presentationController as? UISheetPresentationController else { return }
        
        presentation.detents = [.medium()]
        present(vc, animated: true)
    }
}

private extension MainViewController {
    @objc func tapOpenCalendarButton() {
        showCalendarVC()
    }
}
