import SwiftUI

public protocol CalculatorViewProtocol: AnyObject {
    func render(state: CalculatorViewState)
}

public protocol CalculatorPresenterProtocol: AnyObject {
    var state: CalculatorViewState { get }
    func attach(view: CalculatorViewProtocol)
    func onKeyTap(_ key: CalculatorKey)
}

public protocol CalculatorInteractorInputProtocol: AnyObject {
    func process(key: CalculatorKey, current: CalculatorViewState)
}

public protocol CalculatorInteractorOutputProtocol: AnyObject {
    func didUpdate(_ state: CalculatorViewState)
}

public protocol CalculatorRouterProtocol: AnyObject { }




