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
    let didChange: AnyPublisher<Void, Never>
    private let didChangeSubject = PassthroughSubject<Void, Never>()
    
    var repositories: [Repository] = [] {
        didSet { didChangeSubject.send(()) }
    }
    var isErrorShown: Bool = false {
        didSet { didChangeSubject.send(()) }
    }
    var errorMessage: String = "" {
        didSet { didChangeSubject.send(()) }
    }
    var shouldShowIcon: Bool = false {
        didSet { didChangeSubject.send(()) }
    }
    
    init() {
        didChange = didChangeSubject.eraseToAnyPublisher()
    }
}
