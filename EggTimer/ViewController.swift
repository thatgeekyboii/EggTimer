
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    //defining time
    let eggTimes=["Soft":300,"Medium":420,"Hard":720]
    
  var remTime=60
    
    let softEgg=5
    let medEgg=7
    let hardEgg=12
    
    var totalTime=0
    var secondsPassed=0
    
    var timer=Timer()  //timer
    var player: AVAudioPlayer!  //sound
    @IBAction func EggPressed(_ sender: UIButton) {
        
        //during the running of the timer
        timer.invalidate()
        let hardness=sender.currentTitle!
        totalTime=eggTimes[hardness]!
        
        progressBar.progress=0.0
        secondsPassed=0
        titleLabel.text=hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,selector:#selector(updateTimer),userInfo: nil, repeats: true)
        
       
            
        }
    @objc func updateTimer(){
        if secondsPassed<totalTime{
            
            secondsPassed+=1

            progressBar.progress=Float(secondsPassed)/Float(totalTime)
            print("\(remTime) seconds.")
        }
        else{
            timer.invalidate()
            titleLabel.text="Enjoy Your Eggs!"
            
            //timer funciton
            let url = Bundle.main.url(forResource: "0451",withExtension:"wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
       /*Logic using if else
        
        let hardness=sender.currentTitle
        
        if hardness=="Soft"{
            print(softEgg)
        }
        else if hardness=="Medium"{
            print(medEgg)
        }
        else {
            print(hardEgg)
        }
    }
    */
}
}
