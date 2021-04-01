import Foundation

class Preference {
  
  class func setString(_ value: String, key: String) {
    let preference = UserDefaults.standard
    preference.set(value, forKey: key)
    preference.synchronize()
  }
  
  class func getString(_ key: String) -> String {
    let preference = UserDefaults.standard
    let s = preference.string(forKey: key)
    if let s = s {
      return s  
    }
    return ""
  }
  
  class func setInt(_ value: Int, key: String) {
    let preference = UserDefaults.standard
    preference.set(value, forKey: key)
    preference.synchronize()
  }
  
  class func getInt(_ key: String) -> Int {
    let preference = UserDefaults.standard
    let s = preference.integer(forKey: key)
    return s 
  }
}
