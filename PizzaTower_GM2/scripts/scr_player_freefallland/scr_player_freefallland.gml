function scr_player_freefallland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	facehurt = true;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	if (ANIMATION_END)
	{
		if char != "M"
		{
			facehurt = true;
			sprite_index = spr_facehurtup;
			image_index = 0;
			state = states.normal;
			jumpstop = true;
		}
		else
		{
			if key_attack
			{
				sprite_index = spr_pepperman_shoulderstart;
				movespeed = 14;
				image_index = 0;
				state = states.mach3;
			}
			else
			{
				facehurt = true;
				sprite_index = spr_facehurtup;
				image_index = 0;
				state = states.normal;
				jumpstop = true;
			}
		}
	}
	image_speed = 0.35;
}
