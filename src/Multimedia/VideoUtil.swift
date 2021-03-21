import Foundation
import AVKit
import AVFoundation

class VideoUtil {
 
  var player : AVPlayer?
  var playerViewController : AVPlayerViewController?
  
  func pause() {
    player?.pause()  
  }
  
  func stop() {
    player?.pause()  
  }
  
  func play() {
    player?.play()  
  }
  
  func playFile(_ file: String, view: UIView) {
    let path = Bundle.main.path(forResource: file, ofType: nil)
    
    if (path != nil) {
      let url = URL(fileURLWithPath: path)
      self.playUrl(url, view: view)
    }
    
  }
  
  func playURL(_ url: URL!, view: UIView) {
    if (self.player == nil) {
      self.player = AVPlayer(url: url)
      let playerLayer = AVPLayer(player: player)
      playerLayer.frame = view.bounds
      view.layer.addSublayer(playerLayer)
    }
  }
  
  func playFileFullScreen(_ file: String, viewController: UIViewController) {
    let path =  Bundle.main.path(forResource: file, ofType: nil)
    
    if (path != nil) {
      let url = URL(fileURLWithPath: path!)
      self.playUrlFullScreen(url, viewController: viewController)
    }
  }
  
  func playUrlFullScreen(_ url: URL!, viewController: UIViewController) {
    
    self.player = AVPlayer(url: url)
    self.playerViewController = AVPLayerViewController()
    
    self.playerViewController!.player = player
    viewController.present(self.playerViewController!, animated: true) {
      self.playerViewController!.player!.play()  
    }
    
    NotificationCenter.default.addObserver(self,
      selector: #selector(VideoUtil.videoEnd),
      name: NSNotification.Name(
        rawValue: ""AVPlayerItemDidPlayToEndTimeNotification"    
      ),
      object: nil
    )
  }
  
  @objc func videoEnd() {
    playerViewController?.dismiss(animated: true)  
  }
}
