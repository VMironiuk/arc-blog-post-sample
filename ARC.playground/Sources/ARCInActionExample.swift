import Foundation

/// A simple example which shows how memory is managed by ARC

public struct ARCInActionExample {

    class Employee {
        let name: String
        init(name: String) {
            self.name = name
        }
        deinit {
            print("\(#function): \(name)")
        }
    }

    public static func run() {
        var t1: Employee?
        var t2: Employee?
        var t3: Employee?
        
        t1 = Employee(name: "John Doe")
        t2 = t1
        t3 = t1
        
        t1 = nil
        t2 = nil
        t3 = nil
    }

}
