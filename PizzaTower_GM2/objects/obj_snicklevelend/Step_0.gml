if (ANIMATION_END && obj_player.state != states.actor)
{
	with (obj_player)
	{
		sprite_index = spr_playerS_victory;
		state = states.actor;
		image_index = 0;
	}
	alarm[0] = 200;
}
if (ANIMATION_END)
{
	image_speed = 0;
}
