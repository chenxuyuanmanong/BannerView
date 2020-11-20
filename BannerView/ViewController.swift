//
//  ViewController.swift
//  BannerView
//
//  Created by kaiya on 2020/11/17.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    lazy var bannerView : BannerView = {
        let banner = BannerView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 250))
        banner.itemBottomPadding = -30
        banner.itemStyleType = .cornerRadius
        banner.isStartTimer = true
        banner.selectedIndicatorImage = UIImage(named: "daojiaojuxingActive")!
        banner.normalIndicatorImage = UIImage(named: "daojiaojuxingNormal")!
        return banner
    }()

    lazy var bannerView2 : BannerView = {
        let banner = BannerView(frame: CGRect(x: 0, y: 400, width: UIScreen.main.bounds.size.width, height: 200))
        banner.duration = 5
        banner.itemBottomPadding = -30
        banner.itemStyleType = .defult
        banner.isStartTimer = true
        banner.selectedIndicatorImage = UIImage(named: "daojiaojuxingActive")!
        banner.normalIndicatorImage = UIImage(named: "daojiaojuxingNormal")!
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(bannerView)
        
        bannerView.imgUrlArray = [
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1382355067,1010238231&fm=26&gp=0.jpg",
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2738231935,3414381386&fm=26&gp=0.jpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644069&di=5318396493e177aa06cd2916e6370120&imgtype=0&src=http%3A%2F%2Fpic.616pic.com%2Fbg_w1180%2F00%2F04%2F79%2FgEQ49qDeVC.jpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644067&di=97b94d61a437d71bbd71241a249e9176&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F04%2F45%2F14%2F8358552647aa253.jpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644512&di=72e46d200f9e5290810c3d6621c0e6de&imgtype=0&src=http%3A%2F%2Fimg.51miz.com%2FElement%2F00%2F95%2F35%2F46%2F3a123122_E953546_93ffb8ba.jpg%2521%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue%2Fformat%2Fjpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644512&di=60a7fb2b518b3fca0084606343270ba3&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F25%2F59%2F7859f9642da7240.jpg"
        ]
        
        view.addSubview(bannerView2)
       
        bannerView2.imgUrlArray = [
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1382355067,1010238231&fm=26&gp=0.jpg",
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2738231935,3414381386&fm=26&gp=0.jpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644069&di=5318396493e177aa06cd2916e6370120&imgtype=0&src=http%3A%2F%2Fpic.616pic.com%2Fbg_w1180%2F00%2F04%2F79%2FgEQ49qDeVC.jpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644067&di=97b94d61a437d71bbd71241a249e9176&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F04%2F45%2F14%2F8358552647aa253.jpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644512&di=72e46d200f9e5290810c3d6621c0e6de&imgtype=0&src=http%3A%2F%2Fimg.51miz.com%2FElement%2F00%2F95%2F35%2F46%2F3a123122_E953546_93ffb8ba.jpg%2521%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue%2Fformat%2Fjpg",
             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605677644512&di=60a7fb2b518b3fca0084606343270ba3&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F25%2F59%2F7859f9642da7240.jpg"
        ]
        
        
        
        
        
        
        
        
        
        /*let img = UIImageView(frame: CGRect(x: 40, y: 100, width: UIScreen.main.bounds.width - 80, height: 200))
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        //img.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605610992734&di=fb456de157a10ec7a698bb6fcf6a7205&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F61%2F98%2F01300000248068123885985729957.jpg"))
        let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605610992734&di=fb456de157a10ec7a698bb6fcf6a7205&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F61%2F98%2F01300000248068123885985729957.jpg")
        img.kf.indicatorType = .activity
        img.kf.setImage(with: url, placeholder: UIImage(named: "tupian"), options: [KingfisherOptionsInfoItem.cacheMemoryOnly]) { (a, b) in
            print("a==>\(a)")
            print("b==>\(b)")
        } completionHandler: { result in
            switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
        }*/

        
       
    }


}

