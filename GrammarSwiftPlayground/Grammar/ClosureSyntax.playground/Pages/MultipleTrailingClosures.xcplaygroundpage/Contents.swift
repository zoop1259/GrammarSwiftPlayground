import Foundation

enum TaskError: Error, LocalizedError {
    case oddNumber
    public var errorDescription: String? {
            switch self {
            case .oddNumber:
                return NSLocalizedString("Odd numbers not supported", comment: "Odd number error")
            }
        }
}

//그냥 이렇게 Void를 반환하는건 return없이 사용하면 된다고 생각하자.
func performTask(value: Int,
                 onSuccess: () -> Void,
                 onFailure: (Error) -> Void,
                 onProgress: (Double) -> Void) {
    if value % 2 != 0 {
        onFailure(TaskError.oddNumber)
    } else {
        for step in 0...value {
            onProgress(Double(step)/Double(value))
        }
        onSuccess()
    }
}

code(for: "Version 1 - No Trailing Closure Syntax") {
    performTask(value: 10, onSuccess: {
        print("Done")
    }, onFailure: { error in
        print(error.localizedDescription)
    }, onProgress: { progress in
        print(progress)
    })
}

code(for: "Version 2 - Last Trailing Closure") {
    performTask(value: 10, onSuccess: {
        print("Done")
    }, onFailure: { error in
        print(error.localizedDescription)
    }) { progress in
        print(progress)
    }
}

code(for: "Version 3 - Second Last ") {
    performTask(value: 10, onSuccess: {
        print("Done")
    }) { error in
        print(error.localizedDescription)
    } onProgress: { progress in
        print(progress)
    }
}

code(for: "Version 4") {
    performTask(value: 10) {
        print("Done")
    } onFailure: { error in
        print(error.localizedDescription)
    } onProgress: { progress in
        print(progress)
    }
}

code(for: "Let Xcode Do it") {
    performTask(value: 9) {
        print("Done")
    } onFailure: { error in
        print(error.localizedDescription)
    } onProgress: { progress in
        print(progress)
    }

}
/*:
[< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
