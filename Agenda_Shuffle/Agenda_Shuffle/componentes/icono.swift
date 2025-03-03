//
//  icono.swift
//  Agenda_Shuffle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct Icono: View {
    var tamaño: CGFloat
    var ruta_icono: String
    var padding: CGFloat = 10
    
    var body: some View {
        Image(systemName: ruta_icono)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: tamaño, height: tamaño)
            .padding(padding)
    }
}

#Preview {
    Icono(tamaño:50, ruta_icono:"plus")
}
