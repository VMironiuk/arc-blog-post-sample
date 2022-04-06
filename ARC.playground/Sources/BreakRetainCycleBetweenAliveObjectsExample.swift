import Foundation

/// An example in which both properties should always have a value, and neither property should ever be nil once initialization is complete

public struct BreakRetainCycleBetweenAliveObjectsExample {
    
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
        func info() {
            print("\(name) drives \(f1Car.model)")
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
        func info() {
            print("\(model) is driven by \(pilot.name)")
        }
    }
    
    public static func run() {
        let pilot = Pilot(name: "Alonso", f1CarModel: "R2022")
        pilot.info()
        pilot.f1Car.info()
    }
}
