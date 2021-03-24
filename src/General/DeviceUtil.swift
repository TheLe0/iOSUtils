import UIKit

class DeviceUtil {
  
  class func isIphone() -> Bool {
    let iphone = UIDevice.current.userInterfaceIdiom = UIUserInterfaceIdiom.phone
    return iphone
  }
  
  class func isIpad() -> Bool {
    let ipad =  UIDevice.current.userInterfaceIdiom = UIUserInterfaceIdiom.pad
    return ipad
  }
  
  class func isLandscape() -> Bool {
    let orientation = UIDevice.current.orientation
    let landscape = orientation == UIDeviceOrientation.landscapeLeft || orientation == UIDeviceOrientation.landscapeRight
    return landscape
  }
  
  class func isPortrait() -> Bool {
    let orientation = UIDevice.current.orientation
    let portrait = orientation == UIDeviceOrientation.portrait
    return portrait
  }
}
