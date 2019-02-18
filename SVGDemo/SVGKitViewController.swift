//
//  SVGKitViewController.swift
//  SVGDemo
//
//  Created by 胡智林 on 2019/2/18.
//  Copyright © 2019 胡智林. All rights reserved.
//

import UIKit
import SVGKit
class SVGKitViewController: UIViewController {
    let svgView = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "使用svgkit"
        ///创建SVGKImage
        let svgImage = SVGKImage.init(named: "ICO 好妈圈@2x 2.svg")!
        let svgImgView = SVGKFastImageView.init(svgkImage: svgImage)!
        svgView.image = svgImage.uiImage
        ///可以自己设置大小，有些svg没有设置size，这里需要设置下
        //        svgImage.size = .init(width: 100, height: 100)
        view.addSubview(svgView)
        view.addSubview(svgImgView)
        
        svgView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        svgImgView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    
}
