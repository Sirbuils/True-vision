var playerid = obj_player1;

if (obj_player1.spotlight == 0)
    playerid = obj_player2;

if (global.laps != 1)
    instance_destroy();

var _dir = point_direction(x, y, playerid.x, playerid.y);
var _move = 1;
var _spd = maxspeed;
var _dist = point_distance(x, y, playerid.x, playerid.y);
var _killcondition = playerid.instakillmove || playerid.state == states.handstandjump;

with (playerid)
{
    if (state == states.taxi || state == states.victory || state == states.keyget || state == states.gottreasure || state == states.door || state == 292 || instance_exists(obj_fadeout) || obj_player1.cutscene)
        _move = 0;
}

if (_dist < 300)
    _spd = maxspeed;

if (_dist >= 300)
    _spd = maxspeed * 1.35;

if (_dist >= 600)
    _spd = maxspeed * 3.4;

if (_dist >= 800)
    _spd = maxspeed * 7.5;

if (!_move)
    _spd = 0;

finalspeed = lerp(finalspeed, _spd, 0.1);
var targetxscale = sign(playerid.x - x);

if (targetxscale != 0)
    image_xscale = targetxscale;

x += lengthdir_x(finalspeed, _dir);
y += lengthdir_y(finalspeed, _dir);

if (!instance_exists(hitboxid))
{
    if (!_killcondition && _move)
    {
        with (instance_create(x, y, obj_forkhitbox))
        {
            sprite_index = spr_snick_exe;
            mask_index = spr_snick_exe;
            ID = other.id;
            other.hitboxid = id;
        }
    }
}

if ((_killcondition || !_move) && instance_exists(hitboxid))
    instance_destroy(hitboxid);

if (place_meeting(x, y, playerid) && _killcondition)
{
    instance_create(x, y, obj_genericpoofeffect);
    x = room_width / 2;
    y = -100;
}
