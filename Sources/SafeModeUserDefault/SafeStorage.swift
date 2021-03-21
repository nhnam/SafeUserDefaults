import Foundation

/**
 User enum because I want to implement this mechanism for keychain and another kind of storage, too :)
 */

enum SafeStorage {
  case userDefault
  
  @discardableResult
  public static func save(item: Any?, key: String, forceOverride: Bool) -> StoringResult {
    if let _ = value(key: key) {
      if forceOverride {
        set(item: item, key: key)
        return .overrided
      } else {
        return .discarded
      }
    } else {
      set(item: item, key: key)
      return .success
    }
  }
  
  static func set(item: Any?, key: String) {
    UserDefaults.standard.set(item, forKey: key)
  }
  
  static func value(key: String) -> Any? {
    return UserDefaults.standard.value(forKey: key)
  }
}
