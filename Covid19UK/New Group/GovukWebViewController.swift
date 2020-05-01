//
//  GovukWebViewController.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 23/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import UIKit
import WebKit

class GovukWebViewController: UIViewController {


    @IBOutlet weak var govukWebView: WKWebView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://www.gov.uk/guidance/coronavirus-covid-19-information-for-the-public"){
            let request = URLRequest(url: url)
            govukWebView.load(request)
        }

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
