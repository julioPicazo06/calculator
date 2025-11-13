import Foundation

final class CalculatorInteractor: CalculatorInteractorInputProtocol {
    weak var output: CalculatorInteractorOutputProtocol?

    func process(key: CalculatorKey, current: CalculatorViewState) {
        var next = current

        switch key.title {
        case "AC":
            next = CalculatorViewState(expression: "0", result: "0", isError: false)
        case "=":
            next.result = current.expression
        default:
            if next.expression == "0" { next.expression = "" }
            next.expression += key.title
        }

        output?.didUpdate(next)
    }
}

