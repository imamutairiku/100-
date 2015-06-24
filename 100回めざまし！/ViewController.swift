//
//  ViewController.swift
//  UIKit008
//

import UIKit

class ViewController: UIViewController {
    
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
            myNotification.soundName = UILocalNotificationDefaultSoundName
            
            // Timezoneを設定する.
            myNotification.timeZone = NSTimeZone.defaultTimeZone()
            
            // 10秒後に設定する.
            myNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
            
            // Notificationを表示する.
            UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
     func changeDatePicker(sender: UIDatePicker) {
        let df = NSDateFormatter()
        df.dateFormat = "HH:mm:ss"
        var dateStr = df.stringFromDate(sender.date)
        println(dateStr)
    
    }


