//
//  Document.swift
//  docmentBrowser
//
//  Created by taojiachun on 06/05/2018.
//  Copyright © 2018 jiachun tao. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

