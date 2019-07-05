//
//  RepositoryListReducer.swift
//  SwiftUI-Redux
//
//  Created by Yusuke Kita on 7/2/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import ReSwift

struct RepositoryListReducer {
    static func reduce(action: Action, state: RepositoryListState) -> RepositoryListState {
        switch action {
        case let action as RepositoryListAction:
            switch action {
            case .updateRepositories(let repositories):
                state.repositories = repositories
            case .showError(let error):
                state.errorMessage = error.message
                state.isErrorShown = true
            case .showIcon:
                state.shouldShowIcon = true
            }
        default:
            break
        }
        return state
    }
}
