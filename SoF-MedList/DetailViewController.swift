//
//  DetailViewController.swift
//  SoF-MedList
//
//  Created by Pascal Pfiffner on 6/20/14.
//  Copyright (c) 2014 SMART Platforms. All rights reserved.
//

import UIKit
import SMART


class DetailViewController: UIViewController, UISplitViewControllerDelegate
{
	@IBOutlet var detailDescriptionLabel: UILabel?
	var masterPopoverController: UIPopoverController? = nil

	/// The prescription to show details about
	var prescription: MedicationPrescription? {
		didSet {
		    // Update the view.
		    self.configureView()
			
		    if self.masterPopoverController != nil {
		        self.masterPopoverController!.dismissPopoverAnimated(true)
		    }
		}
	}
	
	func configureView() {
		// Update the user interface for the detail item.
		if let detail = prescription {
		    if let label = self.detailDescriptionLabel {
		        label.text = detail.description
		    }
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// #pragma mark - Split view

	func splitViewController(splitController: UISplitViewController, willHideViewController viewController: UIViewController, withBarButtonItem barButtonItem: UIBarButtonItem, forPopoverController popoverController: UIPopoverController) {
	    barButtonItem.title = "Master" // NSLocalizedString(@"Master", @"Master")
	    self.navigationItem.setLeftBarButtonItem(barButtonItem, animated: true)
	    self.masterPopoverController = popoverController
	}

	func splitViewController(splitController: UISplitViewController, willShowViewController viewController: UIViewController, invalidatingBarButtonItem barButtonItem: UIBarButtonItem) {
	    // Called when the view is shown again in the split view, invalidating the button and popover controller.
	    self.navigationItem.setLeftBarButtonItem(nil, animated: true)
	    self.masterPopoverController = nil
	}
	func splitViewController(splitController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
	    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
	    return true
	}

}

