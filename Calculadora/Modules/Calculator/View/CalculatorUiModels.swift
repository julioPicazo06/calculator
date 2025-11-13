import SwiftUI

public struct CalculatorViewState: Equatable {
    public var expression: String
    public var result: String
    public var isError: Bool

    public init(expression: String = "0", result: String = "0", isError: Bool = false) {
        self.expression = expression
        self.result = result
        self.isError = isError
    }
}

public enum CalculatorKeyRole: Equatable {
    case digit
    case operation
    case utility
    case equals
}

public struct CalculatorKey: Identifiable, Equatable {
    public let id = UUID()
    public let title: String
    public let role: CalculatorKeyRole
    public let flex: Int

    public init(title: String, role: CalculatorKeyRole, flex: Int = 1) {
        self.title = title
        self.role = role
        self.flex = flex
    }
}
