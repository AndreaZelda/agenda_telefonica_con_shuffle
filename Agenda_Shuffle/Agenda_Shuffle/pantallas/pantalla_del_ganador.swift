//
//  pantalla_del_ganador.swift
//  Agenda_Shuffle
//
//  Created by alumno on 3/5/25.
//

import SwiftUI

var contacto_alterno = ContactoAgenda(nombre: "Telefoncio", telefono: "6567895635")

struct pantalla_del_ganador: View {
    var boton_salida: () -> Void = {
        print("Apretaste colgar")
    }
    var contacto_a_molestar: ContactoAgenda
    var body: some View {
        Spacer()
        Text("Llamando a...")
            .font(.subheadline)
        
        ZStack{
            Circle().foregroundColor(.green)
                .frame(width: 230)
            Image("imagen")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
        }
        Icono(tamaño: 75, ruta_icono: "phone.down.waves.left.and.right", padding: 0)
            .foregroundColor(.green)
        Text(contacto_a_molestar.nombre)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Text(contacto_a_molestar.telefono)
            .font(.system(size: 16))
        
        Spacer()
        
        Icono(tamaño: 70, ruta_icono: "phone.circle.fill", padding: 10)
            .onTapGesture {
                boton_salida()
            }
            .foregroundColor(.red)
    }
}

#Preview {
    pantalla_del_ganador(contacto_a_molestar: contacto_alterno)
}
