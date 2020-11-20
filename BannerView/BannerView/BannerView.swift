//
//  BannerView.swift
//  BannerView
//
//  Created by kaiya on 2020/11/18.
//

import UIKit

class BannerView: UIView {
    
    var itemWidth : CGFloat?
    var itemHeight : CGFloat?
    
    var itemLeftPadding : CGFloat?
    var itemTopPadding : CGFloat?
    var itemRightPadding : CGFloat?
    var itemBottomPadding : CGFloat?
    
    var itemStyleType : ItemType?
    var duration : Double?
    var _isStartTimer : Bool?
    var isStartTimer : Bool{
        get{
            return _isStartTimer ?? true
        }
        set{
            _isStartTimer = newValue
            if isStartTimer {
                startTimer()
            }
        }
    }
    
    var _imgUrlArray:Array<String>?
    var imgUrlArray:Array<String>{
        get{
            return _imgUrlArray ?? []
        }
        set{
            _imgUrlArray = newValue
            bannerCollectionView.reloadData()
            pageControl.numberOfPages = imgUrlArray.count
            addPageButton(pageControl: pageControl)
        }
    }
    
    var _selectedIndicatorImage : UIImage?
    var selectedIndicatorImage : UIImage{
        set{
            _selectedIndicatorImage = newValue
            pageControl.setIndicatorImage(selectedIndicatorImage, forPage: 0)
        }
        
        get{
            return _selectedIndicatorImage ?? UIImage(named: "daojiaojuxingActive")!
        }
    }
    
    var _normalIndicatorImage : UIImage?
    var normalIndicatorImage : UIImage{
        set{
            _normalIndicatorImage = newValue
            pageControl.preferredIndicatorImage = normalIndicatorImage
        }
        
        get{
            return _normalIndicatorImage ?? UIImage(named: "daojiaojuxingNormal")!
        }
    }
    
    func addPageButton(pageControl : UIPageControl){
        var tagIndex = 0
        for indicatorView in pageControl.subviews[0].subviews[0].subviews {
            print("indicatorView==>\(indicatorView)")
            indicatorView.isUserInteractionEnabled = true
            let but = UIButton(frame: indicatorView.bounds)
            but.tag = tagIndex
            but.backgroundColor = UIColor.clear
            but.addTarget(self, action: #selector(clickIndicatorView(sender:)), for: UIControl.Event.touchUpInside)
            indicatorView.addSubview(but)
            tagIndex += 1
        }
    }

    @objc  func clickIndicatorView(sender : UIButton){
        if isStartTimer {
            stopTimer()
        }
        
        pageControl.currentPage = sender.tag
        bannerCollectionView.scrollToItem(at: IndexPath(row: pageControl.currentPage, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        newPage = pageControl.currentPage
        
        if isStartTimer {
            startTimer()
        }
    }
    

    lazy var bannerCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth ?? (UIScreen.main.bounds.size.width), height: itemHeight ?? self.bounds.size.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "banner")
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.layer.zPosition = 999
        return collectionView
    }()
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    
    lazy var pageControl : UIPageControl = {
        let pageContr = UIPageControl(frame: CGRect(x: 0, y: self.frame.size.height - 30, width: screenWidth, height: 30))
        pageContr.layer.zPosition = 1000
        pageContr.currentPage = 0
        pageContr.backgroundStyle = .minimal
        pageContr.currentPageIndicatorTintColor = UIColor(red: 10/255, green: 142/255, blue: 160/255, alpha: 1)
        pageContr.pageIndicatorTintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        pageContr.addTarget(self, action: #selector(clickPageControl(pageControl:)), for: UIControl.Event.valueChanged)
        pageContr.numberOfPages = 1
        
        
        return pageContr
    }()
    
    
    
    @objc func clickPageControl(pageControl:UIPageControl){
        if isStartTimer {
            stopTimer()
        }
        bannerCollectionView.scrollToItem(at: IndexPath(row: pageControl.currentPage, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        newPage = pageControl.currentPage
        if isStartTimer {
            startTimer()
        }
    }
    
    var bannerTimer : Timer?
    var newPage = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bannerCollectionView)
        self.addSubview(pageControl)
        
        
        
        
        
    }
    
    func startTimer(){
        bannerTimer = Timer.scheduledTimer(timeInterval: duration ?? 3, target: self, selector: #selector(bannerScroll), userInfo: nil, repeats: true)
        //bannerTimer?.fire()
        RunLoop.current.add(bannerTimer!, forMode: RunLoop.Mode.common)
    }
    
    func stopTimer(){
        bannerTimer?.invalidate()
        if bannerTimer != nil {
            bannerTimer = nil
        }
    }
    
    
    @objc func bannerScroll(){
        
        newPage = newPage + 1
        if newPage > (imgUrlArray.count - 1){
            newPage = 0
        }
        
        pageControl.currentPage = newPage
        bannerCollectionView.scrollToItem(at: IndexPath(row: newPage, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK:--UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension BannerView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgUrlArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imgUrlString = imgUrlArray[indexPath.row]
        let item : BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as! BannerCollectionViewCell
        
        item.imgView.kf.indicatorType = .activity
        item.imgView.kf.setImage(with: URL(string: imgUrlString))
        item.bottomPadding = itemBottomPadding
        item.itemType = itemStyleType ?? .defult
        return item
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: itemWidth ?? (UIScreen.main.bounds.size.width), height: itemHeight ?? self.bounds.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index  = scrollView.contentOffset.x / screenWidth
        pageControl.currentPage = Int(ceil(index))
        newPage = Int(ceil(index))
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if isStartTimer {
            stopTimer()
        }
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if isStartTimer {
            startTimer()
        }
        
    }
    
}
//MARK:--ItemType
enum ItemType {
    case cornerRadius
    case defult
}
//MARK:--BannerCollectionViewCell
class BannerCollectionViewCell : UICollectionViewCell {
    
    var _itemType : ItemType?
    var itemType : ItemType{
        get{
            return _itemType ?? .cornerRadius
        }
        set{
            _itemType = newValue
            
            switch _itemType {
            case .cornerRadius:
                imgView.layer.cornerRadius = 5
                imgView.snp.remakeConstraints { (make) in
                }
                imgView.snp.updateConstraints { (make) in
                    make.left.equalToSuperview().offset(leftPadding ?? 15)
                    make.top.equalToSuperview().offset(topPadding ?? 15)
                    make.right.equalToSuperview().offset(rightPadding ?? -15)
                    make.bottom.equalToSuperview().offset(bottomPadding ?? -15)
                }
                
                
                break
            default:
                
                break
            }
            
        }
    }
    var leftPadding : CGFloat?
    var topPadding : CGFloat?
    var rightPadding : CGFloat?
    var bottomPadding : CGFloat?
    
    lazy var imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        return imgView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        
        imgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


