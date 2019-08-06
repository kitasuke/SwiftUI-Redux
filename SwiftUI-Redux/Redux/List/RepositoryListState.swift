//
//  RepositoryListState.swift
//  SwiftUI-Redux
//
//  Created by Yusuke Kita on 7/2/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import ReSwift
import Combine
import SwiftUI

// MARK: State
final class RepositoryListState: StateType, ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isErrorShown: Bool = false
    @Published var errorMessage: String = ""
    @Published var shouldShowIcon: Bool = false
}
