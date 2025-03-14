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



enum PantallasDisponibles: String, Identifiable{
    case pantalla_agregar, pantalla_aleatorio
    
    var id: String { rawValue }
}

struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    @State var mostrar_pantalla_shuffle: Bool = false
    @State private var contactoGanador: ContactoAgenda? = nil
    
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Silvia Torres", telefono: "6564897123"),
        ContactoAgenda(nombre: "Lupita Estrada", telefono: "6567891234"),
        ContactoAgenda(nombre: "Víctor Trujillo", telefono: "6561098967"),
        ContactoAgenda(nombre: "Alma Quintero", telefono: "6561502345")
    ]
    
    @State var pantalla_a_mostrar: PantallasDisponibles?
    
    
    var body: some View {
        NavigationStack{
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
                    NavigationLink{
                        Text("Holiii")
                    }label:{
                        ContactoPrevista(contacto_a_mostrar:contacto)
                    }
                    //Text("\(contacto.nombre)")
                    //ContactoPrevista(contacto_a_mostrar: contacto, al_pulsar:{print("Te envia saludos \(contacto.nombre) desde la pantalla agenda")})
                }
            }
            .frame(alignment: Alignment.center)
            .padding(10)
            //.background(Color.cyan) //ver el fondo de los contactos
        }
        }
        //.background(Color.yellow) //fondo de la aplicacion

        HStack(alignment: VerticalAlignment.center, spacing: 25){
            ZStack{
                Circle()
                    .frame(width: 95)
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
                    .frame(width: 95)
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
                if let contactoSeleccionado = contactos_actuales.randomElement(){
                    contactoGanador = contactoSeleccionado
                    pantalla_a_mostrar = PantallasDisponibles.pantalla_aleatorio
                }
                //mostrar_pantalla_shuffle.toggle()
            }
        }//.background(Color.init(hex: 395886))
            .sheet(item: $pantalla_a_mostrar){ pantalla in
                switch(pantalla){
                case .pantalla_agregar:
                    PantallaAgregarContacto(
                        boton_salir: {
                            pantalla_a_mostrar = PantallasDisponibles.pantalla_aleatorio
                        //mostrar_pantalla_agregar_contacto.toggle()
                    },
                        boton_agregar: {nombre, numero, imagen_seleccionada in
                            let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero, imagen: imagen_seleccionada)
                            contactos_actuales.append(contacto_nuevo)
                            pantalla_a_mostrar = nil
                    }
                )
                case .pantalla_aleatorio:
                    if let contacto = contactoGanador {
                        pantalla_del_ganador(contacto_a_molestar: contacto)
                    }
                    else {
                        Text("No se selecciono ningun contacto para shuffle")
                    }
                }
                
            }
            
            
    }
}

#Preview {
    PantallaAgenda()
}
