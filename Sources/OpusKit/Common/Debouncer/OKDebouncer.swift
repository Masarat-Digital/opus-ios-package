import Foundation

public class OKDebouncer {
    private var workItem: DispatchWorkItem?
    private let queue: DispatchQueue
    private let delay: TimeInterval

    public init(
        delay: TimeInterval = 1.0,
        queue: DispatchQueue = .main
    ) {
        self.delay = delay
        self.queue = queue
    }

    public func debounce(action: @escaping () -> Void) {
        workItem?.cancel()
        workItem = DispatchWorkItem(block: action)
        if let workItem = workItem {
            queue.asyncAfter(deadline: .now() + delay, execute: workItem)
        }
    }
}
