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

    @IBOutlet weak var textFile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置环境 默认正式环境
        FDDCloudManager.setServerType(serverType: .test)
        // 初始化SDK
        FDDCloudManager.registKey(key: "b25zIENlcnRpZmlj")
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cleanAction(_ sender: Any) {
        // 退出登录调用
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
        if let vc = FDDCloudManager.getVC(with: "http://d.fangdd.com/jsbridge") {
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: false, completion: nil)
        }
    }

    @IBAction func inputClick(_ sender: Any) {
        if let str = textFile.text, str.isEmpty == false,  let vc = FDDCloudManager.getVC(with: str) {
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

