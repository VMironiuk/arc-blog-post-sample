import Foundation

/// An example in which both properties should always have a value, and neither property should ever be nil once initialization is complete

public struct RetainCycleBetweenAliveObjectsExample {
    
    class Pilot {
        let name: String
        var f1Car: F1Car!
        init(name: String, f1CarModel: String) {
            self.name = name
            self.f1Car = F1Car(model: f1CarModel, pilot: self)
        }
        deinit {
            print("\(#function): \(name)")
        }
    }
    
    class F1Car {
        let model: String
        unowned var pilot: Pilot
        init(model: String, pilot: Pilot) {
            self.model = model
            self.pilot = pilot
        }
        deinit {
            print("\(#function): \(model)")
        }
    }
    
    public static func run() {
        let _ = Pilot(name: "pilot", f1CarModel: "f1Car")
    }
}
