
#define LOG_CLIENT
#define LOG_COMBAT
#define LOG_WORLD

#define LOG_FILE_CLIENT "log/client.log"
#define LOG_FILE_COMBAT "log/combat.log"
#define LOG_FILE_WORLD "log/world.log"

Log

	var tmp
		text
		File/directory

	New(text, flag=LOG_FILE_WORLD)
		if(flag != LOG_FILE_WORLD || flag != LOG_FILE_COMBAT || flag != LOG_FILE_CLIENT) return
		src.text = text
		src.directory = flag

		Write()
	
	proc
		Write()
			if(!directory) return
			directory << text + "\n"


proc
	Log(text, flag)
		var/Log/log(text, flag)