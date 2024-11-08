if !variable_global_exists("trashCan") global.trashCan = [];
for (var i = 0; i < array_length(global.trashCan); i++) {
	if (global.trashCan[i] == id) {
		event_user(0);
		instance_destroy();
		break;
	}
}