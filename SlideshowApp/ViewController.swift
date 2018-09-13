//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐藤健一朗 on 2018/09/09.
//  Copyright © 2018年 kenichiro.sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func onTapImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        if self.timer != nil {
            //タイマーを破棄
            self.timer?.invalidate()
            self.timer = nil
            button.setTitle("再生", for: .normal) // ボタンのタイトル
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let viewController: ZoomViewController = segue.destination as! ZoomViewController
        viewController.image1 = imageView.image
    }
    
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil{
            // タイマーを設定
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            button.setTitle("停止", for: .normal) // ボタンのタイトル
           
        }else{
            //タイマーを破棄
            self.timer?.invalidate()
            self.timer = nil
            button.setTitle("再生", for: .normal) // ボタンのタイトル
        }
    }
    
    /// Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer (_ timer: Timer) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    //一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // imageViewの作成
        button.setTitle("再生", for: .normal) // ボタンのタイトル
        let image = UIImage(named: "")
        imageView.image = image
        
        
    }
    
   
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "IMG_1525.jpg",
            "IMG_1521.jpg",
            "IMG_1531.jpg"
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image

    }
    
    @IBAction func onPrev(_ sender: Any) {
       //再生ボタンが押されているかの判別
        if self.timer == nil{
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
            displayImage()
            
        }
    }
    
    @IBAction func onNext(_ sender: Any) {
       //再生ボタンが押されているかの判別
        if self.timer == nil{
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
}

