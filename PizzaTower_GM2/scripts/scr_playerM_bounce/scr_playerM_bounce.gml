// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerM_bounce()
{
	hsp = movespeed;
	if (move != 0)
	{
		movespeed = Approach(movespeed, move * 12, 1);
	}
	else
	{
		movespeed = Approach(movespeed, 0, 0.5);
	}
	
	move = key_right + key_left;
	if (move != 0)
	{
		savedmove = move;
	}
	
	if key_down
		vsp++

	move = key_right + key_left;
	if (move != 0)
	{
		savedmove = move;
	}
	
	if (!grounded)
		vsp -= 0.025;
	
	if scr_solid(x + xscale,y) && input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		movespeed = -movespeed * 0.8;
		with (instance_create(x, y, obj_noiseeffect))
		{
			sprite_index = spr_noisewalljumpeffect;
		}
	}
	if scr_solid(x,y + -1) && input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		vsp = 10;
		with (instance_create(x, y, obj_noiseeffect))
		{
			sprite_index = spr_noisewalljumpeffect;
		}
	}

	if grounded && vsp > 0
	{
		if key_attack
		{
			fmod_event_one_shot_3d("event:/sfx/playerN/wallbounceland", x, y);
			input_buffer_slap = 0;
			if (move != 0)
			{
				xscale = move;
			}
			else if (savedmove != 0)
			{
				xscale = savedmove;
			}
			jumpstop = true;
			state = states.mach3;
			movespeed = 14;
			sprite_index = spr_mach4;
			flash = true;
			image_index = 0;
			with (instance_create(x, y, obj_crazyrunothereffect))
			{
				image_xscale = other.xscale;
			}
		}
		else
		{
			state = states.normal;
			movespeed = abs(hsp);
		}
	}
	if (input_buffer_slap > 0 && key_up && (!global.pistol || char == "M"))
	{
		input_buffer_slap = 0;
		state = states.punch;
		image_index = 0;
		sprite_index = spr_breakdanceuppercut;
		fmod_event_instance_play(snd_uppercut);
		vsp = -14;
		movespeed = hsp;
		particle_set_scale(particletypes.highjumpcloud2, xscale, 1);
		create_particle(x, y, particletypes.highjumpcloud2, 0);
	}

	//if (punch_afterimage > 0)
	//{
	//	punch_afterimage--;
	//}
	//else
	//{
	//	punch_afterimage = 5;
	//	create_noise_afterimage(x, y, sprite_index, image_index, xscale);
	//}
	
	if (input_buffer_slap > 0 && !key_up)
	{
		if (!shotgunAnim || move != 0)
		{
			input_buffer_shoot = 0;
			if (move != 0)
			{
				xscale = move;
			}
			input_buffer_slap = 0;
			key_slap = false;
			key_slap2 = false;
			jumpstop = true;
			if (vsp > -5)
			{
				vsp = -5;
			}
			state = states.mach3;
			movespeed = 14;
			sprite_index = spr_playerM_wallbouncecancel;
			with (instance_create(x, y, obj_crazyrunothereffect))
			{
				image_xscale = other.xscale;
			}
			image_index = 0;
			particle_set_scale(particletypes.jumpdust, xscale, 1);
			create_particle(x, y, particletypes.jumpdust, 0);
		}
		else
		{
			if (savedmove != 0)
			{
				xscale = savedmove;
			}
			scr_shotgunshoot();
		}
	}
	
			
	image_speed = 0.4;
}