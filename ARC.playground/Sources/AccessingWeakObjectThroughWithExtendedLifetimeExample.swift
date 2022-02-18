import Foundation

public struct AccessingWeakObjectThroughWithExtendedLifetimeExample {
    
    class Pilot {
        var name: String
        init(name: String) {
            self.name = name
        }
        deinit {
            print()
        }
    }
    
    class F1Car {}
    
    public static func run() {}
}
