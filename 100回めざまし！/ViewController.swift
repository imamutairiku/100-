//
//  ViewController.swift
//  UIKit008
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!
    var myButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アラート表示の許可をもらう.
        UIApplication.sharedApplication().registerUserNotificationSettings(
            UIUserNotificationSettings(
                forTypes:UIUserNotificationType.Sound | UIUserNotificationType.Alert,
                categories: nil)
        )
    
        
        // 時間をおいてNotificationを発火するボタンを作成する.
        let myNotificationFireButton: UIButton = UIButton(frame: CGRectMake(0,0,200,80))
        myNotificationFireButton.backgroundColor = UIColor.blueColor()
        myNotificationFireButton.layer.masksToBounds = true
        myNotificationFireButton.setTitle("Notification(Fire)", forState: .Normal)
        myNotificationFireButton.layer.cornerRadius = 20.0
        myNotificationFireButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:400)
        myNotificationFireButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myNotificationFireButton.tag = 2
        
        // ViewにButtonを追加する.
        view.addSubview(myNotificationFireButton)
    }
        /*
        ボタンイベント
        */
        internal func onClickMyButton(sender: UIButton){
            println("onClickMyButton")
            if sender.tag == 2 {
            showNotificationFire()
        }
    }
    
        /*
        Show Notification(10 sec後に発火)
        */
        private func showNotificationFire(){
             println("showNotificationFire")
            
            // Notificationの生成する.
            let myNotification: UILocalNotification = UILocalNotification()
            
            // メッセージを代入する.
            myNotification.alertBody = "TEST(Fire)"
            
            // 再生サウンドを設定する.
            myNotification.soundName
            = UILocalNotificationDefaultSoundName
            
            // Timezoneを設定する.
            myNotification.timeZone = NSTimeZone.defaultTimeZone()
            
            // 10秒後に設定する.
            myNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
            
            // Notificationを表示する.
            UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
        }
    

        //再生する音源のURLを生成.!
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
    
        //AVAudioPlayerのインスタンス化!
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    
        //AVAudioPlayerのデリゲートをセット.
        myAudioPlayer.delegate = self
    
    //ボタンの生成.
    myButton = UIButton()
    myButton.frame.size = CGSizeMake(100, 100)
    myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
    myButton.setTitle("▶︎", forState: UIControlState.Normal)
    myButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    myButton.backgroundColor = UIColor.cyanColor()
    myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: UIControlEvents.TouchUpInside)
    myButton.layer.masksToBounds = true
    myButton.layer.cornerRadius = 50.0
    self.view.addSubview(myButton)
}

    let now = NSDate() // 現在日時の取得
    let dateFormatter = NSDateFormatter()
    dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
    
    dateFormatter.timeStyle = .MediumStyle
    dateFormatter.dateStyle = .MediumStyle
    println(dateFormatter.stringFromDate(now))
    // -> "2014/11/02 10:32:22"
    
    
    override
    func viewWillAppear(animated: Bool) {
        //現在の時刻を取得する
        var now = NSDate()
        //時分秒のフォーマッターを作る
        var df = NSDateFormatter()
        //時刻をフォーマッターの書式で文字に変換
        df.dateFormat = "HH:MM:SS"
        var datestr = df.stringFromDate(now)
        //出力する
        println(datestr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
     func changeDatePicker(sender: UIDatePicker) {
        let df = NSDateFormatter()
        df.dateFormat = "hh:mm:ss"
        var dateStr = df.stringFromDate(sender.date)
        println(dateStr)
    
    }

      if dateFormat.isTheSame == true {
          audioPlayer.play()
}

