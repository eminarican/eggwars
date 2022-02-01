package eminarican.eggwars;

import pocketmine.event.player.PlayerQuitEvent;
import pocketmine.event.player.PlayerJoinEvent;
import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.arena.Arena;
import pocketmine.plugin.PluginBase;
import pocketmine.event.Listener;

class Main extends PluginBase implements Listener {

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

    function onJoin(event: PlayerJoinEvent) {
        if (!this.arena.addMember(event.getPlayer())) {
            event.getPlayer().kick("EggWars arena is full!");
        }
    }

    function onQuit(event: PlayerQuitEvent) {
        this.arena.remMember(event.getPlayer());
    }
}
