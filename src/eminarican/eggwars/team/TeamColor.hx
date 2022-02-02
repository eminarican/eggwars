package eminarican.eggwars.team;

import pocketmine.utils.TextFormat;
import php.TypedArray;

@:enum
abstract TeamColor(String) {
	var Yellow = TextFormat.GOLD;
	var Purple = TextFormat.DARK_PURPLE;
	var White = TextFormat.WHITE;
	var Green = TextFormat.GREEN;
	var Gray = TextFormat.GRAY;
	var Blue = TextFormat.AQUA;
	var Pink = TextFormat.LIGHT_PURPLE;
	var Red = TextFormat.RED;
	private static final colors: TypedArray<String, String> = [
		TextFormat.GOLD => "Yellow",
		TextFormat.DARK_PURPLE => "Purple",
		TextFormat.WHITE => "White",
		TextFormat.GREEN => "Green",
		TextFormat.GRAY => "Gray",
		TextFormat.AQUA => "Blue",
		TextFormat.LIGHT_PURPLE => "Pink",
		TextFormat.RED => "Red",
	];

	public static function toReadable(color: String): String {
		return colors.get(color);
	}
}
