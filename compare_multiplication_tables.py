#!/usr/bin/env python3

print("Bienvenido al comparador de tablas de multiplicar!\n")

n1 = input("Ingrese el primer número > ")
n2 = input("Ingrese el segundo número> ")

print("Tabla del {}\t\tTabla del {}".format(n1,n2))

for i in range(1, 11):
    print ("{} x {} = ".format(i, n1),(i * int(n1)),"\t\t", "{} x {} = ".format(i,n2), (i * int(n2)), sep="")
