/// @func range_convert
/// @arg {real} minrange1
/// @arg {real} maxrange1
/// @arg {real} minrange2
/// @arg {real} maxrange2
/// @arg {real} value
/*
range_convert(minrange1,maxrange1,minrange2,maxrange2,value)
Converts and interpolates value from (minrange1,maxrange1) to (minrange2,maxrange2).
*/
// https://twitter.com/steampanic/status/1022804357253918720

var value, minrange1, maxrange1, minrange2, maxrange2, dec;

minrange1 = argument[0];
maxrange1 = argument[1];
minrange2 = argument[2];
maxrange2 = argument[3];
value = argument[4];

dec = (value - minrange1) / (maxrange1 - minrange1);
return dec * (maxrange2 - minrange2) + minrange2;
