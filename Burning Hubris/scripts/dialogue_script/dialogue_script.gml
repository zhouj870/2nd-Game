function Dialogue() constructor{
	 _dialogs = [];
	 
	 self.add = function(_sprite, _message) {
		 array_push(_dialogs, {
			 sprite: _sprite,
			 message: _message
		 });
	 }
	 
	 self.pop = function() {
		 var _t = array_first(_dialogs);
		 array_delete(_dialogs,0,1);
		 
		 return _t;
	 }
	 
	 self.count = function() {
		 return array_length(_dialogs);
	 }
}