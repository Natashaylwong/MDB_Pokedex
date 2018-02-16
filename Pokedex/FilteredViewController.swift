//
//  FilteredViewController.swift
//  Pokedex
//
//  Created by Natasha Wong on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class FilteredViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        settingSC()

        // Do any additional setup after loading the view.
    }
    
    func settingSC() {
        let items = ["Grid View", "List View"]
        var customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        customSC = UISegmentedControl(frame: CGRect(x: 30, y: 10, width: view.frame.width - 60, height: 40))
        
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = .red
        customSC.tintColor = .white
        
        // Add target action method
      //  customSC.addTarget(self, action: Selector("______"), for: .valueChanged)
        
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
