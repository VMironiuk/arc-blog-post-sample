import Foundation

/// An example with a situation where two properties, both of which are allowed to be nil, have the potential to cause a strong reference cycle
/// (this scenario  can be resolved by redesigning the system by adding an additional type to avoid using of 'weak' or 'unowned' references)

public struct RedesignToBreakRetainCycleBetweenObjectsExample {
    
    class Pilot {
        let name: String
        var f1CarInfo: F1CarInfo?
        init(name: String) {
            self.name = name
        }
        deinit {
            print("\(#function) (\(Pilot.self): \(name)")
        }
        func info() -> String {
            "\(name) drives \(f1CarInfo?.model ?? "none")"
        }
    }
    
    class F1CarInfo {
        let model: String
        init(model: String) {
            self.model = model
        }
        deinit {
            print("\(#function) (\(F1CarInfo.self)): \(model)")
        }
    }
    
    class F1Car {
        let carInfo: F1CarInfo
        var pilot: Pilot?
        init(carInfo: F1CarInfo) {
            self.carInfo = carInfo
        }
        deinit {
            print("\(#function) (\(F1Car.self)): \(carInfo.model)")
        }
    }
    
    public static func run() {
        let f1CarInfo = F1CarInfo(model: "R2022")
        let f1Car = F1Car(carInfo: f1CarInfo)

        let pilot = Pilot(name: "Alonso")
        
        pilot.f1CarInfo = f1CarInfo
        f1Car.pilot = pilot
        
        print(pilot.info())
    }
}
