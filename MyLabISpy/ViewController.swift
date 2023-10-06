//
//  ViewController.swift
//  MyLabISpy
//
//  Created by 曹家瑋 on 2023/10/6.
//

/*
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myScrollView.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateZoomFor(size: view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImageView
    }
    
    
    func updateZoomFor(size:CGSize) {
        let widthScale = size.width / myImageView.bounds.width
        let heightScale = size.height / myImageView.bounds.height
        let scale = min(widthScale, heightScale)
        myScrollView.minimumZoomScale = scale
        myScrollView.zoomScale = scale
        
        print("Updating zoom for size: \(size), calculated scale: \(scale)")

    }

}
*/



/*
 在updateZoomFor(size:)方法內部，使用imageView和size參數計算縮放。然後設置滾動視圖的minimumZoomScale屬性為該縮放比例，如下：

 上述代碼首先計算顯示圖片的整個寬度和高度所需的縮放。接著它設置最小縮放為兩者之間較小的一個（寬度或高度），這樣你就不會能夠超出該範圍縮小。
 最後，它設置初始縮放比例，使圖像適應屏幕。
 
 let widthScale = size.width / imageView.bounds.width
 let heightScale = size.height / imageView.bounds.height
 let scale = min(widthScale, heightScale)
 scrollView.minimumZoomScale = scale
 scrollView.zoomScale = scale

 */



// MARK: - extension 練習

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myImageView: UIImageView!
    
    // viewDidLoad會在視圖控制器的視圖被加載後調用
    override func viewDidLoad() {
        super.viewDidLoad()
        // 將 UIScrollView 的 delegate 設置為當前視圖控制器，響應UIScrollViewDelegate的方法
        myScrollView.delegate = self
    }

}

// 宣告一個遵從UIScrollViewDelegate協議的ViewController類別
extension ViewController: UIScrollViewDelegate {
    
    // viewDidAppear(_:)在視圖完全加載後調用
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 調用自訂方法updateZoomFor(size:)以設置UIScrollView的縮放比例
        updateZoomFor(size: view.bounds.size)
    }
    
    // UIScrollViewDelegate的方法，返回需要縮放的視圖元件，這裡是UIImageView
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImageView
    }
    
    /// 用於設置Scroll View的最小縮放比例，讓圖片在首次顯示時完全適應螢幕
    func updateZoomFor(size: CGSize) {
        // 計算寬度和高度上的縮放比例
        let widthScale = size.width / myImageView.bounds.width
        let heightScale = size.height / myImageView.bounds.height
        
        // 選擇widthScale和heightScale中較小的值作為縮放比例，確保圖片可以完全顯示在UIScrollView中
        let scale = min(widthScale, heightScale)
        
        // 設置UIScrollView的minimumZoomScale為剛才計算的scale，確保用戶不可以縮小圖片至於無法完全顯示在視圖中
        myScrollView.minimumZoomScale = scale
        
        // 將目前的縮放比例也設定為scale，確保圖片在視圖首次加載時就是按照我們計算的比例顯示
        myScrollView.zoomScale = scale
    }
    
}
