//
//  UDManager.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 22.12.21.
//

import Foundation


struct UDManager {
    
    // MARK: - Keys
    private static let FIRSTLY_USER_OPEN_APP = "FIRSTLY_USER_OPEN_APP"
    private static let KEY_IS_USER_LOGGED_IN = "KEY_IS_USER_LOGGED_IN"
    private static let KEY_USER_CREDENTIAL_USERNAME = "KEY_USER_CREDENTIAL_USERNAME"
    private static let KEY_USER_CREDENTIAL_PASSWORD = "KEY_USER_CREDENTIAL_PASSWORD"
    private static let biometricAuthOn = "BIOMETRIC_AUTH_ON"
    
    private static var ud = UserDefaults.standard
    
    static func markUserAsLoggedIn() {
        ud.set(false, forKey: KEY_IS_USER_LOGGED_IN)
        ud.set("",forKey: KEY_USER_CREDENTIAL_USERNAME)
        ud.set("",forKey: KEY_USER_CREDENTIAL_PASSWORD)
    }
    
    static func isNotFirstInstall()-> Bool {
        //return true
        if  !ud.bool(forKey: FIRSTLY_USER_OPEN_APP){
            ud.set(true, forKey: FIRSTLY_USER_OPEN_APP)
            return true
        } else {
            return false
        }
    }
    
    static func markUserAsLoggedOut() {
        ud.set(false, forKey: KEY_IS_USER_LOGGED_IN)
        ud.set("",forKey: KEY_USER_CREDENTIAL_USERNAME)
        ud.set("",forKey: KEY_USER_CREDENTIAL_PASSWORD)
    }
    
    static func isUserLoggedIn() -> Bool {
        
        ud.bool(forKey: KEY_IS_USER_LOGGED_IN)
        //return false
    }
    
    static func saveUserAndMarkUserAsLoggedIn(user: User) {
        ud.set(true, forKey: KEY_IS_USER_LOGGED_IN)
        ud.set(user.username,forKey: KEY_USER_CREDENTIAL_USERNAME)
        ud.set(user.password,forKey: KEY_USER_CREDENTIAL_PASSWORD)
    }
    static func biometricAuthState() -> Bool {
        ud.bool(forKey: biometricAuthOn)
    }
    static func biometricAuthState(isOn: Bool ) {
        ud.set(isOn, forKey: biometricAuthOn )
    }
}
