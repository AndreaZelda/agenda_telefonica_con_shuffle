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
            .frame(alignment: Alignment.center)
            .padding(10)
            .background(Color.cyan)
        }
        .background(Color.yellow)

        HStack(alignment: VerticalAlignment.center, spacing: 25){
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.blue)
                    .foregroundColor(Color.indigo)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.cyan)
                Image(systemName: "plus")
                    .background(Color.blue)
            }
            .padding(15)
            .onTapGesture {
                print("Falta implementar esta parte")
            }
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.blue)
                    .foregroundColor(Color.indigo)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.cyan)
                Image(systemName: "shuffle")
                    .background(Color.blue)
            }
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar la llamada")
            }
        }
    }
}

#Preview {
    PantallaAgenda()
}
