//
//  ViewController.swift
//  Demo
//
//  Created by 刘志鹏 on 2018/11/8.
//  Copyright © 2018 lzp. All rights reserved.
//

import UIKit
import FDDCloudSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FDDCloudManager.setServerType(serverType: .test)
        FDDCloudManager.registKey(key: "b25zIENlcnRpZmlj")

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cleanAction(_ sender: Any) {
        FDDCloudManager.logOut()
    }
    @IBAction func loginAction(_ sender: Any) {
        publichAction("login")
    }
    @IBAction func loupanAction(_ sender: Any) {
        publichAction("house", diac: ["id":"95913"])
    }
    @IBAction func fangyuanAction(_ sender: Any) {
        publichAction("estate", diac: ["id":"6252623"])
    }
    @IBAction func homeAction(_ sender: Any) {
        if let vc = FDDCloudManager.getHomeVC(url: "http://10.12.14.152:3000/a.html") {
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: false, completion: nil)
        }
    }

    func publichAction(_ action: String, diac: [String: String] = [:]) {

        if let vc = FDDCloudManager.getActionVC(action: action, paths: diac) {
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: false, completion: nil)
        }
    }
    
}

