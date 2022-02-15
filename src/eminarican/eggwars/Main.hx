package eminarican.eggwars;

import pocketmine.form.MenuForm;
import pocketmine.event.player.PlayerQuitEvent;
import pocketmine.event.player.PlayerJoinEvent;
import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.arena.Arena;
import pocketmine.plugin.PluginBase;
import pocketmine.event.Listener;

class Main extends PluginBase implements Listener {

	private var arena: Arena;

	override function onEnable(): Void {
		this.getServer().getLogger().notice("Haxe eggwars plugin by eminarican!"); // ;d
		this.getServer().getPluginManager().registerEvents(this, this);
		this.arena = new Arena(2, [
			TeamColor.Yellow,
			TeamColor.Green,
			TeamColor.Blue,
			TeamColor.Red,
		]);
	}

	override function onDisable(): Void {}

	function onJoin(event: PlayerJoinEvent) {
		var player = event.getPlayer();
		if (!this.arena.addMember(player)) {
			event.getPlayer().kick("EggWars arena is full!");
		}

		var team = this.arena.findTeamByMember(player);
		var form = new MenuForm("EggWars Info", 'your team: ${team.getColorReadable()}', [], (player, selection) -> {});
		player.sendForm(form);
	}

	function onQuit(event: PlayerQuitEvent) {
		this.arena.remMember(event.getPlayer());
	}
}
