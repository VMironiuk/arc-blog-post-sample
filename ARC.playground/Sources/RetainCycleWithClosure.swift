import Foundation

public struct RetainCycleWithClosureExample {
    
    class Button {
        var onTapAction: (() -> Void)?
        init() {
            onTapAction = { [weak self] in
                self?.info()
            }
        }
        deinit {
            print("\(#function): \(Button.self)")
        }
        func info() {
            print("\(#function): \(Button.self)")
        }
    }
    
    public static func run() {
        let _ = Button()
    }
}
