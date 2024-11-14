//
//  CarouselItemView.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 14/11/24.
//

import SwiftUI

struct CarouselItemView: View {
    var banner: ServiceType
    var body: some View {
        Image(banner.imagem).resizable()
            .scaledToFit()
            .cornerRadius(20)
    }
}

#Preview {
    CarouselItemView(banner: ServiceType(id: 1, nome: "", imagem: "motivacional1"))
}
