from scipy.optimize import curve_fit
import matplotlib.pyplot as plt
def func(x, a, b,c):
      return a * (x+b)**2+c
x = [6.623,7.452,8.165,9.891,12.85,14.725,20.75]
y=[501,597,698,839,699,588,509]
plt.plot(x,y,'r')
popt, pcov = curve_fit(func,x,y)
y1 = [func(a, popt[0],popt[1],popt[2]) for a in x]
plt.plot(x,y1,'b')
plt.show()
plt.close()
