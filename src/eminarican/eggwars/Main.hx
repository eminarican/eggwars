package eminarican.eggwars;

import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.arena.Arena;
import pocketmine.plugin.PluginBase;

class Main extends PluginBase {

    private var arena: Arena;
    
    override function onEnable() {
        getServer().getLogger().notice("Haxe eggwars plugin by eminarican!");// ;d
        this.arena = new Arena(2, [
            TeamColor.Yellow,
            TeamColor.Green,
            TeamColor.Blue,
            TeamColor.Red,
        ]);
    }

    override function onDisable() {
    }
}
