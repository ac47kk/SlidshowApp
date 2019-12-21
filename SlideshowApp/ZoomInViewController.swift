//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by 近藤知加 on 2019/12/17.
//  Copyright © 2019 chika.kondou. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Image Viewに画像を設定
        imageview.image = selectedImg
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
