clc
clear
pkg load symbolic
pkg load signal
pkg load optim
#Vector de entrada
[x,fs]= audioread('x3_U017.wav');
lx = length(x);

#Vector de salida
[y,fs]= audioread('y3_U017.wav');
ly = length(y);

#n = 1:lx;
#figure(1)
#subplot(2,1,1)
#stem(n,x)
#title('Entrada x[n]');
#subplot(2,1,2)
#stem(n,y)
#title('Salida y[n]');

n = 1:lx;
size(n)
m=input('Ingrese el valor maximo de m: ');
k=input('Ingrese el valor maximo de k: ');

M = m+2;
m = m+2;
k = m+k-1;
Ne = lx-k;
Ne = 1:3000; %Limite para que lo solucoine más rapido

w = 0:lx-1;

if k>Ne
  fprintf('ERROR El valor de N y M es mayor que la longitud del vecto \n');
else

  %Creación de coeficientes del sistema de ecuaciones
  for j=1:length(Ne)
    l=1;
    for i = 1:k
      if i<M
        C(j,i) = x(m-i);
      endif
      if i>M-1
        C(j,i) = -y(m-l-1);
        l=l+1;
      endif
    endfor
    b1(j) = y(m-1);
    m=m+1;
  endfor
  B = transpose(b1);

  R = lsqlin(C,B,[],[]); %Solucion a traves de minimos cuadrados
  fprintf('El valor para cada uno de los coeficientes es: [b_0; b_1.......;b_M; a_0;.......a_N] \n')
  disp(R);
  endif
R=transpose(R);
%Arreglo de vectores para graficos:
for i = 1:M-1
  b(i) = R(1,i);
endfor

a(1) = 1;
for j=M:k
    a(j-M+2) = R(1,j);
  endfor

%Encontrando el valor de H
syms z;
disp('asdf')
[r,p,k] = residuez(b,a)
h = sum(r./(1-p*z^(-1)))+sum(k*[1 ; z^(-1)]);

for i=1:length(Ne)
  z=i;
  HH(i) = sum(r./(1-p*z^(-1)))+sum(k*[1 ; z ^(-1)]);
endfor
%fprintf('La función H (con fracción parcial) para el sistema es:')

%Analisis Espectral
  f = 1/10; %Frecuencia de 0.1Hz
  N1 = 30; % Numero de muestras
  N2 = 120;
  %Analisis Espectral para X
  %Transformadas:
  X1 = abs(fft(x,N1));
  X2 = abs(fft(x,N2));

  %Rango normalizado para transformadas:
  F1x = [ (0:N1-1) / N1];
  F2x = [ (0:N2-1) / N2];

  %Analisis Espectral para Y
  %Transformadas:
  Y1 = abs(fft(y,N1));
  Y2 = abs(fft(y,N2));

  %Rango normalizado para transformadas:
  F1y = [(0:N1-1)/N1];
  F2y = [(0:N2-1)/N2];

  %Grafica de funciones
  % Funciones X y Y
  figure(1)
  subplot(4,2,1)
  stem(n,x)
  title('X[n]')

  subplot(4,2,2)
  stem(n,y)
  title('Y[n]')





  %Grafica del espectro:
  subplot(4,2,3)
  stem(F1x,X1,'.')
  title('Espectro par X[n] con N=30')

  subplot(4,2,4)
  stem(F2x,X2,'.')
  title('Espectro par X[n] con N=120')

  subplot(4,2,5)
  stem(F1y,Y1,'.')
  title('Espectro par Y[n] con N=30')

  subplot(4,2,6)
  stem(F2y,Y2,'.')
  title('Espectro par Y[n] con N=120')

  %Parte real e imaginaria
  subplot(4,2,7)
  stem(Ne,real(HH))
  title('Parte real H[Z]')

  subplot(4,2,8)
  stem(Ne,real(HH))
  title('Parte imaginaria H[Z]')

  %Respuesta en amplitud y frecuencia
  figure(2)
  freqz(b,a)
  title('Respuesta en Ammplitud y Fase de H(z)')

  %Respuesta al impulso
  figure(3)
  y = filter(b,a,Ne);
  plot(Ne,y)
  title('Respuesta al impulso y al escalón unitario')

  %Polos y ceros
  figure(4)
  zplane(b,a)
  title('Diagrma de Polos y Ceros')
