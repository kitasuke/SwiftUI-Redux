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
final class RepositoryListState: StateType, BindableObject {
    let willChange: AnyPublisher<Void, Never>
    private let willChangeSubject = PassthroughSubject<Void, Never>()
    
    var repositories: [Repository] = [] {
        didSet { willChangeSubject.send(()) }
    }
    var isErrorShown: Bool = false {
        didSet { willChangeSubject.send(()) }
    }
    var errorMessage: String = "" {
        didSet { willChangeSubject.send(()) }
    }
    var shouldShowIcon: Bool = false {
        didSet { willChangeSubject.send(()) }
    }
    
    init() {
        willChange = willChangeSubject.eraseToAnyPublisher()
    }
}
