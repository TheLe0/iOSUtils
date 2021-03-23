import Foundation
import AVFoundation

class SoundRecordUtil : NSObject, AVAudioRecorderDelegate {

  var soundRecorder :AVAudioSession.sharedInstance()
  
  func start(_ file: String) -> URL! {
    do {
      try   audioSession.setActive(true)
    } catch let error as NSError {
      return nil  
    }
    
    do {
      try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)  
    } catch let error as NSError {
      return nil  
    }
    
    let path = NSTemporaryDirectory() + "/" + file
    let url = URL(string: path)!
    let settings = [
      AVFormatIDKey: Int(KAudioQuality.high.rawValue)  
    ] as [String :Any]
    
    do {
      self.soundRecorder = try AVAudioRecorder(url: url, settings: settings)
    } catch let error as NSError {
      return nil  
    }
    
    self.soundRecorder!.delegate = self
    self.soundRecorder!.prepareRecord()
    return url
  }
  
  func stop() {
    self.soundRecorder!.stop()
    let audioSession = AVAudioSession.sharedInstance()
    
    do {
      try audioSession.setActive(false)
    } catch let error as NSError {
      print("Error \(error)")  
    }
  }
}
