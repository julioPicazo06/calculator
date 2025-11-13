import SwiftUI

public struct CalculatorView: View {
    public let state: CalculatorViewState
    public let onKeyTap: (CalculatorKey) -> Void

    public init(state: CalculatorViewState, onKeyTap: @escaping (CalculatorKey) -> Void) {
        self.state = state
        self.onKeyTap = onKeyTap
    }

    public var body: some View {
        VStack(spacing: 16) {
            Spacer(minLength: 0)

            DisplayView(
                expression: state.expression,
                result: state.result,
                isError: state.isError
            )
            .padding(.horizontal, 12)

            KeypadView(onTap: onKeyTap)
        }
        .padding(.top, 12)
        .background(Color(.systemBackground))
    }
}

#Preview("Calculator - Preview Stub") {
    struct DemoContainer: View {
        @State private var state = CalculatorViewState(expression: "123 + 45 × 6", result: "393", isError: false)

        var body: some View {
            CalculatorView(state: state) { key in
                switch key.title {
                case "AC":
                    state = CalculatorViewState(expression: "0", result: "0", isError: false)
                case "=":
                    state.result = state.expression
                default:
                    if state.expression == "0" { state.expression = "" }
                    state.expression += key.title
                }
            }
        }
    }

    return DemoContainer()
}
