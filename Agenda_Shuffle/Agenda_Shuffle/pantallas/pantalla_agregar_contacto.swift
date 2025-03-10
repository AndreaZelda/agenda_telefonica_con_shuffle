//
//  pantalla_agregar_contacto.swift
//  Agenda_Shuffle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct PantallaAgregarContacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    //@State private var imagen_seleccionada: String = ""
    
    var boton_salir: () -> Void = {
        print("Parece que te has equivocado")
    }
    var boton_agregar: (_ nombre: String, _ numero: String) -> Void = {nombre, numero in
        print("Parece que te has equivocado")
    }
    
    var body: some View {
        HStack(){
            Text("Agregar")
                .bold()
                .font(.largeTitle)
                .padding(20)
            Spacer()
        }
        
        
        Text("Colocar la etiqueta de nombre")
            .font(.title3)
            .frame(alignment: .bottomLeading)
        
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 75)
                .foregroundColor(Color.cyan)
            TextField("Placeholder", text: $nombre)
                .padding(10)
        }
        

        Text("Colocar el campo de numero telefonico")
            .font(.title3)
            .frame(alignment: .bottomLeading)
            .padding(.top, 25)
        
        TextField("Placeholder", text: $numero_telefonico)
            .frame(height: 35)
            .padding(10)
        
        HStack{
            // Este icono es para agregar a un contacto
            Icono(tamaño: 65, ruta_icono: "person.crop.circle.badge.plus", padding: 10)
                .onTapGesture {
                    boton_agregar(nombre, numero_telefonico)
                }
                .padding(25)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Spacer()
            
            // Este icono es para salir
            Icono(tamaño: 65, ruta_icono: "return")
                .onTapGesture {
                    boton_salir()
                }
                .padding(25)
                .foregroundColor(.red)
            
        }
        
        Spacer()
       
    }
}

#Preview {
    PantallaAgregarContacto()
}
