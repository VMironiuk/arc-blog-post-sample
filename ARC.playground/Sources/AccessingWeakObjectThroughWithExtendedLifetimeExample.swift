import Foundation

public struct AccessingWeakObjectThroughWithExtendedLifetimeExample {
    
    class Pilot {
        var name: String
        var f1Car: F1Car?
        init(name: String) {
            self.name = name
        }
        deinit {
            print("\(#function): \(name)")
        }
    }
    
    class F1Car {
        var model: String
        weak var pilot: Pilot?
        init(model: String) {
            self.model = model
        }
        deinit {
            print("\(#function): \(model)")
        }
        func printSummary() {
            print("Renault: Model - \(model), Pilot: \(pilot!.name)")
        }
    }
    
    public static func run() {
        var pilot = Pilot(name: "Alonso")
        var f1Car = F1Car(model: "R2022")
        
        pilot.f1Car = f1Car
        f1Car.pilot = pilot
        withExtendedLifetime(pilot) {
            f1Car.printSummary()
        }
        // Here pilot can be released!
//        f1Car.printSummary()
    }
}
