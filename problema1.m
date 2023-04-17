clc
clear
pkg load symbolic
pkg load signal
#Vector de entrada
n = 0:30;
x_n= 5+((n/13)-2).^3;


n = 0:31;
x=zeros(1,31);
x = x_n;
y_n = cos(n)+5;               #Teoricame       Octave
                                #x[10]     ->   x[11]

A=[x(11)  x(10)  x(9)   x(8)   x(7)   x(6)   x(5)   x(4)   x(3)   x(2)   x(1)   -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7)   -y_n(6)   -y_n(5)   -y_n(4)   -y_n(3)   -y_n(2)   -y_n(1);
   x(12)  x(11)  x(10)  x(9)   x(8)   x(7)   x(6)   x(5)   x(4)   x(3)   x(2)   -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7)   -y_n(6)   -y_n(5)   -y_n(4)   -y_n(3)   -y_n(2);
   x(13)  x(12)  x(11)  x(10)  x(9)   x(8)   x(7)   x(6)   x(5)   x(4)   x(3)   -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7)   -y_n(6)   -y_n(5)   -y_n(4)   -y_n(3);
   x(14)  x(13)  x(12)  x(11)  x(10)  x(9)   x(8)   x(7)   x(6)   x(5)   x(4)   -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7)   -y_n(6)   -y_n(5)   -y_n(4);
   x(15)  x(14)  x(13)  x(12)  x(11)  x(10)  x(9)   x(8)   x(7)   x(6)   x(5)   -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7)   -y_n(6)   -y_n(5);
   x(16)  x(15)  x(14)  x(13)  x(12)  x(11)  x(10)  x(9)   x(8)   x(7)   x(6)   -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7)   -y_n(6);
   x(17)  x(16)  x(15)  x(14)  x(13)  x(12)  x(11)  x(10)  x(9)   x(8)   x(7)   -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8)   -y_n(7);
   x(18)  x(17)  x(16)  x(15)  x(14)  x(13)  x(12)  x(11)  x(10)  x(9)   x(8)   -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9)   -y_n(8);
   x(19)  x(18)  x(17)  x(16)  x(15)  x(14)  x(13)  x(12)  x(11)  x(10)  x(9)   -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10)  -y_n(9);
   x(20)  x(19)  x(18)  x(17)  x(16)  x(15)  x(14)  x(13)  x(12)  x(11)  x(10)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11)  -y_n(10);
   x(21)  x(20)  x(19)  x(18)  x(17)  x(16)  x(15)  x(14)  x(13)  x(12)  x(11)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)  -y_n(11);
   x(22)  x(21)  x(20)  x(19)  x(18)  x(17)  x(16)  x(15)  x(14)  x(13)  x(12)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13)  -y_n(12)
   x(23)  x(22)  x(21)  x(20)  x(19)  x(18)  x(17)  x(16)  x(15)  x(14)  x(13)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14)  -y_n(13);
   x(24)  x(23)  x(22)  x(21)  x(20)  x(19)  x(18)  x(17)  x(16)  x(15)  x(14)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15)  -y_n(14);
   x(25)  x(24)  x(23)  x(22)  x(21)  x(20)  x(19)  x(18)  x(17)  x(16)  x(15)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16)  -y_n(15);
   x(26)  x(25)  x(24)  x(23)  x(22)  x(21)  x(20)  x(19)  x(18)  x(17)  x(16)  -y_n(25)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17)  -y_n(16);
   x(27)  x(26)  x(25)  x(24)  x(23)  x(22)  x(21)  x(20)  x(19)  x(18)  x(17)  -y_n(26)  -y_n(25)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18)  -y_n(17);
   x(28)  x(27)  x(26)  x(25)  x(24)  x(23)  x(22)  x(21)  x(20)  x(19)  x(18)  -y_n(27)  -y_n(26)  -y_n(22)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19)  -y_n(18);
   x(29)  x(28)  x(27)  x(26)  x(25)  x(24)  x(23)  x(22)  x(21)  x(20)  x(19)  -y_n(28)  -y_n(27)  -y_n(26)  -y_n(25)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20)  -y_n(19);
   x(30)  x(29)  x(28)  x(27)  x(26)  x(25)  x(24)  x(23)  x(22)  x(21)  x(20)  -y_n(29)  -y_n(28)  -y_n(27)  -y_n(26)  -y_n(25)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)  -y_n(20);
   x(31)  x(30)  x(29)  x(28)  x(27)  x(26)  x(25)  x(24)  x(23)  x(22)  x(21)  -y_n(30)  -y_n(29)  -y_n(28)  -y_n(27)  -y_n(26)  -y_n(25)  -y_n(24)  -y_n(23)  -y_n(22)  -y_n(21)];

