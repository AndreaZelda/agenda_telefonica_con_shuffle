//
//  pantalla_agregar_contacto.swift
//  Agenda_Shuffle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

enum Imagenes: String, Identifiable {
    case imagen, imagen2
    
    var id: String {rawValue}
}


struct PantallaAgregarContacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    @State private var imagen_seleccionada: String = "imagen"
    
    @State private var imagen_select: Imagenes?
    
    var boton_salir: () -> Void = {
        print("Parece que te has equivocado")
    }
    var boton_agregar: (_ nombre: String, _ numero: String, _ imagen: String) -> Void = {nombre, numero, imagen in
        print("Parece que te has equivocado")
    }
    
    var body: some View {
        Spacer()
        HStack(){
            Text("Agregar")
                .bold()
                .font(.largeTitle)
                .padding(20)
            Spacer()
        }
        
        HStack{
            Text("Colocar la etiqueta de nombre")
                .font(.title3)
                .frame(alignment: .bottomLeading)
            Spacer()
        }
        .padding(.horizontal)
        
        
        ZStack{
            //Rectangle()
                //.frame(maxWidth: .infinity, maxHeight: 75)
                //.foregroundColor(Color.cyan)
            TextField("Placeholder", text: $nombre).padding(.leading)
                .frame(height: 55)
                .background(Color.indigo,in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
        }
        .padding(.horizontal)
        

        HStack{
            Text("Colocar el campo de numero telefonico")
                .font(.title3)
                .frame(alignment: .bottomLeading)
                .padding(.top, 25)
            Spacer()
        }
        .padding(.horizontal)
        
        ZStack{
            TextField("Placeholder", text: $numero_telefonico).padding(.leading)
                .frame(height: 55)
                .background(Color.indigo,in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
        }
        .padding(.horizontal)
        
        HStack{
            Text("Selecciona una foto de perfil")
                .font(.title3)
                .padding(.top, 25)
            Spacer()
        }
        .padding(.horizontal)
        HStack{
            SeleccionImagen(imagen: Imagenes.imagen, imagen_seleccionada: $imagen_select)
            SeleccionImagen(imagen: Imagenes.imagen2, imagen_seleccionada: $imagen_select)
            /*
            Image("imagencita")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaledToFit()
                .frame(height: 75)
                .onTapGesture {
                    imagen_seleccionada = "imagen"
                }
                
            Image("imagencita")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaledToFit()
                .frame(height: 75)
                .onTapGesture {
                    imagen_seleccionada = "imagen2"
                }
             */
            Spacer()
        }
        .padding(.horizontal)
        
        HStack{
            // Este icono es para agregar a un contacto
            Icono(tamaño: 65, ruta_icono: "person.crop.circle.badge.plus", padding: 10)
                .onTapGesture {
                    boton_agregar(nombre, numero_telefonico, imagen_seleccionada)
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
        Spacer()
        Spacer()
        Spacer()
       
    }
}

struct SeleccionImagen: View {
    var anchura: CGFloat = 75
    var imagen: Imagenes
    
    @Binding var imagen_seleccionada: Imagenes?
    
    @State private var seleccionado: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor((imagen_seleccionada?.rawValue == imagen.rawValue) ? Color.red: Color.gray)
                .frame(height: anchura + 10)
            Image(imagen.id)
                .resizable()
                .scaledToFit()
                .frame(height: anchura)
                .clipShape(Circle())
        }
        .onTapGesture {
            print(imagen)
            imagen_seleccionada = imagen
        }
    }
}

#Preview {
    PantallaAgregarContacto()
}
