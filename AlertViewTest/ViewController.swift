//
//  ViewController.swift
//  AlertViewTest
//
//  Created by Yans on 16/5/22.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    let alert = AlterView(alterShow: .Down)
    
    @IBAction func showAlert(sender: UIButton) {
        alert.show(self.view)
    }
    @IBAction func dismissAlert(sender: UIButton) {
        alert.dismiss()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

