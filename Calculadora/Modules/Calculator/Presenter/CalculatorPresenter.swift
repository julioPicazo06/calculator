import SwiftUI
import Combine

public final class CalculatorPresenter: ObservableObject, CalculatorPresenterProtocol, CalculatorInteractorOutputProtocol {
    @Published public private(set) var state: CalculatorViewState

    private let interactor: CalculatorInteractorInputProtocol
    private let router: CalculatorRouterProtocol

    public init(interactor: CalculatorInteractorInputProtocol, router: CalculatorRouterProtocol, initialState: CalculatorViewState = CalculatorViewState()) {
        self.interactor = interactor
        self.router = router
        self.state = initialState
    }

    public func attach(view: CalculatorViewProtocol) {
        // En SwiftUI, la actualización se hace automáticamente vía @Published
        // Este método se mantiene por compatibilidad con el protocolo
    }

    public func onKeyTap(_ key: CalculatorKey) {
        interactor.process(key: key, current: state)
    }

    // MARK: - CalculatorInteractorOutputProtocol
    public func didUpdate(_ state: CalculatorViewState) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}
