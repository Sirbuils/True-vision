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
	if char == "M"
	{
		if key_jump2
		{
			with (instance_create(x, y, obj_noiseeffect))
			{
				sprite_index = spr_noisewalljumpeffect;
			}
			sprite_index = spr_pepperman_rolling;
			state = states.pepperbounce;
			savedmove = xscale;
			vsp = -15;
			hsp = 0;
			movespeed = 0;
			image_index = 0;
		}
		if key_attack
		{
			movespeed = 12;
			sprite_index = spr_mach4;
			state = states.mach3;
		}
	}
	if (ANIMATION_END)
	{
		facehurt = true;
		sprite_index = spr_facehurtup;
		image_index = 0;
		state = states.normal;
		jumpstop = true;
	}
	image_speed = 0.35;
}
