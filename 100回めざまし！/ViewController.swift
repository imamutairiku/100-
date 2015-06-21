//
//  ViewController.swift
//  Utillity001
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //時間計測用の変数.
    var cnt : Float = 0
    
    //時間表示用のラベル.
    var myLabel : UILabel!
    
    //タイマー.
    var timer : NSTimer!
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        
        //再生する音源のURLを生成
        let soundFilePath : NSString =
        NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
        
        //AVAudioPlayerのインスタント化
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        

        //Timerが◯分になると音が鳴る
        timer = 0:00:30 (){
        audioPlayer.play()
        }
        

        
        //ラベルを作る.
        myLabel = UILabel(frame: CGRectMake(0,0,200,50))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Time:\(cnt)"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        self.view.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(myLabel)
        
        //タイマー停止ボタンを作る.
        let myButton = UIButton(frame: CGRectMake(0, 0, 200, 50))
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.backgroundColor = UIColor.blueColor()
        myButton.setTitle("Stop Timer", forState: UIControlState.Normal)
        myButton.layer.position = CGPointMake(self.view.center.x, self.view.center.y + 100)
        myButton.addTarget(self, action: "onMyButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)

        //タイマーを作る.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
    }
    
    //ボタンが押された時に呼ばれるメソッド.
    func onMyButtonClick(sender : UIButton){
        //timerが動いてるなら.
        if timer.valid == true {
        
        //timerを破棄する.
            timer.invalidate()
            
        //ボタンのタイトル変更.
            sender.setTitle("Start Timer", forState: UIControlState.Normal)
        }
            
        else{
            
            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
            sender.setTitle("Stop Timer", forState: UIControlState.Normal)
        }

    }
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        cnt += 0.1
        
        //桁数を指定して文字列を作る.
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        
        myLabel.text = str
        
    }
    
}
