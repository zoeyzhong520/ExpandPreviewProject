//
//  NewsCell.swift
//  ExpandPreviewProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    ///模型
    var model: NewsModel? {
        didSet {
            //使用numberOfLines的属性来控制文本的展示行数
            label.numberOfLines = model?.isOpen == true ? 0 : 4
            label.text = model?.title
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addViews() {
        contentView.addSubview(label)
        
            /* 约束的设置,控件内部约束由自己添加，比如宽高，如果是与其他的
             
                                   控件约束那么有父控件添加
             
                             
             
                             ＊创建约束 NSLayoutConstraint  参数 说明：
             
                             * item 自己
             
                             * attribute
             
                             * relatedBy 大于等于 小于等于 等于
             
                             * toItem 另外一个控件
             
                             * attribute 另一个控件的熟悉
             
                             * multiplier 乘以多少
             
                             * constant : 加上多少
             
                             * NSLayoutConstraint : 某个控件的属性值 等于 另外一个控件的属性值
             
                                                           乘以多少 加上多少
             
                             
             
                             * 添加约束 addConstraint
             
                             */
        //label布局撑满整个Cell
        label.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 15)
        let rightConstraint = NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: -20)
        let topConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 15)
        let bottomConstraint = NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -15)
        label.superview?.addConstraint(leftConstraint)
        label.superview?.addConstraint(rightConstraint)
        label.superview?.addConstraint(topConstraint)
        label.superview?.addConstraint(bottomConstraint)
    }
    
    ///创建Cell
    class func createCellWith(tableView: UITableView, indexPath: IndexPath) -> NewsCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableReuseIdentifier, for: indexPath) as? NewsCell
        if cell == nil {
            cell = NewsCell(style: .default, reuseIdentifier: BaseTableReuseIdentifier)
        }
        return cell!
    }
    
}
