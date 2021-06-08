from scipy.optimize import curve_fit
import matplotlib.pyplot as plt
def func(x, a, b):
      return a * (x/1000)**b
u = [0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,8,9,10,11]
i=[0,12.41,18.70,23.19,27.46,31.45,34.29,37.28,40.44,43.50,46.29,
49.20,51.76,54.29,56.37,61.45,65.74,69.93,73.88]
plt.plot(i,u,'r')

popt, pcov = curve_fit(func,i,u)
print(popt)
#u1 = [func(a, popt[0],popt[1]) for a in i]
plt.show()
#plt.close()