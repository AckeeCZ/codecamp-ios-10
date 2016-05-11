//
//  TodayViewController.swift
//  PhotoWidget
//
//  Created by Jan Mísař on 11.05.16.
//  Copyright © 2016 Ackee. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

    weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRectMake(10, 10, 300, 40))
        label.backgroundColor = .whiteColor()
        label.text = "Hello world!"
        self.view.addSubview(label)
        self.label = label
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        label.text = "Ahoj světe!"

        completionHandler(NCUpdateResult.NewData)
    }
}
