if (image_index == 0 && global.panic)
{
	image_speed = 0.35;
	image_index = 0;
	global.panic = false;
	global.snickchallenge = false;
	if (instance_exists(obj_snickexe))
	{
		instance_destroy(obj_snickexe);
	}
}
