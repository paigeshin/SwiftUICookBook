import UIKit
import SwiftUI
import Combine

class ExampleViewController: ViewController {
    
    let delegate: ContactPickerDelegate = ContactPickerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIHostingController(rootView: ContactView(delegate: self.delegate))
        present(vc, animated: true)
        let _ = delegate.didChange.sink { delegate in
            
        }
    }
    
}

class ContactPickerDelegate: ObservableObject {
    
    var willChange = PassthroughSubject<ContactPickerDelegate, Never>()
    var didChange = PassthroughSubject<ContactPickerDelegate, Never>()
    
    var contact: String? {
        willSet {
            willChange.send(self)
        }
        
        didSet {
            didChange.send(self)
        }
    }
}

struct ContactView: View {
    
    @StateObject var delegate: ContactPickerDelegate
    
    var body: some View {
        List {
            Button("Alice") {
                self.delegate.contact = "Alice"
            }
            Button("Bob") {
                self.delegate.contact = "Bob"
            }
            Button("Trudy") {
                self.delegate.contact = "Trudy"
            }
        }
    }
    
}
