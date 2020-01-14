//
//  UserDefaults+IllithidSpec.swift
//  Illithid
//
//  Created by José González Gómez on 17/08/2017.
//  Copyright © 2019 OPEN input. Distributed under the MIT license.
//

import Foundation
import Quick
import Nimble
import Illithid


class UserDefaultsTestingSpec: QuickSpec {
    override func spec() {
        describe("UserDefaults+Illithid") {
            let key = "tv.rakuten.neuralyzer.tests.flag"
            let value = "really, a flag -> 🚩"

            var userDefaults: UserDefaults!

            beforeEach {
                userDefaults = UserDefaults()
                userDefaults.set(value, forKey: key)
            }

            it("should provide a clean environment for testing") {
                expect(userDefaults.object(forKey: key)).toNot(beNil())
                userDefaults.blankDefaultsWhile { userDefaults in
                    expect(userDefaults.object(forKey: key)).to(beNil())
                }
            }

            it("should restore previous values") {
                userDefaults.blankDefaultsWhile { userDefaults in
                    let modifiedValue = "modified \(value)"
                    userDefaults.set(modifiedValue, forKey: key)
                    expect(userDefaults.object(forKey: key) as? String) == modifiedValue
                }
                expect(userDefaults.object(forKey: key) as? String) == value
            }

            it("should forget values set while testing") {
                let unwantedKey = "tv.rakuten.neuralyzer.tests.unwanted"
                userDefaults.removeObject(forKey: unwantedKey) // Make sure we don't have it from previous executions
                expect(userDefaults.object(forKey: unwantedKey)).to(beNil())

                userDefaults.blankDefaultsWhile { userDefaults in
                    userDefaults.set("unwanted", forKey: unwantedKey)
                    expect(userDefaults.object(forKey: unwantedKey)).toNot(beNil())
                }

                expect(userDefaults.object(forKey: unwantedKey)).to(beNil())
            }
        }
    }
}
