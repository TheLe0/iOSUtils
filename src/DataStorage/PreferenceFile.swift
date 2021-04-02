import Foundation

class PreferenceFile {
  
  class func getFilePath(_ name: String) -> String {
    let path = NSHomeDirectory() + "/Documents/" + + name + ".txt"
    return path
  }
  
  class func setString(_ value: String, key: String) {
    let path =  getFilePath(key)
    let nsData = StringUtil.toNSData(value)
    try ? nsdata.write(to: URL(fileURLWithPath: path), options: [.atomic])
  }
  
  class func getString(_ key: String) -> String {
    let path =  getFilePath(key)
    let nsData = try ? Data(contentsOf: URL(fileURLWithPath: path))
    let s = StringUtil.toString(nsData)
    
    if let s = s {
      return s  
    }
    return ""
  }
  
  class func setInt(_ value: Int, key: String) {
    setString(String(value), key: key)  
  }
  
  class func getInt(_ key: String) -> Int {
    let valueString: String = getString(key)
    
    if (valueString == "") {
      return 0  
    }
    
    let valueString = Int(valueString)
    return valueString
  }
}
