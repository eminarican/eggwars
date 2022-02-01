package eminarican.eggwars.team;

import pocketmine.utils.TextFormat;

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
}
