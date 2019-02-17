//
//  DisplayString.swift
//  Contact
//
//  Created by Kuliza-148 on 17/02/19.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation

struct DisplayString {
    
    struct Contact {
        static let edit = NSLocalizedString("edit", comment: "edit button text in contact details screen.")
        static let done = NSLocalizedString("done", comment: "done button text in edit contact screen.")
        static let cancel = NSLocalizedString("cancel", comment: "cancel button text in edit contact screen.")
        static let add = NSLocalizedString("add", comment: "add plus icon in home screen.")
        static let message = NSLocalizedString("message", comment: "message text in contact details screen.")
        static let call = NSLocalizedString("call", comment: "call text in contact details screen.")
        static let email = NSLocalizedString("email", comment: "email text in contact details screen.")
        static let favourite = NSLocalizedString("favourite", comment: "favourite text in contact details screen.")
        static let mobile = NSLocalizedString("mobile", comment: "mobile text in contact details screen.")
    }
    
    struct General {
        static let ok = NSLocalizedString("ok", comment: "")
    }
    
    struct Title {
        static let contact = NSLocalizedString("contact", comment: "home screen title.")
    }
}
