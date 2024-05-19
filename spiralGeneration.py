import simplekml
import math

kml = simplekml.Kml()

t = 0.00
r = 1.0
a = 8.0
R = 6.0

i=1

while t < 16*math.pi:
    x = ((R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t))/10000.0 - 118.28544
    y = ((R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t))/10000.0 + 34.0206
    kml.newpoint(name="Point" + str(i), coords=[(str(x),str(y))])
    i += 1
    t += 0.01
    
kml.save("spiro_new.kml") 

