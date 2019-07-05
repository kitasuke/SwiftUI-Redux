//
//  AppState.swift
//  SwiftUI-Redux
//
//  Created by Yusuke Kita on 7/2/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var listState: RepositoryListState
    
    init(listState: RepositoryListState = .init()) {
        self.listState = listState
    }
}

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    state.listState = RepositoryListReducer.reduce(action: action, state: state.listState)
    return state
}
