//
//  ReduxStore.swift
//  SwiftUI-Redux
//
//  Created by Yusuke Kita on 7/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import ReSwift

final class ReduxStore: ReactiveStore, ActionCreatorables {
    
    override init(store: Store<AppState>) {
        super.init(store: store)
    }
    
    private func create( _ actionCreatorProvider: @escaping RequestActionCreator) -> Action? {
        return actionCreatorProvider(state, self)
    }
    
    func dispatch(_ actionCreatorProvider: @escaping RequestActionCreator) {
        guard let action = create(actionCreatorProvider) else { return }
        dispatch(action)
    }
}
