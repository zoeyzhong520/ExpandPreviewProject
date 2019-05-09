//
//  NewsViewController.swift
//  ExpandPreviewProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {

    var dataArray = [NewsModel]()//数据源
    
    lazy var newsView: NewsView = {
        let newsView = NewsView(frame: CGRect(x: 0, y: 0, width: ScreenSize.width, height: ContentHeight))
        return newsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPage()
        requestAPI()
    }
    
    func requestAPI() {
        let dic = Bundle.readDataWith(fileName: "content", fileType: "json")
        let tmpArr = dic["news"] as! [[String: Any]]
        for tmpDic in tmpArr {
            let model = NewsModel()
            model.title = tmpDic["title"] as? String
            dataArray.append(model)
        }
        print("dataArray = \(dataArray)")
        newsView.dataArray = dataArray
    }
    
    func setPage() {
        title = "演示"
        view.addSubview(newsView)
    }

}
