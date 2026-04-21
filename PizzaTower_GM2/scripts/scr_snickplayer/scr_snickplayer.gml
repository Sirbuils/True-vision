function scr_snick_crashdash()
{
	if key_jump && key_up
	{
		sprite_index = spr_player_Sjumpcancelstart;
		state = states.crashdash;
		vsp = -11;
	}
}