function div = divisibility(a)
% divisibility checks whether the inputted number is divisible by 3, 5, 7,
% or 11, 13. 
% it returns the result in a 5 coloumn logical vector,
% where each coloumn cooresponds whether a is divisible by the
% cooresponding number

divider = [3: 2: 13];
divider( 4 ) = [];

div = (mod( a, divider ) == 0);

end
