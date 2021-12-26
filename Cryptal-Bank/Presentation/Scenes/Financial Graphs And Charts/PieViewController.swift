import Charts
import UIKit

var  Months  = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"]

class PieViewController: UIViewController, ChartViewDelegate {
    
    
    var pieChart = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        pieChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        
        var entries = [ChartDataEntry]()
        
        for x in 6500..<6517 {
            entries.append(ChartDataEntry(x: Double(x),
                                          y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        
        set.colors = ChartColorTemplates.pastel()
        
        let data = PieChartData(dataSet: set)
        
        pieChart.data = data
        
    }
    
}
