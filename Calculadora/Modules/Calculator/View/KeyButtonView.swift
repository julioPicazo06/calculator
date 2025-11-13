import SwiftUI

public struct KeyButtonView: View {
    public let key: CalculatorKey
    public let action: (CalculatorKey) -> Void

    public init(key: CalculatorKey, action: @escaping (CalculatorKey) -> Void) {
        self.key = key
        self.action = action
    }

    public var body: some View {
        Button {
            action(key)
        } label: {
            Text(key.title)
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(foregroundColor)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .padding(1)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
    }

    private var backgroundColor: Color {
        switch key.role {
        case .digit: return Color(.tertiarySystemBackground)
        case .operation: return Color.orange
        case .utility: return Color(.secondarySystemBackground)
        case .equals: return Color.accentColor
        }
    }

    private var foregroundColor: Color {
        switch key.role {
        case .digit: return .primary
        case .operation: return .white
        case .utility: return .primary
        case .equals: return .white
        }
    }
}

#Preview("Keys") {
    let keys: [CalculatorKey] = [
        .init(title: "7", role: .digit),
        .init(title: "÷", role: .operation),
        .init(title: "AC", role: .utility),
        .init(title: "=", role: .equals)
    ]

    return VStack(spacing: 12) {
        ForEach(keys) { k in
            KeyButtonView(key: k) { _ in }
                .frame(height: 56)
        }
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
