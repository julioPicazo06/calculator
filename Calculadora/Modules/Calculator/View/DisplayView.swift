import SwiftUI

public struct DisplayView: View {
    public let expression: String
    public let result: String
    public let isError: Bool

    public init(expression: String, result: String, isError: Bool) {
        self.expression = expression
        self.result = result
        self.isError = isError
    }

    public var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text(expression)
                .font(.system(size: 28, weight: .medium, design: .rounded))
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .trailing)

            Text(result)
                .font(.system(size: 48, weight: .semibold, design: .rounded))
                .foregroundStyle(isError ? Color.red : Color.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview("Display - Normal") {
    DisplayView(
        expression: "123 + 45 × 6",
        result: "393",
        isError: false
    )
    .padding()
    .previewLayout(.sizeThatFits)
}

#Preview("Display - Error") {
    DisplayView(
        expression: "1 ÷ 0",
        result: "Error",
        isError: true
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
