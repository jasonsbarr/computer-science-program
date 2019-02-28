import numpy

def get_exponent_of_number(num, pow):
    return num ** pow

def get_log2(num):
    return numpy.log2(num)

x = int(input("Enter a number, x: "))
y = int(input("And another one, y: "))
print("x raised to the power " + str(y) + " is " + str(get_exponent_of_number(x, y)))
print("log2 of x is " + str(get_log2(x)))
