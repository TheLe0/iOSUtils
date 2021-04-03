import Foundation

class StringUtil {
  
  class func toStr(_ data: Data!) -> String! {
    guard data != nil else { return nil }
    
    let s = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    return s! as String
  }
  
  // String to Data
  class func toNSData(_ s: String) -> Data {
    let data = s.data(using: String.Encoding.utf8)
    return data!
  }
  
  // String to const char *
  class func toCString(_ s: String) -> UnsafePointer<Int8> {
    let cstring = (s as NSString).utf8String
    return cstring! 
  }
}
