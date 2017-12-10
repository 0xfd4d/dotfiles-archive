require('vis')

vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme custom')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set number')
	vis:command('set relativenumber')
	vis:command('set expandtab')
	vis:command('set tabwidth 4')
end)

