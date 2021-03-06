//
//  CalendarViewController.swift
//  Calendar
//
//  Created by κΉλν on 2022/06/09.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController {
    
    private lazy var calendarView: UICalendarView = {
        let selection = UICalendarSelectionSingleDate(delegate: self)
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = .current
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.timeZone = TimeZone(abbreviation: "KST")
        calendarView.fontDesign = .rounded
        calendarView.layer.cornerRadius = 8.0
        calendarView.backgroundColor = .systemBackground
        
        calendarView.selectionBehavior = selection
                
        return calendarView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }
    }
}

extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        
        guard let date = Calendar.current.date(from: dateComponents!) else { return }

        let selectedDate = formatter.string(from: date)
        
        print(selectedDate)
    }
}
