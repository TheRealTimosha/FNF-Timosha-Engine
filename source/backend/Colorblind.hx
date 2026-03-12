package backend;
import flixel.FlxG;
import openfl.filters.ColorMatrixFilter;
import openfl.filters.BitmapFilter;

class Colorblind {
    public static var filters:Array<BitmapFilter> = []; // the filters the game has active
	public static var activeFilter:BitmapFilter = null; // the filter that's currently active
    public static var gameFilters:Map<String, {filter:BitmapFilter, ?onUpdate:Void->Void}> = [
		'Deuteranopia' => {
			var matrix:Array<Float> = [
				0.43, 0.72, -.15, 0, 0,
				0.34, 0.57, 0.09, 0, 0,
				-.02, 0.03,    1, 0, 0,
				0,    0,    0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Protanopia' => {
			var matrix:Array<Float> = [
				0.20, 0.99, -.19, 0, 0,
				0.16, 0.79, 0.04, 0, 0,
				0.01, -.01,    1, 0, 0,
				0,    0,    0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Tritanopia' => {
			var matrix:Array<Float> = [
				0.97, 0.11, -.08, 0, 0,
				0.02, 0.82, 0.16, 0, 0,
				0.06, 0.88, 0.18, 0, 0,
				0,    0,    0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Protanomaly' => {
			var matrix:Array<Float> = [
				0.817, 0.183, 0, 0, 0,
				0.333, 0.667, 0, 0, 0,
				0, 0.125, 0.875, 0, 0,
				0, 0, 0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Tritanomaly' => {
			var matrix:Array<Float> = [
				0.967, 0.033, 0, 0, 0,
				0, 0.733, 0.267, 0, 0,
				0, 0.183, 0.817, 0, 0,
				0, 0, 0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Virtual Boy' => {
			var matrix:Array<Float> = [
				0.9, 0, 0, 0, 1,
				0, 0, 0, 0, 0,
				0, 0, 0, 0, 0,
				0, 0, 0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Gameboy' => {
			var matrix:Array<Float> = [
				0, 0,   0, 0, 0,
				0, 1.5, 0, 0, 1,
				0, 0,   0, 0, 0,
				0, 0,   0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Downer' => {
			var matrix:Array<Float> = [
				0, 0,   0, 0, 0,
				0, 0,   0, 0, 0,
				0, 0, 1.5, 0, 1,
				0, 0,   0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Grayscale' => {
			var matrix:Array<Float> = [
				.3, .3, .3, 0, 1,
				.3, .3, .3, 0, 1,
				.3, .3, .3, 0, 1,
				0,  0,  0, 1, 0,
			];
			{filter: new ColorMatrixFilter(matrix)}
		},
		'Invert' => {
			var matrix:Array<Float> = [
				-1,  0,  0, 0, 255,
				0, -1,  0, 0, 255,
				0,  0, -1, 0, 255,
				0,  0,  0, 1, 1,
			];
			{filter: new ColorMatrixFilter(matrix)}
		}
	];
    public static function updateFilter() {
        filters = [];
        FlxG.game.setFilters(filters);
        if (ClientPrefs.data.colorblindMode != 'None' && gameFilters.get(ClientPrefs.data.colorblindMode) != null) {
            var realFilter = gameFilters.get(ClientPrefs.data.colorblindMode).filter;
            if (realFilter != null) filters.push(realFilter);
			activeFilter = realFilter;
        }
        FlxG.game.setFilters(filters);
    }
}