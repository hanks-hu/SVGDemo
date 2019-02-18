//
//  FilterViewController.swift
//  SVGDemo
//
//  Created by 胡智林 on 2019/2/18.
//  Copyright © 2019 胡智林. All rights reserved.
//

import UIKit
import SVGKit
class FilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let svgImage = SVGKImage.init(named: "ICO 好妈圈(当前)@2x.svg")!
        let svgImgView = SVGKFastImageView.init(svgkImage: svgImage)!
        view.addSubview(svgImgView)
        
        svgImgView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    

    

}
