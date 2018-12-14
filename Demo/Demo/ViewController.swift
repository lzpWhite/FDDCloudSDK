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

    @IBOutlet weak var userid: UITextField!
    @IBOutlet weak var textFile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置环境 默认正式环境
        FDDCloudManager.setServerType(serverType: .test)
        // 初始化SDK
        FDDCloudManager.registKey(key: "b25zIENlcnRpZmlj")

        FDDCloudManager.shareEventBlock { (type, model) in
            if type == FDDCloudShareType.wechatSession {
                // 分享到好友
                print("title  : \(model?.hlinkWechatTitle ?? "")")
                print("content: \(model?.hlinkWechatSummary ?? "")")
                print("url    : \(model?.hlink ?? "")")
                print("icon   : \(model?.hlinkPicUrl ?? "")")

            } else if type == FDDCloudShareType.wechatTimeLine {
                // 分享到朋友圈
                print("title  : \(model?.hlinkWechatTitle ?? "")")
                print("url    : \(model?.hlink ?? "")")
                print("icon   : \(model?.hlinkPicUrl ?? "")")
            }
            print(type.rawValue)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func text(_ sender: Any) {
        if let vc = FDDCloudManager.getVC(with: "http://d.fangdd.com/op/jsbridge") {
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: false, completion: nil)
        }
    }
    @IBAction func cleanAction(_ sender: Any) {
        // 退出登录调用
        FDDCloudManager.logOut()
    }
    @IBAction func login(_ sender: Any) {
        if let id = userid.text, !id.isEmpty {
            FDDCloudManager.setFddUserId(userId: Int(id) ?? 0)
        }
    }
    @IBAction func jump(_ sender: Any) {
        if let str = textFile.text, str.isEmpty == false {
            if str.hasPrefix("http") {
                if let vc = FDDCloudManager.getVC(with: str) {
                    let nc = UINavigationController(rootViewController: vc)
                    self.present(nc, animated: false, completion: nil)
                }
            } else {
                if let vc = FDDCloudManager.getActionVC(action: str) {
                    let nc = UINavigationController(rootViewController: vc)
                    self.present(nc, animated: false, completion: nil)
                }
            }
        }
    }
    
}

