import Foundation

/// An example with a situation where two properties, both of which are allowed to be nil, have the potential to cause a strong reference cycle
/// (this scenario can be resolved with a weak reference)

public struct WeakBreakRetainCycleBetweenObjectsExample {
    
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
        weak var pilot: Pilot?
        init(model: String) {
            self.model = model
        }
        deinit {
            print("\(#function): \(model)")
        }
    }
    
    public static func run() {
        let pilot = Pilot(name: "Alonso")
        let f1Car = F1Car(model: "R2022")
        
        pilot.f1Car = f1Car
        f1Car.pilot = pilot
    }
}
