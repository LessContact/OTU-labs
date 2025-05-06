import numpy as np
import matplotlib.pyplot as plt

# Example data points
T_values = np.array([0.0, 1.5, 3.0])
T_i_values = np.array([0.88, 0.48, 0.37])

# Fit a 3rd-degree polynomial (you can change the degree as needed)
coeffs = np.polyfit(T_values, T_i_values, deg=2)
poly_func = np.poly1d(coeffs)

print("The polynomial formula is:")
print(poly_func)

# Plot the fit for visualization
T_plot = np.linspace(min(T_values), max(T_values), 100)
T_i_plot = poly_func(T_plot)

plt.plot(T_values, T_i_values, 'o', label='Data points')
plt.plot(T_plot, T_i_plot, '-', label='Polynomial fit')
plt.xlabel('T')
plt.ylabel('T_i')
plt.legend()
plt.title('Polynomial Fit for T_i vs T')
plt.show()
