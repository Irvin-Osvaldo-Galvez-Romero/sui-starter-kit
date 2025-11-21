module primerdia::modulo {
    use std::debug::print;//Declaracion del print
    use std::string::utf8;

    const CONSTANTE: u8 = 5;//Declaracion de constante

    public fun suma() {//Funcion general
        let conversion: u8 = CONSTANTE as u8;//Reinterpretar el numero a una escala mas pequeña
        let mut numero: u8 = 10;//declaracion de constante
        numero = 5u8;//Reasigna el Valor a la constante
        print(&(numero + CONSTANTE));//imprimir
        print(&(numero - CONSTANTE));
        print(&(numero * CONSTANTE));
        print(&(numero / CONSTANTE));

        //print(&(utf8(b"Hello, World!")));//imprimir texto
        print(&(numero == conversion));//imprimir
        print(&(numero != conversion));
        print(&(numero < conversion));
        print(&(numero > conversion));

        //Condicion if
        if(numero > conversion){
            print(&(utf8(b"Numero es mayor")))
        } else if ( numero < conversion){
            print(&(utf8(b"Numero es menor")))
        }else {
            print(&(utf8(b"Numero es igual a la conversion")))
        }
    }

    //Ciclos
    fun contador (x: u8){
        let mut cuenta: u8 = 0;
        //while (x > cuenta){
            //print(&cuenta);
            //cuenta = cuenta + 1;
        //}
        loop{
            cuenta = cuenta + 1;
            if(cuenta > x){
                break
            } else{
                print(&cuenta);
            }
        }
    }

    #[test]
    fun test_suma() {//funcion
        //suma()//llama a funcion
        contador(10)
    }
}