B=[y_n(11); y_n(12); y_n(13); y_n(14); y_n(15); y_n(16); y_n(17); y_n(18); y_n(19); y_n(20); y_n(21); y_n(22); y_n(23); y_n(24); y_n(25); y_n(26); y_n(27); y_n(28); y_n(29); y_n(30); y_n(31)];

C = A\B;    #Determinación de coeficientes

fprintf('Comparación de valores, \n Primera columna: Función encontrada         Segunda Fila: Función original  \n');
M=A*C;      #Comprobación de coeficientes multiplicandolo por el lado derecho del sistema
for i=1:21
    m(i)=y_n(i+10);
end
l=transpose(m);
Comparacion=[M l];


c=transpose(C);
%Ordenando coeficientes poara el denominador y el numerador
for i=1:11
    b(i)=c(1,i);
end
a(1)=1;
for j=12:21
    a(j-10)=c(j);
end

syms z;  #Función syms nos sirve para tomar Z como un texto plano y no como variable
Z=[1 ;z^(-1);z^(-2);z^(-3);z^(-4);z^(-5);z^(-6);z^(-7);z^(-8);z^(-9);z^(-10)];
h1=(b*Z);
h2=(a*Z);
fprintf('La función H (sin fracción parciales) para el sistema es:')
H=h1/h2;
###################################################################################


fprintf('\n Coeficientes de fracciones parciales: \n')
[r,p,k]=residue(b,a)         #Metodo residue devuelve valores de r, p y k en base de los coeficientes del polinomio
r=transpose(r);
p=transpose(p);

fprintf('La función H (con fracción parciales) para el sistema es:')
h=sum(r./(1-p*z^(-1)))+sum(k*[1 ; z^(-1)]);   #Eq.Funcion de transferencia sin evaluar.
for i=1:31
    z=i;
    HH(i)=sum(r./(1-p*z^(-1)))+sum(k*[1 ; z^(-1)]);   #Función de transferencia evaluada
end
HH;

###################################################################################


n=0:30;
f=1/10;%Frecuencia de 0.1Hz
N1=40; %numero de muestras
N2=150; %numero de muestras

%Analisis Espectral Para X

X1=abs(fft(x,N1));    #Transformada de Fourier de la entrada a 40 muestras
X2=abs(fft(x,N2));    #Transformada de Fourier de la entrada a 150 muestras

%Rango normalizado para transformadas:
F1x=[(0:N1-1)/N1];
F2x=[(0:N2-1)/N2];

%Analisis Espectral Para Y
%Transformadas:
Y1=abs(fft(y_n,N1));   #Transformada de Fourier de la salida a 40 muestras
Y2=abs(fft(y_n,N2));   #Transformada de Fourier de la salida a 150 muestras

%Rango normalizado para transformadas:
F1y=[(0:N1-1)/N1];
F2y=[(0:N2-1)/N2];


%Grafica de funciones
%Funciones X y Y original
figure (1)
subplot(4,2,1)
stem(n,x)
title('x[n]')

subplot(4,2,2)
stem(y_n)
title('y[n]')

%Gráficas del espectro:
subplot(4,2,3)
stem(F1x,X1,'.')
title('Espectro en frecuencia para X[n] con N=40')

subplot(4,2,5)
stem(F2x,X2,'.')
title('Espectro en frecuencia para X[n] con N=150')

subplot(4,2,4)
stem(F1y,Y1,'.')
title('Espectro en frecuencia para Y[n] con N=40')

subplot(4,2,6)
stem(F2y,X2,'.')
title('Espectro en frecuencia paraY[n] con N=150')


%Parte Real e imaginaria
subplot(4,2,7)
stem(n,real(HH))  #Parte real de la función de transferencia ya evaluada
title('Parte real H[Z]')

subplot(4,2,8)
stem(n,imag(HH))    #Parte imaginaria de la función de transferencia ya evaluada
title('Parte imaginaria H[Z]')

%respuesta en amplitud y frecuencia
figure(2)
freqz(b,a)      #Función freqz devuelve la función de transferencia en amplitud y fase partiendo de los coeficientes de los polinomios.
title('Respuesta en Amplitud y Fase de H(z)')

%Resopuesta al impulso
figure(3)
y= filter(b,a,n);
plot(n,y)
title('Respuesta al impulso y al escalón unitario')

%Plolos  y Ceros
figure(4)
zplane(b,a)   # Zplane representa polos y ceros de un sistema lineal a partir de los coeficientes de los polinomios.
title('Diagrama de Polos y Ceros')



