//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 佐藤健一朗 on 2018/09/13.
//  Copyright © 2018年 kenichiro.sato. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    //画像保存用
    @IBOutlet weak var image: UIImageView!
    var image1:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view.
        image.image = image1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   
}
