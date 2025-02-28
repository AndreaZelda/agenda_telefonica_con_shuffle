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
    ContactoAgenda(nombre: "Joana", telefono: "12345"),
    ContactoAgenda(nombre: "Juanda", telefono: "12345"),
    ContactoAgenda(nombre: "Jun", telefono: "12345"),
    ContactoAgenda(nombre: "Joana", telefono: "12345"),
    ContactoAgenda(nombre: "Juanda", telefono: "12345"),
    ContactoAgenda(nombre: "Jun", telefono: "12345"),
    ContactoAgenda(nombre: "Joana", telefono: "12345")
]

struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                ForEach(contactos){ contacto in
                    //Text("\(contacto.nombre)")
                    ContactoPrevista(contacto_a_mostrar: contacto, al_pulsar:{print("Te envia saludos \(contacto.nombre) desde la pantalla agenda")})
                }
            }
            .background(Color.cyan)
            .frame(width: largo_de_pantalla, alignment: Alignment.center)
        }
        .background(Color.yellow)

        
    }
}

#Preview {
    PantallaAgenda()
}
