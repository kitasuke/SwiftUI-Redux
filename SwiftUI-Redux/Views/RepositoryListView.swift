//
//  ContentView.swift
//  SwiftUI-Flux
//
//  Created by Yusuke Kita on 6/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import SwiftUI
import Combine

struct RepositoryListView : View {
    @ObservedObject var state: RepositoryListState
    let reduxStore: ReduxStore

    init(reduxStore: ReduxStore) {
        self.reduxStore = reduxStore
        self.state = reduxStore.state.listState
    }
    
    var body: some View {
        NavigationView {
            List(state.repositories) { repository in
                RepositoryListRow(repository: repository)
            }
            .alert(isPresented: $state.isErrorShown) { () -> Alert in
                Alert(title: Text("Error"), message: Text(state.errorMessage))
            }
            .navigationBarTitle(Text("Repositories"))
        }
        .onAppear(perform: { self.reduxStore.dispatch(RepositoryListAction.requestAsyncCreator()) })
    }
}

#if DEBUG
struct RepositoryListView_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryListView(reduxStore: AppMain().reduxStore)
    }
}
#endif
