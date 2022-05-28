/// @func is_in_range
/// @arg {real} tgtNum
/// @arg {real} minNum
/// @arg {real} maxNum
/// @arg {bool*} inclusive

var _tgtNum = argument[0];
var _minNum = argument[1];
var _maxNum = argument[2];
var _inclusive = false;

if (argument_count > 3) {
	var _inclusive = argument[3];
}

switch (_inclusive) {
	case true:
		return ((_tgtNum >= _minNum) && (_tgtNum <= _maxNum));
	case false:
		return ((_tgtNum > _minNum) && (_tgtNum < _maxNum));
}
