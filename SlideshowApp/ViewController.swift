//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 近藤知加 on 2019/12/09.
//  Copyright © 2019 chika.kondou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!

    @IBOutlet weak var imageview: UIImageView!

    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    @IBAction func go(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
           displayImageNo = 0
            displayImage()
        }
       
    }
    @IBAction func remove(_ sender: Any) {if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
        // 表示している画像の番号を1減らす
        displayImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }  else {
        displayImageNo = imageNameArray.count - 1
        displayImage()
        }
    }
    @IBAction func ontimer(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false

            // ボタンの名前を停止とする
            switchButton.setTitle("停止", for: .normal)
          
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンの名前を再生とする
            switchButton.setTitle("再生", for: .normal)
           
        }
        }
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
            
          
        }
    }
    
    
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "unwind", sender: nil)
    }
    // 遷移元から遷移先にデータ(画像)を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerのインスタンスを取得する
        let zoomInViewController:ZoomInViewController = segue.destination as! ZoomInViewController
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        
        zoomInViewController.selectedImg = image
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "orange.jpeg")
        imageview.image = image
        
        
        
        }
    
   
    // 表示している画像の番号
    var displayImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = ["orange.jpeg", "pink.jpeg", "haibisukasu.jpg", ]
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageview.image = image
    }
   
    @IBAction func tapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "tapAction", sender: nil)
    }
   
}



