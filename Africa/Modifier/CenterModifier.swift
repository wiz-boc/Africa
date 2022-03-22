//
//  CenterModifier.swift
//  Africa
//
//  Created by wizz on 11/21/21.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
