//
//  Middleware.swift
//  SwiftUI-Redux
//
//  Created by Yusuke Kita on 7/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import ReSwift

typealias DispatchFunctionClosure = (@escaping DispatchFunction) -> DispatchFunction
typealias MiddlewareFunction = (@escaping DispatchFunction, @escaping () -> AppState?) -> DispatchFunctionClosure

let thunkMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            if let action = action as? ThunkAction {
                _ = action.future
                    .receive(on: DispatchQueue.main)
                    .sink(receiveValue: {
                        next($0)
                    })
            } else {
                return next(action)
            }
        }
    }
}
