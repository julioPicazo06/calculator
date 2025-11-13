import SwiftUI

enum CalculatorBuilder {
    static func build() -> some View {
        let router = CalculatorRouter()
        let interactor = CalculatorInteractor()
        let presenter = CalculatorPresenter(interactor: interactor, router: router)
        interactor.output = presenter

        return CalculatorModuleView(presenter: presenter)
    }
}

