//
//  MasterViewController.swift
//  ViewControllerContainment
//
//  Created by Nathan Hsu on 2019-02-16.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    
    lazy var summaryVC: SummaryViewController = {
        let storyboard = UIStoryboard.init(name: "SummaryViewController", bundle: nil)
        return SummaryViewController.instantiate(from: storyboard, identifier: "SummaryViewController")
    }()

    lazy var sessionsVC: SessionsViewController = {
        return SessionsViewController.instantiateFromStoryboardWithIdenticalNameAndIdentifier()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addChild(summaryVC)
        view.addSubview(summaryVC.view)
        summaryVC.view.frame = view.bounds
        
        addChild(sessionsVC)
        view.addSubview(sessionsVC.view)
        sessionsVC.didMove(toParent: self)
        
        setupSegmentedControl()
        updateView()

    }
    
    private func updateView() {
        summaryVC.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
        sessionsVC.view.isHidden = (segmentedControl.selectedSegmentIndex == 0)
    }

    private func setupSegmentedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }

    @objc
    func selectionDidChange(sender: UISegmentedControl) {
        updateView()
    }
}

