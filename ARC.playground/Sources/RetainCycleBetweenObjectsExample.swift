import Foundation

/// An example with a situation where two properties, both of which are allowed to be nil, have a strong reference cycle

public struct RetainCycleBetweenObjectsExample {
    
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
        var pilot: Pilot?
        init(model: String) {
            self.model = model
        }
        deinit {
            print("\(#function): \(model)")
        }
    }
    
    public static func run() {
        let pilot = Pilot(name: "pilot")
        let f1Car = F1Car(model: "f1car")
        
        pilot.f1Car = f1Car
        f1Car.pilot = pilot
    }
}
