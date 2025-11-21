module basededatos::basededatos {
    use std::vec_map::{VecMap};
    use std::string::{utf8, String};

    public struct informacion has key,store,copy {
        id:UID,
        nombre:String,
        usuarios:VecMap<String,Usuario>
    }
    public struct Usuario has store,copy {
        nombre:String,
        edad:u8,
        tipo: TipoUsuario
    }
    public enum TipoUsuario,has copy,store {
        Basico(Basico),
        Pro(Pro),
    }
    public struct Basico has copy,store {
        mensaje: String,
    }
    public struct Pro has copy,store {
        mensaje: String,
    }

    #[error]
    const ERROR_NOMBRE_EXISTE: vector<u8> = b"El nombre de usuario ya existe";
    const ERROR_USUARIO_NO_EXISTE: u16 = 404; 

    public fun crear_usuario(nombre:String, ctx: &mut TxContext) {
        base = Informacion {
            id: new::object(ctx),
            nombre: nombre,
            usuarios: VecMap::empty()
        };
        transfer::transfer(base, tx_context::sender(ctx));
    }

    public fun crear_usuario(informacion:&mut informacion, nombre:String, edad:u8, tipo:u8) {
        assert!(!informacion.contains(&nombre),ERROR_NOMBRE_EXISTE);
        let tipo_usuario =
        if(tipo == 0){
            TipoUsuario::Basico(Basico {
                mensaje: utf8(b"Usuario Basico"),
            })
        } else {
            TipoUsuario::Pro(Pro {
                mensaje: utf8(b"Usuario Pro"),
            })
        };
        usuario =Usuario {
            nombre: nombre,
            edad: edad,
            tipo: tipo_usuario
        };
        informacion.insert(nombre, usuario);
    }
}