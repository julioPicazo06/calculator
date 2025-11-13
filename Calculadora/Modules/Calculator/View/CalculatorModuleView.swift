import SwiftUI

public struct CalculatorModuleView: View {
    @StateObject private var presenter: CalculatorPresenter

    public init(presenter: CalculatorPresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }

    public var body: some View {
        CalculatorView(
            state: presenter.state,
            onKeyTap: { presenter.onKeyTap($0) }
        )
    }
}

#Preview("Module") {
    let router = CalculatorRouter()
    let interactor = CalculatorInteractor()
    let presenter = CalculatorPresenter(interactor: interactor, router: router)
    interactor.output = presenter
    return CalculatorModuleView(presenter: presenter)
}

