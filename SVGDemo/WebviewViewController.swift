//
//  WebviewViewController.swift
//  SVGDemo
//
//  Created by 胡智林 on 2019/2/18.
//  Copyright © 2019 胡智林. All rights reserved.
//

import UIKit
import WebKit
class WebviewViewController: UIViewController {
    lazy var webView = UIWebView.init(frame: view.bounds)
    lazy var wkWebView: WKWebView = {
        let config = WKWebViewConfiguration.init()
        let webView = WKWebView.init(frame: view.bounds, configuration: config)
        return webView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "使用webview"
        
        view.addSubview(wkWebView)
        view.addSubview(webView)
        view.backgroundColor = .white
        wkWebView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        webView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        let svgPath = Bundle.main.path(forResource: "ICO 好妈圈(当前)@2x.svg", ofType: nil)
        
        if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: tigerPath ?? "")) {
            let dataStr = String.init(data: data, encoding: .utf8) ?? ""
            wkWebView.loadHTMLString(dataStr, baseURL: nil)
//            webView.loadHTMLString(dataStr, baseURL: nil)
        }
        if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: svgPath ?? "")) {
            let dataStr = String.init(data: data, encoding: .utf8) ?? ""
//            wkWebView.loadHTMLString(dataStr, baseURL: nil)
            webView.loadHTMLString(dataStr, baseURL: nil)
        }
        
    }
    

    

}
