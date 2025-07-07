Proceso  funciones_estadisticas
	//Definimos variables a usar
	Definir i, j, rand, copiaord, conta1, conta2 Como Entero;
	Definir media, suma, Resultado Como Real;
	
	//Dimencionamos la matriz principal y se le da valores al azar
	Dimensionar rand[100];
	Para i = 0 Hasta 99 Con Paso 1 Hacer
		rand[i] = Azar(50);
	FinPara
	
	//Mostramos la matriz original en un tamaño de 10x10
	Escribir "Matriz original";
	
	Dimensionar aux1[10,10];
	conta1 = 0;
	Para i = 0 Hasta 9 Hacer
		Para j = 0 Hasta 9 Hacer
			aux1[i,j] = rand[conta1];
			conta1 = conta1 + 1;
		FinPara
	FinPara
	Para i = 0 Hasta 9 Hacer
		Para j = 0 Hasta 9 Hacer
			Escribir aux1[i,j] Sin Saltar, ",    ";
		FinPara
		Escribir "    ";
	FinPara
	Escribir "  ";
	Escribir "  ";
	
	//Dimencionamos la matriz copia ordenada de forma ascendente
	Dimensionar copiaord[100]
	Para i = 0 Hasta 99 Con Paso 1 Hacer
		copiaord[i] = rand[i];
	Fin Para
	Para i = 0 Hasta 98 Hacer
        Para j = 0 Hasta 98-i Hacer
            Si copiaord[j] > copiaord[j+1] Entonces
                guard = copiaord[j];
                copiaord[j] = copiaord[j+1];
                copiaord[j+1] = guard;
            FinSi
        FinPara
    FinPara
	
	//Presentamos la matriz ya ordenada de forma ascendente en un tamaño de 10x10
	Escribir "Matriz ordenada ascendentemente";
	Dimensionar aux2[10,10];
	conta2 = 0;
	Para i = 0 Hasta 9 Hacer
		Para j = 0 Hasta 9 Hacer
			aux2[i,j] = copiaord[conta2];
			conta2 = conta2 + 1;
		FinPara
	FinPara
	Para i = 0 Hasta 9 Hacer
		Para j = 0 Hasta 9 Hacer
			Escribir aux2[i,j] Sin Saltar, "    ";
		FinPara
		Escribir "    ";
	FinPara
	Escribir "  ";
	Escribir "  ";
	
	//Presentamos los valores de las funciones usadas
	Escribir "La media aritmetica de los elementos de este arreglo es: ", MediaAritmetica(rand);
	Escribir "La mediana de los elementos de este arreglo es: ", Mediana(rand);
	Escribir "La moda de los elementos de este arreglo es: ", Moda(rand);
	Escribir "La varianza (poblacion) de los elementos de este arreglo es: ", Varianza(rand);
	Escribir "La desviacion estandar (poblacion) de los elementos de este arreglo es: ", DesviacionEstandar(rand);
	
FinProceso


//Funcion que calcula la media aritmetica de la matriz principal
Funcion Resultado = MediaAritmetica (rand)
	Definir suma, i Como Entero;
	suma = 0;
	Para i = 0 Hasta 99 Con Paso 1 Hacer
		suma = suma + rand[i];
	Fin Para
	Resultado = suma/100;
Fin Funcion


//Funcion que calcula la mediana de la matriz copia ordenada
Funcion Resultado = Mediana (copiaord)
	Resultado = (copiaord[49] + copiaord[50])/2;
Fin Funcion


//Funcion que calcula la moda de la matriz principal
Funcion resultado <- Moda(rand)
    Definir frecuencias Como Entero;  
    Definir i, maxFrecuencia, contadorModas Como Entero;
    Definir modas Como Entero ;
    Definir resultado Como Cadena;   
    Dimensionar frecuencias[50];    
	Dimensionar modas[50];

    Para i = 0 Hasta 49 Hacer
        frecuencias[i] = 0;
    FinPara
    
    Para i = 0 Hasta 99 Hacer
        frecuencias[rand[i]] = frecuencias[rand[i]] + 1;
    FinPara
    
    maxFrecuencia = 0;
    Para i = 0 Hasta 49 Hacer
        Si frecuencias[i] > maxFrecuencia Entonces
            maxFrecuencia = frecuencias[i];
        FinSi
    FinPara
    
    contadorModas = 0;
    Para i = 0 Hasta 49 Hacer
        Si frecuencias[i] == maxFrecuencia Entonces
            modas[contadorModas] = i;
            contadorModas = contadorModas + 1;
        FinSi
    FinPara
    
    resultado = "";
    Si contadorModas == 1 Entonces
        resultado = ConvertirATexto(modas[0]);
    Sino
        resultado = "[";
        Para i = 0 Hasta contadorModas - 1 Hacer
            resultado = resultado + ConvertirATexto(modas[i]);
            Si i < contadorModas - 1 Entonces
                resultado = resultado + ", ";
            FinSi
        FinPara
        resultado = resultado + "]";
    FinSi
FinFuncion

//Funcion que calcula la varianza de la matriz principal
Funcion Resultado = Varianza(rand)		
		media = MediaAritmetica(rand);
		suma = 0;
		Para i = 0 Hasta 99 Hacer
			suma = suma + (rand[i] - media)^2;
		FinPara
		resultado = suma / 100;
FinFuncion


//Funcion que calcula la desviacion estandar de la matriz principal
Funcion resultado = DesviacionEstandar(rand)
    resultado = raiz(Varianza(rand));
FinFuncion