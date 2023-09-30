var _start = keyboard_check_released(vk_enter);

if _start{
	room_goto(Room1);
	instance_destroy();
	}