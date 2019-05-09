# ExpandPreviewProject
新闻点击展开预览

tableView自动行高的使用，设置行高为 UITableViewAutomaticDimension ，默认设置新闻内容label的行高为2，点击后变为0（即全部显示）
需要注意的是使用storyBoard进行约束时，必须将 tableViewCell 的 ContentView 从上到下填满，否则无法计算出当前行高。
