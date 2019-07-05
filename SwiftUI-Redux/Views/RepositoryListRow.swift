//
//  RepositoryListRow.swift
//  SwiftUI-Flux
//
//  Created by Yusuke Kita on 6/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI

struct RepositoryListRow: View {

    @State var repository: Repository

    var body: some View {
        NavigationButton(destination: RepositoryDetailView(text: repository.fullName)) {
            Text(repository.fullName)
        }
    }
}

#if DEBUG
struct RepositoryListRow_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryListRow(repository:
            Repository(
                id: 1,
                fullName: "foo",
                owner: User(id: 1, login: "bar", avatarUrl: URL(string: "baz")!)
            )
        )
    }
}
#endif
