//
//  ViewController.swift
//  UIKit008
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UIPickerView.
    private var myUIPicker: UIPickerView!
    
    // 表示する値の配列.
    private let myValues: NSArray = ["１時間","２時間","３時間","４時間", "５時間", "６時間", "７時間", "８時間", "９時間", "１０時間", "１１時間", "１２時間"]
    
    var audioPlayer : AVAudioPlayer!
    var myButton :UIButton!
    //var currentTime :String!
    var number:Int = 0
    @IBOutlet var label:UILabel!
    //var now2 :NSDate!
    //var alarmTime :NSDate!
    
    //var alarmCount: Int = 0
    var alarmCount: NSTimeInterval!
    
    var rowValue:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アラート表示の許可をもらう.
        UIApplication.sharedApplication().registerUserNotificationSettings(
            UIUserNotificationSettings(
                forTypes:UIUserNotificationType.Sound | UIUserNotificationType.Alert,
                categories: nil)
        )
        
        //アラームの開始ボタン
        
        //再生する音源のURLを生成.!
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        
        //AVAudioPlayerのインスタンス化!
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
        //AVAudioPlayerのデリゲートをセット.
        audioPlayer.delegate = self
        
        
        myUIPicker = UIPickerView()
        
        // サイズを指定する.
        myUIPicker.frame = CGRectMake(0,165,self.view.bounds.width, 200.0)
        
        // Delegateを設定する.
        myUIPicker.delegate = self
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        
        //Notification ボタン
        let myNotificationFireButton: UIButton = UIButton(frame: CGRectMake(0, 0,100, 60))
        myNotificationFireButton.backgroundColor = UIColor.orangeColor()
        myNotificationFireButton.layer.masksToBounds = true
        myNotificationFireButton.setTitle("おはよう", forState: .Normal)
        myNotificationFireButton.layer.cornerRadius = 20.0
        myNotificationFireButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:370)
        myNotificationFireButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myNotificationFireButton.tag = 2
        
        // ViewにButtonを追加する.
        view.addSubview(myNotificationFireButton)
        
    }
    
    //カウント機能
    @IBAction func plus(){
        number = number + 1
        label.text = String(number)
    }
    
    //カウントを０に戻す
    @IBAction func clear(){
        number = 0
        label.text = String(number)
    }
    
    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    /*
    pickerに表示する値を返すデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return myValues[row] as! String
    }
    
    /*
    pickerが選択された際に呼ばれるデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println("row: \(row)")
        println("value: \(myValues[row])")
        
        var rowValue = row + 1
        
    }
    
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton){
        println("設定OK!")
        if sender.tag == 2 {
            showNotificationFire()
        }
    }
    
    /*
    Show Notification (alarmCount sec後に発火)
    */
    private func showNotificationFire(){
        
        // Notificationの生成する.
        let myNotification: UILocalNotification = UILocalNotification()
        
        // メッセージを代入する.
        myNotification.alertBody = "おはよう！"
        
        // 再生サウンドを設定する.
        myNotification.soundName = UILocalNotificationDefaultSoundName
        
        // Timezoneを設定する.
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        // alarmCount 秒後に設定する.
        alarmCount = NSTimeInterval(rowValue*10)
        myNotification.fireDate = NSDate(timeIntervalSinceNow: alarmCount)
        
        // Notificationを表示する.
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
        
        //Notification通知来た時に、Clap鳴る
        if (myNotification.alertAction != nil){
        audioPlayer.play()
        audioPlayer.numberOfLoops = 4
        
        //label数が100になるとClap音止まる(アラーム停止）
        if label.text == String(3){
            
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

}


