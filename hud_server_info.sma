#include <amxmodx>

public plugin_init()
{
	register_plugin("Hud Info", "1.0", "ByOreo")
	
	set_task(1.0, "task_hud", _, _, _, "b")
}

public task_hud()
{
	static ip[22]
	get_user_ip(0, ip, charsmax(ip))
	set_dhudmessage(random_num(0, 255), random_num(0, 255), random_num(0, 255), -1.0, 0.0, 0, 1.1, 1.1, 0.1, 0.1);
	show_dhudmessage(0, "IP: %s", ip)
	
	set_dhudmessage(0, 255, 255, -1.0, 0.03, 0, 1.0, 1.0, 1.0, 1.0) 
	show_dhudmessage(0, "Online Admins: %d", admins())
}

admins()
{
	new num
	for(new id = 1; id <= get_maxplayers(); id++)
	{
		if(is_user_connected(id) && get_user_flags(id) & ADMIN_BAN)
			num++
	}
	return num

}
