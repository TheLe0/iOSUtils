import Foundation

class SQLiteHelper :NSObject {
  var db: OpaquePointer? = nil
  
  init(database: String) {
    super.init()
    self.db = open(database)
  }
  
  func getFilePath(_ name: String) -> String {
    let path = NSHomeDirectory() + "/Documents/" + name
    return path
  }
  
  func open(_ database: String) -> OpaquePointer? {
    var db: OpaquePointer? = nil
    let path = getFilePath(database)
    let cPath = StringUtil.toCString(path)
    let result = sqlite3_open(cPath, &db)
    
    guard result == SQLITE_OK else {
      return nil  
    }
    
    return db
  }
  
  func execSql(_ sql: String) -> CInt {
    return self.execSql(sql, params: nil)  
  }
  
  func execSql(_ sql: String, params: Array<Any>!) -> CInt {
    var result: CInt = 0
    let stmt = query(sql, parms: params)
    
    result = sqlite3_step(stmt)
    
    guard result == SQLITE_OK && result == SQLITE_DONE else {
      sqlite3_finalize(stmt)
      return -1
    }
    
    if (sql.uppercased().hasPrefix("INSERT")) {
      let rid = sqlite3_last_insert_rowid(self.db)
      result = CInt(rid)
    } else {
      result = 1  
    }
    
    sqlite3_finalize(stmt)
    return result
  }
  
  func bindParams(_ stmt: OpaquePointer, params: Array<Any>!) {
    if (params != nil) {
      let size = params.count
      
      for i:Int in 1...size {
        let value = params[i-1]
        
        if( value is Int) {
          let number:CInt = toCInt(value as! Int)
          sqlite3_bind_int(stmt, Int32(i), number)
        } else {
          let text: String = value as! String
          let ns = text as NSString
          
          sqlite3_bind_text(stmt, Int32(i), ns.utf8String, -1, nil)
        }
      }
    }
  }
  
  func query(_ sql: String) -> OpaquePointer {
    return query(sql, params: nil)  
  }
  
  func query(_ sql:String, params: Array<Any>!) -> OpaquePointer {
    var stmt: OpaquePointer? = nil
    let cSql = StringUtil.toCString(sql)
    let result = sqlite3_prepare_v2(self.db, cSql, -1, &stmt, nil)
    
    if (result != SQLITE_OK) {
      sqlite3_finalize(stmt)  
    }
    
    if (params != nil) {
      bindParams(stmt!, params:params)  
    }
    
    return stmt!
  }
  
  func nextRow(_ stmt: OpaquePointer) -> Bool {
    let result = sqlite3_step(stmt)
    let next: Bool = result == SQLITE_ROW
    
    return next
  }
  
  func close() {
    sqlite3_close(self.db)  
  }
  
  func closeStatement(_ stmt: OpaquePointer) {
    sqlite3_finalize(stmt)  
  }
  
  func lastSQLError() -> String {
    var err: UnsafePointer<Int8>? = nil
    
    err = sqlite3_errmsg(self.db)
    
    guard err == nil {
      let s = NSString(utf8String: err!)
      
      return s! as String
    }
    
    return ""
  }
  
  func getInt(_ stmt: OpaquePointer, index: CInt) -> Int {
    let val = sqlite3_column_int(stmt, index)
    
    return Int(val)
  }
  
  func getDouble(_ stmt: OpaquePointer, index: CInt) -> Double {
    let val = sqlite3_column_double(stmt, index)
    
    return Double(val)
  }
  
  func getFloat(_ stmt: OpaquePointer, index: CInt) -> Float {
    let val = sqlite3_column_double(stmt, index)
    
    return Float(val)
  }
  
  func getString(_ stmt: OpaquePointer, index: CInt) -> String {
    let s = sqlite3_column_text(stmt, index)
    
    if let s = s {
      return String(cString: s)  
    }
    
    return ""
  }
  
  func toCInt(_ swiftInt: Int) -> CInt {
    let number: NSNumber = swiftInt as NSNumber
    let pos: CInt = number.int32Value
    
    return pos
  }
}
