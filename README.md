# SafeUserDefaults
A Better UserDefaults with storing policy: override, discard

```swift
// import module
import SafeModeUserDefault
```

## Example 1: Save item using SafeMode
```swift
// Save item if not exist
let storingResult =  UserDefaults.safe.setValue("123456", forKey: "selected_number", forceOverride: { 
  return false
})
// return StoringResult.success
```

## Example 2: Discard if there is an item exist

```swift
// Don't override if there is a value exist
let storingResult =  UserDefaults.safe.setValue("123456", forKey: "selected_number", forceOverride: { 
  return false
})
// return StoringResult.discarded
```

## Example 3: Force overide existing value

```swift
let role  = Role.admin

// Force override set to true due a condition
let storingResult = UserDefaults.safe.setValue("123456", forKey: "selected_number", forceOverride: { 
  return role == .admin 
})
// return StoringResult.overrided
```
