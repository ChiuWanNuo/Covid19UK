//
//  MainViewController.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 23/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {
    
    @IBOutlet weak var confirmednumberLabel: UILabel!
    @IBOutlet weak var deathnumberLabel: UILabel!
    @IBOutlet weak var testednumberLabel: UILabel!
    @IBOutlet weak var postrateLabel: UILabel!
    @IBOutlet weak var mortalityLabel: UILabel!
    @IBOutlet weak var negativenumberLabel: UILabel!
    @IBOutlet weak var dailydataButton: UIButton!
    @IBOutlet weak var govukButton: UIButton!
    @IBOutlet weak var barchartView: BarChartView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
