function scr_playerS_crashdash()
{
	if sprite_index == spr_player_Sjumpcancelstart
	{
		hsp = 0;
		vsp = 0;
		if key_jump3
			sprite_index = spr_playerS_bodyslam;
	}
	else
	{
		hsp = xscale * movespeed;
		movespeed = 14;
		
		if vsp > 0
			vsp++
			
		if grounded && vsp > 0
		{
			sprite_index = spr_mach4;
			state = states.mach3;
		}
	}
}