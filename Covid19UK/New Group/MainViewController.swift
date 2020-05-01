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
    @IBOutlet weak var areaButton: UIButton!
    @IBOutlet weak var updatetimeLabel: UILabel!
    @IBOutlet weak var barchartView: BarChartView!
    
    var vriusInfo : Vrius?
    var dailydate : [Vrius.VriusInfo] = []
    var dateArray = [String]()
    
    var axisFormatDelgate: IAxisValueFormatter?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setChart()
    }
    
    
    func getData(){
        let urlStr = "https://api.covid19uk.live"
        if let url = URL(string: urlStr) {
            //print("Enter URL")
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                if let data = data {
                    do {
                        
                        let vrius = try decoder.decode(Vrius.self, from: data)
                        self.vriusInfo = vrius
                        //print("did get")
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        let updateString = self.vriusInfo?.data.first?.ts
                        let updatetimeString = dateFormatter.string(from: updateString!)
                        self.dateArray.append(updatetimeString)
                        
                        DispatchQueue.main.async {
                            if let confirmednumber = self.vriusInfo?.data[0].confirmed,
                                let deathnumber = self.vriusInfo?.data[0].death,
                                let testednumber = self.vriusInfo?.data[0].tested,
                                let negativenumber = self.vriusInfo?.data[0].negative {
                                self.confirmednumberLabel.text = "\(confirmednumber)"
                                self.deathnumberLabel.text = "\(deathnumber)"
                                self.testednumberLabel.text = "\(testednumber)"
                                self.negativenumberLabel.text = "\(negativenumber)"
                                self.postrateLabel.text = String(format: "%.2f", Double(Double(confirmednumber) / Double(testednumber) * 100)) + "%"
                                self.mortalityLabel.text = String(format: "%.2f", Double(Double(deathnumber) / Double(confirmednumber) * 100)) + "%"
                                self.updatetimeLabel.text = "Update: " + "\(updatetimeString)"
                            }
                        }
                        
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func setChart() {
        //生成一個存放資料的array
        var dataEntries: [BarChartDataEntry] = []
        
        let urlStr = "https://api.covid19uk.live/historyfigures"
        if let url = URL(string: urlStr) {
            //print("Enter URL")
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                
                if let data = data {
                    do {
                        let dailydates = try decoder.decode(Vrius.self, from: data)
                        self.vriusInfo = dailydates
                        //print("did get")
                        DispatchQueue.main.async {
                            
                            self.view.reloadInputViews()
                            
                            // 用來存入每筆顯示資料內容的迴圈
                            for i in 0..<dailydates.data.count {
                                //set xAxis,yAxis display data
                                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(dailydates.data[i].confirmed))
                                //把每次生成的dataEntry存入到dataEntries裡
                                dataEntries.append(dataEntry)
                                
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "MM/dd"
                                let dateString = self.vriusInfo?.data[i].date
                                let dailydateString = dateFormatter.string(from: dateString!)
                                self.dateArray.append(dailydateString)
                            }
                            
                            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Cumulative case")
                            //hide values on chart
                            chartDataSet.drawValuesEnabled = false
                            let chartData = BarChartData(dataSet: chartDataSet)
                            self.barchartView.data = chartData
                            self.barchartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.dateArray)
                            self.barchartView.xAxis.granularity = 1
                            self.barchartView.backgroundColor = UIColor.black
                            self.barchartView.legend.textColor = UIColor.white
                            //change yAxis color
                            self.barchartView.leftAxis.labelTextColor = UIColor.white
                            //change xAxis color
                            let xAxis = self.barchartView.xAxis
                            xAxis.labelTextColor = UIColor.white
                            //print("get chart")
                        }
                    } catch {
                        print (error)
                    }
                }
            }
            task.resume()
            //print("take resume")
        }
        
        
    }
    
    @IBSegueAction func areaPage(_ coder: NSCoder) -> AreaTableViewController? {
        let controller = AreaTableViewController (coder: coder)
        return controller
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
