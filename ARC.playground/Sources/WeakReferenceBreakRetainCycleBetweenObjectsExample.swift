import Foundation

/// An example with a situation where two properties, both of which are allowed to be nil, have the potential to cause a strong reference cycle
/// (this scenario can be resolved with the 'Weak Reference' pattern)

protocol F1CarProtocol {
    var model: String { get }
}

class WeakReference<T: AnyObject> {
    private weak var object: T?
    init(_ object: T) {
        self.object = object
    }
    deinit {
        print("\(#function) (\(WeakReference.self)): \(String(describing: object.self))")
    }
}

extension WeakReference: F1CarProtocol where T: F1CarProtocol {
    var model: String {
        get {
            object?.model ?? "none"
        }
    }
}

public struct WeakReferenceBreakRetainCycleBetweenObjectsExample {
    
    class Pilot {
        let name: String
        var f1Car: F1CarProtocol?
        init(name: String) {
            self.name = name
        }
        deinit {
            print("\(#function) (\(Pilot.self)): \(name)")
        }
        func info() {
            print("\(name) drives the \(f1Car?.model ?? "none")")
        }
    }
    
    class F1Car: F1CarProtocol {
        let model: String
        var pilot: Pilot?
        init(model: String) {
            self.model = model
        }
        deinit {
            print("\(#function) (\(F1Car.self)): \(model)")
        }
        func info() {
            print("\(model) is driven by \(pilot?.name ?? "none")")
        }
    }
    
    public static func run() {
        let pilot = Pilot(name: "Alonso")
        let f1Car = F1Car(model: "R2022")
        
        let f1CarWeakReference = WeakReference(f1Car)
        
        pilot.f1Car = f1CarWeakReference
        f1Car.pilot = pilot
        f1Car.info()
        pilot.info()
    }
}
