//
//  File.swift
//  
//
//  Created by ナム Nam Nguyen on 21/3/21.
//

import Foundation

public typealias SavePolicy = () -> Bool

open class SafeUserDefaults: UserDefaults {
  struct Static {
    static let instance = SafeUserDefaults()
  }
  
  @discardableResult
  open func setValue(_ value: Any?, forKey key: String, forceOverride: @autoclosure () -> (SavePolicy) ) -> StoringResult {
    return SafeStorage.save(item: value, key: key, forceOverride: forceOverride()())
  }
}

extension UserDefaults {
  open class var safe: SafeUserDefaults {
    return SafeUserDefaults.Static.instance
  }
}
