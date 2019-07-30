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
    let objectWillChange: AnyPublisher<Void, Never>
    private let objectWillChangeSubject = PassthroughSubject<Void, Never>()
    
    var repositories: [Repository] = [] {
        didSet { objectWillChangeSubject.send(()) }
    }
    var isErrorShown: Bool = false {
        didSet { objectWillChangeSubject.send(()) }
    }
    var errorMessage: String = "" {
        didSet { objectWillChangeSubject.send(()) }
    }
    var shouldShowIcon: Bool = false {
        didSet { objectWillChangeSubject.send(()) }
    }
    
    init() {
        objectWillChange = objectWillChangeSubject.eraseToAnyPublisher()
    }
}
