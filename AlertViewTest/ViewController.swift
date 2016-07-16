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
        slider.tintColor = UIColor ( red: 0.1167, green: 0.7938, blue: 0.8969, alpha: 1.0 )
        slider.minimumValue = 80.0
        slider.maximumValue = 100.0
        slider.addTarget(self, action: #selector(sliderChanged), forControlEvents: .ValueChanged)
        
    }

    dynamic func sliderChanged() {
        rainBow.value = CGFloat(slider.value)
        sliderValue.text = String(slider.value)
    }
    
    let alert = AlterView(alterShow: .Fade)
    
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

