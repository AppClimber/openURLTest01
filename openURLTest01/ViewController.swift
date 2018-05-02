//
//  ViewController.swift
//  openURLTest01
//
//  Created by Masahiko Minagawa on 2018/05/02.
//  Copyright © 2018年 Sony Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let titles = ["openURL1", "openURL2", "openURL3"]
    
    override func viewDidLoad() {
        
        // delegate, dataSource は Storyboard の Outlet で設定した
        // tableView.delegate = self
        // tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row=\(indexPath.row)")
        
        //let cell = self.tableView.cellForRow(at: indexPath)
        switch indexPath.row {
        case 0: // openURL1
            simpleOpenURL()
        default:
            print("Do nothing")
        }
    }
    
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("indexPath.row=\(indexPath.row)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCellID", for: indexPath)
        
        cell.textLabel?.text = titles[indexPath.row]
        
        return cell;
    }

    
    // MARK: Private method
    
    func simpleOpenURL() {
        print(#file, #function)
     
        UIApplication.shared.open(URL(string: "https://www.yahoo.co.jp")!,
                                  options: [:],
                                  completionHandler: { result in
                                    print("result=\(result)")
        })
        // 現在サポートされているOptionは，UIApplicationOpenURLOptionUniversalLinksOnlyのみ
        // https://developer.apple.com/documentation/uikit/uiapplication/url_options?language=swift
    }

}
