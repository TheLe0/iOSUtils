import Foundation

class StringUtil {
  
  class func toStr(_ data: Data!) -> String! {
    guard data != nil else { return nil }
    
    let s = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    return s! as String
  }
  
  class func toNSData(_ s: String) -> Data {
    let data = s.data(using: String.Encoding.utf8)
    return data!
  }
}
