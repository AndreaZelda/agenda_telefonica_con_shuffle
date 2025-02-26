//
//  PantallaAgenda.swift
//  Agenda_Shuffle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

let contactos = [
    ContactoAgenda(nombre: "Juna", telefono: "12345"),
    ContactoAgenda(nombre: "Juan", telefono: "12345"),
    ContactoAgenda(nombre: "Juanda", telefono: "12345"),
    ContactoAgenda(nombre: "Jun", telefono: "12345"),
    ContactoAgenda(nombre: "Joana", telefono: "12345")
]

struct PantallaAgenda: View {
    var body: some View {
        List{
            VStack {
                ForEach(contactos){ contacto in
                    Text("\(contacto.nombre)")
                    ContactoPrevista()
                }
            }
            .background(Color.cyan)
        }
        
    }
}

#Preview {
    PantallaAgenda()
}
