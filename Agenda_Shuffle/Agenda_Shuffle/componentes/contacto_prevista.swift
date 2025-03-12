//
//  contacto_prevista.swift
//  Agenda_Shuffle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

let contacto_prueba = ContactoAgenda(nombre: "AHJKSDBAHSF", telefono: "12345")

struct ContactoPrevista: View {
    var contacto_a_mostrar: ContactoAgenda
    var al_pulsar: () -> Void = {print("No se ha implementado")}
    
    let esquinas_redondeadas = CGSize(width: 20, height: 20)
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 10){
            Spacer()
            VStack {
                Image(contacto_a_mostrar.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 85, height: 70,
                           alignment: .center)
                    .clipShape(Circle())
                    .padding(8)
                    //.background(Color.blue)
            }//.background(Color.white)
            
            Spacer()
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 1)
            {
                Text(contacto_a_mostrar.nombre)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                Text(contacto_a_mostrar.telefono)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            //.background(Color.gray)
                
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.indigo)
        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
        .onTapGesture {
            al_pulsar()
        }
    }
}

#Preview {
    ContactoPrevista(contacto_a_mostrar:contacto_prueba)
}
