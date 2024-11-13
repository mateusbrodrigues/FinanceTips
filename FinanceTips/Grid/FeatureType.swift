//
//  FeatureType.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//

import SwiftUI

struct FeatureType: View {
    let service : ServiceType
    var body: some View {
        VStack{
            Image(service.imagem).resizable().scaledToFit()
                .cornerRadius(20).fixedSize(horizontal: false, vertical: true)
            Text(service.nome)
        }.frame(width: 80,height: 80)
    }
}

#Preview {
    FeatureType(service: ServiceType(id: 4, nome: "Eduque-se", imagem: "educacao"))
}
