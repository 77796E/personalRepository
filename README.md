# 自己做的一个Swift天气小项目

项目简述:
1. 在story board模式下实现, 代码文件严格遵循MVC
2. 涉及UIViewController, UITableViewController(初学)
3. 第一次访问需要定位授权, 后续可自行更改查询的城市地点, 针对textfield的文本内容做了信息排查
4. 做了正向传值(首页点击定位, 将当前页面的城市名传递到定位页面), 反向传值(定位页面的textfield内容通过自定义协议, 以代理方式回传主页面)
5. 点击右下进入24小时天气详情页面(TableViewController实现)
6. 图标数据存放在Assets中, 其他数据来源于和风天气API - https://dev.qweather.com/
7. 引用的包: Alamofire做webAPI申请, SwiftJSON解析传回的数据

项目演示:

![image](https://github.com/77796E/personalRepository/demo.gif)

其他闲话:
1. 从0开始的第一个Swift项目, 做了大概一周
2. 项目更新思路: 引用更多数据, 试一试TableVC的增删改查实现, 数据图表化
3. 加油💪🏻💪🏻!!!

