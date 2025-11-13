import SwiftUI

public struct KeypadView: View {
    public let rows: [[CalculatorKey]]
    public let onTap: (CalculatorKey) -> Void

    public init(rows: [[CalculatorKey]] = KeypadView.defaultRows, onTap: @escaping (CalculatorKey) -> Void) {
        self.rows = rows
        self.onTap = onTap
    }

    private let columnSpacing: CGFloat = 12
    private let rowSpacing: CGFloat = 12

    public var body: some View {
        Grid(horizontalSpacing: columnSpacing, verticalSpacing: rowSpacing) {
            ForEach(rows.indices, id: \.self) { r in
                GridRow {
                    ForEach(rows[r]) { key in
                        KeyButtonView(key: key, action: onTap)
                            .frame(height: 56)
                            .gridCellColumns(key.flex) // "0" usa flex = 2; el resto = 1
                    }
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 12)
    }
}

public extension KeypadView {
    static var defaultRows: [[CalculatorKey]] {
        [
            [
                .init(title: "AC", role: .utility),
                .init(title: "±", role: .utility),
                .init(title: "%", role: .utility),
                .init(title: "÷", role: .operation)
            ],
            [
                .init(title: "7", role: .digit),
                .init(title: "8", role: .digit),
                .init(title: "9", role: .digit),
                .init(title: "×", role: .operation)
            ],
            [
                .init(title: "4", role: .digit),
                .init(title: "5", role: .digit),
                .init(title: "6", role: .digit),
                .init(title: "−", role: .operation)
            ],
            [
                .init(title: "1", role: .digit),
                .init(title: "2", role: .digit),
                .init(title: "3", role: .digit),
                .init(title: "+", role: .operation)
            ],
            [
                .init(title: "0", role: .digit, flex: 2), // doble ancho
                .init(title: ",", role: .digit),
                .init(title: "=", role: .equals)
            ]
        ]
    }
}

#Preview("Keypad") {
    KeypadView { _ in }
        .previewLayout(.sizeThatFits)
}




