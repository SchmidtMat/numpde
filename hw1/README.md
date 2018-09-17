# Homework 1

### Write a function diffmat(x) that returns a square matrix  that computes first derivatives at all points.

The file diffmat_even creates a D matrix based on a the central finite differente stencil 1/(2h)[-1 0 1]. The derivatives on both edges are calculated with a right and left finite difference stencil 1/h[-1 1].
The central finite differente stencil is second order accurate. However, the finite difference formulations on the edges are only first order accurate. To determine the accuracy an infinite norm is used.
The first order accuracy can be confirmed.
To run this example the file First_Derivative_equally_spaced can be used.

The file diffmat_non_even D matrix based on a the right finite differente stencil 1/h[-1 1]. The derivatives on the right edge are calculated with a left finite difference stencil 1/h[-1 1].
 Both finite difference formulations are first order accurate. To determine the accuracy an infinite norm is used. The first order accuracy can be confirmed.
To run this example the file First_Derivative_unequally_spaced can be used.

### Write a function diff2mat(x) that returns a square matrix D2 that computes second derivatives at all points.

The file diff2mat_even creates a D matrix based on a the central finite differente stencil 1/h^2[1 -2 1]. The derivatives on both edges are calculated with a right and left finite difference stencil 1/h^2[2 -5 4 -1] and 1/h^2[-1 4 -5 2].
The central finite differente stencil is 1/12 times the second order accurate. The finite difference formulations on the edges are 11/12 times the second order accurate. To determine the accuracy an infinite norm is used.
The second order accuracy can be confirmed.
To run this example the file Second_Derivative_equally_spaced can be used.

The file diff2mat_non_even creates a D matrix based on a the central finite differente stencil [2/((x(i)-x(i-1))(x(i+1)-x(i-1))) -2/((x(i)-x(i-1))(x(i+1)-x(i))) 2/((x(i+1)-x(i))(x(i+1)-x(i-1)))].
The edges are calculated using same finite different formulation as a right and left term. The used stencil is a general form of the one used with the even grid and thus, should be second order accurate.
However, the use for the edges does not allow this accuracy. To determine the accuracy a infinite norm is used. This method is first order accurate. 
To run this example the file Second_Derivative_unequally_spaced can be used.


Use test solutions to determine the order of accuracy of your methods for evenly and non-evenly spaced points. Which norm did you use?
An infinity norm is used. The accuracy is mentioned in the paragraphs above.