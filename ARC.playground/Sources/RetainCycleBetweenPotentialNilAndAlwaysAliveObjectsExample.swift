import Foundation

/// An example with a situation where one property that’s allowed to be nil and another property that can’t be nil have the potential to cause a strong reference cycle

public struct RetainCycleBetweenPotentialNilAndAlwaysAliveObjectsExample {
    
    class Pilot {
        let name: String
        var f1Car: F1Car?
        init(name: String) {
            self.name = name
        }
        deinit {
            print("\(#function): \(name)")
        }
    }
    
    class F1Car {
        let model: String
        var pilot: Pilot
        init(model: String, pilot: Pilot) {
            self.model = model
            self.pilot = pilot
        }
        deinit {
            print("\(#function): \(model)")
        }
    }
    
    public static func run() {
        let pilot = Pilot(name: "pilot")
        let f1Car = F1Car(model: "f1Car", pilot: pilot)
        pilot.f1Car = f1Car
    }
}
