//
//  NewsView.swift
//  ExpandPreviewProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class NewsView: UIView {

    ///数据源
    var dataArray: [NewsModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: BaseTableReuseIdentifier)
        tableView.estimatedRowHeight = 100
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(tableView)
    }
    
}

extension NewsView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsCell.createCellWith(tableView: tableView, indexPath: indexPath)
        cell.model = dataArray?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell: NewsCell = tableView.cellForRow(at: indexPath) as? NewsCell {
            cell.model!.isOpen = !cell.model!.isOpen
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //返回模型中计算好的文本高度
        let model = dataArray?[indexPath.row]
        return model?.cellHeight ?? 0
    }
    
}
