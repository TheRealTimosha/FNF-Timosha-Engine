package options;

class OptimizationSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Optimization';
		rpcTitle = 'Optimization Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Light Opponent Strums',
			"If this is unchecked, the Opponent strums won't light up when the Opponent hits a note.",
			'opponentLightStrum',
			BOOL);
		addOption(option);

		var option:Option = new Option('Light Player Strums',
		    "If this is unchecked, then uh.. the player strums won't light up.\nit's as simple as that.",
		    'playerLightStrum',
			BOOL);
	    addOption(option);

		var option:Option = new Option('Show Ratings',
			"If unchecked, the game will not show a rating sprite when hitting a note.",
			'ratingPopups',
            BOOL);
		addOption(option);

		var option:Option = new Option('Show Combo Numbers',
			"If unchecked, the game will not show combo numbers when hitting a note.",
			'comboNumPopups',
            BOOL);
		addOption(option);

		var option:Option = new Option('Show Combo',
			"If unchecked, the game will not show combo sprite when hitting a note.",
			'comboPopups',
            BOOL);
		addOption(option);

		var option:Option = new Option('Show MS Popup',
		    "If checked, hitting a note will also show how late/early you hit it.",
		    'showMS',
			BOOL); 
	    addOption(option);

		var option:Option = new Option('Even LESS Botplay Lag',
			"Reduce Botplay lag even further.",
			'lessBotLag',
			BOOL); 
		addOption(option);
		
		super();
	}
}