//
//  UserDefaults+Illithid.swift
//  Illithid
//
//  Created by José González Gómez on 17/08/2017.
//  Copyright © 2019 OPEN input. Distributed under the MIT license.
//

import Foundation


extension UserDefaults {
    /**
     Provides a wrapper around code to be tested using `UserDefaults`. The
     code included in the `testBlock` parameter works in a clean environment
     and makes no changes to previously stored values.

     - parameter testBlock: Block of code to be executed in a clean `UserDefaults`
                            environment
     */
    public func blankDefaultsWhile(testBlock: (UserDefaults) -> Void) {
        let originalValues = self.dictionaryRepresentation()
        defer {
            originalValues.forEach { self.set($0.value, forKey: $0.key) }
        }

        originalValues.keys.forEach {
            self.removeObject(forKey: $0)
        }

        testBlock(self)
        self.dictionaryRepresentation().keys.forEach {
            self.removeObject(forKey: $0)
        }
    }
}
