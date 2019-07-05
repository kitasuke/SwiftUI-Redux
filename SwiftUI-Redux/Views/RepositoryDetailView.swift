//
//  RepositoryDetailView.swift
//  SwiftUI-Flux
//
//  Created by Yusuke Kita on 6/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI

struct RepositoryDetailView: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
}

#if DEBUG
struct RepositoryDetailView_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(text: "foo")
    }
}
#endif
