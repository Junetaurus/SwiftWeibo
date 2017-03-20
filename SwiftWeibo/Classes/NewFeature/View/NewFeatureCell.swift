//
//  NewFeatureCell.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/17.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class NewFeatureCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    var startButton: UIButton?
    
    var image: UIImage? {
        didSet {
            imageView?.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        imageView = UIImageView.init()
        self.contentView.addSubview(imageView!)
        //
        startButton = UIButton.init(type: UIButtonType.custom)
        startButton!.setTitle("开始微博", for: .normal)
        startButton!.setBackgroundImage(UIImage.init(named: "new_feature_finish_button"), for: .normal)
        startButton!.setBackgroundImage(UIImage.init(named: "new_feature_finish_button_highlighted"), for: .highlighted)
        startButton!.sizeToFit()
        startButton!.addTarget(self, action: #selector(start), for: .touchUpInside)
        self.addSubview(startButton!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = self.bounds
        
        startButton?.center = CGPoint.init(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.9)
    }
    
    func start() {
        let tabVc = TabBarController()
        UIApplication.shared.keyWindow?.rootViewController = tabVc
    }
    
    func setIndexPathWithCount(indexPath: NSIndexPath, count: NSInteger) {
        // 最后一页,开始按钮
        if indexPath.item == count - 1 {
            startButton?.isHidden = false
        } else { //非最后一页，隐藏开始按钮
            startButton?.isHidden = true
        }
    }
    
}
