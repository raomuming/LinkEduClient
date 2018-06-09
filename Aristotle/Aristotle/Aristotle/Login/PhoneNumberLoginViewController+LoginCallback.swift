//
//  PhoneNumberLoginViewController+LoginCallback.swift
//  Aristotle
//
//  Created by Eric Rao on 10/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

class LoginCallbackImpl : AriILoginCallback {
    weak var delegate: AriILoginCallback?
    
    init(delegate: AriILoginCallback) {
        self.delegate = delegate
    }
    
    func onLogin(_ success: Bool) {
        delegate?.onLogin(success)
    }
}

extension PhoneNumberLoginViewController : AriILoginCallback {
    func onLogin(_ success: Bool) {
        
    }
}
