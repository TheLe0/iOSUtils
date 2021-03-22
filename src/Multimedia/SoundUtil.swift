import Foundation
import AVFoundation

class SoundUtil : NSObject, AVAudioPlayerDelegate {
  
  var player: AVAudioPlayer?
  
  func playFile(_ file: String) {
    
    let path = Bundle.main.path(forResource: file, ofType: nil)
    
    if (path != nil) {
      let url = URL(fileURLWithPath: path!)
      self.playUrl(url)
    }
  }
  
  func playUrl(_ url: URL!) {
    
    if (player == nil) {
      
      do {
        self.player = try AVAudioPlayer(contentsOf: url)
      } catch let error as NSError {
          self.player = nil  
          return
      }
    }
    
    self.player!.delegate = self
    self.player!.play()
  }
  
  func pause() {
    if (self.player != nil) {
      self.player!.pause()  
    }
  }
  
  func stop() {
    if (self.player != nil) {
      self.player!.stop()
      self.player = nil
    }
  }
  
  func audioPlayerDidiFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    self.player = nil  
  }
}
