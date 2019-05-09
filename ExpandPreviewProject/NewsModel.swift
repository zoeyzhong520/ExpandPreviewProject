//
//  NewsModel.swift
//  ExpandPreviewProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class NewsModel: NSObject {

    var title: String? {//标题
        didSet {
            //在这里计算好文本高度，避免了tableView动态计算高度时的内存损耗，提升滑动流畅度
            calculateTextHeight()
        }
    }
    var cellHeight: CGFloat = 0//行高
    var isOpen: Bool = false//展开标识
    
    ///计算文本高度
    func calculateTextHeight() {
        if title == nil {
            return
        }
        
        let w = ScreenSize.width - 30
        let h = CGFloat.greatestFiniteMagnitude
        let height = (title! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil).size.height
        cellHeight = height + 30
        print("cellHeight = \(cellHeight)")
    }
    
}
