# FDDCloudSDK
房多多saas云平台 SDK

# 接入方法
```
pod 'FDDCloudSDK'
```

# 使用方法
### 需要通过bundid注册 对应的Key
1.   注册
```
/// 初始化注册SDK
///
/// - Parameter key: key
 FDDCloudManager.registKey(key: "xxxx")
```
2. 获取对应ViewController
```
/// 获取跳转的页面
///
/// - Parameters:
///   - action: 页面路由名字
///   - paths: 路径中的参数,key=value形式。 eg. /house/detail/{houseId} .["houseId": "123"]
///   - query: 路径后面的参数,key=value形式。 eg. /house/detail/123?query=ass ["query": "ass"]
/// - Returns: 返回对应的VC，未获取到页面时为空
let vc = FDDCloudManager.getActionVC(action: String, paths: [String : String]? = nil, query: [String: String]? = nil)
```
3. 通过url获取ViewController
```
/// 获取跳转的页面
///
/// - Parameters:
///   - action: 页面的Url
/// - Returns: 返回VC，未获取到页面时为空
let vc = FDDCloudManager.getHomeVC(url: "url")
```
4. 退出登录调用
```
FDDCloudManager.logOut()
```

5. 微信原生分享
```
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
```
