
    
    import UIKit
    import AVFoundation
    
    class _00_ViewController: UIViewController,AVAudioPlayerDelegate {
        var audioPlayer : AVAudioPlayer!
        var myButton :UIButton!
        var currentTime :String!
        var alarmTime :String!
        var number:Int = 0
        @IBOutlet var label:UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // アラート表示の許可をもらう.
            UIApplication.sharedApplication().registerUserNotificationSettings(
                UIUserNotificationSettings(
                    forTypes:UIUserNotificationType.Sound | UIUserNotificationType.Alert,
                    categories: nil)
            )
            
            
            //アラーム開始ボタン
            
            
            //再生する音源のURLを生成.!
            let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
            let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
            
            //AVAudioPlayerのインスタンス化!
            audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
            
            //AVAudioPlayerのデリゲートをセット.
            audioPlayer.delegate = self
            
            
            
            //現在時刻
            //let now = NSDate()
            
            //let formatter = NSDateFormatter()
            //formatter.dateFormat = "HH:mm"
            
            //let string = formatter.stringFromDate(now)
            
            //println(string)
            
        }
        
        //カウント機能
        @IBAction func plus(){
            number = number + 1
            label.text = String(number)
        }
        
        //カウントを０に戻す
        @IBAction func clear(){
            number = 0
        }
        
        
        override func viewWillAppear(animated: Bool) {
            //現在の時刻を取得する
            var now = NSDate()
            //時分秒のフォーマッターを作る
            var df = NSDateFormatter()
            //時刻をフォーマッターの書式で文字に変換
            df.dateFormat = "HH:mm"
            var datestr = df.stringFromDate(now)
            
            //出力する
            println(datestr)
            
            currentTime = datestr
        }
        
        //アラーム時間の設定
        func changeDatePicker(sender: UIDatePicker) {
            let df = NSDateFormatter()
            df.dateFormat = "HH:mm"
            var dateStr = df.stringFromDate(sender.date)
            
            
            alarmTime = dateStr
            
            println(dateStr)
            
            //アラーム開始ボタン押すと下記機能 &
            
            
            //現在時刻とアラーム時間が一致したときにClap音鳴る
            if currentTime == alarmTime {
                audioPlayer.play()
                audioPlayer.numberOfLoops = 5
                
            }
            
            //label数が100になるとClap音止まる
            if label.text == String(2){
                audioPlayer.stop()
            }
        }
        
        //アラーム停止ボタン
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
}

