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

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

enum PantallasDisponibles: String, Identifiable{
    case pantalla_agregar, pantalla_aleatorio
    
    var id: String { rawValue }
}

struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    @State var mostrar_pantalla_shuffle: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Joana", telefono: "12345"),
        ContactoAgenda(nombre: "Joana", telefono: "12345"),
        ContactoAgenda(nombre: "Joana", telefono: "12345"),
        ContactoAgenda(nombre: "Joana", telefono: "12345")]
    
    @State var pantalla_a_mostrar: PantallasDisponibles?
    
    
    var body: some View {
        ScrollView{
            HStack(){
                Text("Contactos")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.indigo)
                
                Spacer()
            }
            .frame(alignment: .trailingFirstTextBaseline)
            .padding(.leading, 25)
            .padding(.top, 10)
            
            VStack (spacing: 10){
                ForEach(contactos_actuales){ contacto in
                    //Text("\(contacto.nombre)")
                    ContactoPrevista(contacto_a_mostrar: contacto, al_pulsar:{print("Te envia saludos \(contacto.nombre) desde la pantalla agenda")})
                }
            }
            .frame(alignment: Alignment.center)
            .padding(10)
            //.background(Color.cyan) //ver el fondo de los contactos
        }
        //.background(Color.yellow) //fondo de la aplicacion

        HStack(alignment: VerticalAlignment.center, spacing: 25){
            ZStack{
                Circle()
                    .frame(width: 100)
                    .foregroundColor(Color.indigo)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.indigo)
                Icono(tamaño: 35, ruta_icono: "plus", padding: 0)
                    .foregroundColor(.white)
            }
            .padding(15)
            .onTapGesture {
                print("Falta implementar la seccion de agregar contacto")
                pantalla_a_mostrar = PantallasDisponibles.pantalla_agregar
            }
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width: 100)
                    .tint(Color.blue)
                    .foregroundColor(Color.indigo)
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.indigo)
                Icono(tamaño: 35, ruta_icono: "shuffle", padding: 0)
                    .foregroundColor(.white)
            }
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar la llamada")
                pantalla_a_mostrar = PantallasDisponibles.pantalla_aleatorio
                //mostrar_pantalla_shuffle.toggle()
            }
        }.background(Color.init(hex: 395886))
            .sheet(isPresented: $mostrar_pantalla_agregar_contacto){
                
            }
            .sheet(item: $pantalla_a_mostrar){ pantalla in
                switch(pantalla){
                case .pantalla_agregar:
                    PantallaAgregarContacto(
                        boton_salir: {
                            pantalla_a_mostrar = PantallasDisponibles.pantalla_aleatorio
                        //mostrar_pantalla_agregar_contacto.toggle()
                    },
                        boton_agregar: {nombre, numero in
                            let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero)
                            contactos_actuales.append(contacto_nuevo)
                            pantalla_a_mostrar = nil
                    }
                )
                case .pantalla_aleatorio:
                    Text("Adios mundo")
                }
                
            }
            
            
    }
}

#Preview {
    PantallaAgenda()
}
