//
//  Redux.swift
//  SwiftUI-Redux
//
//  Created by Yusuke Kita on 7/2/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import ReSwift
import Combine

protocol AppStateType {
    var state: AppState { get }
}

typealias ActionCreatorables = RequestActionCreatorable
typealias RequestActionCreator = (_ state: AppState,_ store: DispatchingStoreType) -> Action?
protocol RequestActionCreatorable {
    func dispatch(_ actionCreatorProvider: @escaping RequestActionCreator)
}

public struct ThunkAction: Action {
    public let future: Publishers.Future<Action, Never>
    
    public init(_ future: Publishers.Future<Action, Never>) {
        self.future = future
    }
}

class ReactiveStore: StoreSubscriber, DispatchingStoreType {
    var state: AppState { return store.state }
    var statePublisher: AnyPublisher<AppState, Never> {
        return stateSubject.eraseToAnyPublisher()
    }
    
    private let store: Store<AppState>
    private lazy var stateSubject: CurrentValueSubject<AppState, Never> = .init(state)
    
    init(store: Store<AppState>) {
        self.store = store
        self.store.subscribe(self)
    }
    
    deinit {
        self.store.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        stateSubject.send(state)
    }
    
    func dispatch(_ action: Action) {
        if Thread.isMainThread {
            store.dispatch(action)
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.store.dispatch(action)
            }
        }
    }
}
