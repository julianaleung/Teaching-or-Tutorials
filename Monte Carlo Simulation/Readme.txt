3 files:

1.	Define the equation(s) for the output variable calculation in OV_calc.m

2.	Run MonteCarlo.m 
	performs the Monte Carlo sampling for each input variable
	Plots histogram of each input variable (figures) and the sampled values are saved in input_value.dat
	Calculates and plots distribution of corresponding output variable (as defined in OV_calc.m)  

3.	Run tornado.m
	Generates tornado chart:
	Loads the input_value.dat generated in previous step
	Prompts the user to input a set of “mean” values for each input parameter and calculates an output value for the mean scenario
	Using the sampled values saved in input_value.dat to generate a tornado chart


