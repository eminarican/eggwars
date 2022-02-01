package eminarican.eggwars.arena;

import eminarican.eggwars.utils.Transform;
import pocketmine.player.Player;
import haxe.ds.Option;
import php.TypedArray;

class Team {

    private final limit: Int;
    private final color: TeamColor;

    private var count: Int = 0;
    private var alive: Bool = true;
    
    private var players: TypedArray<String, Player> = new TypedArray();

	public function new(limit: Int, color: TeamColor) {
        this.limit = limit;
		this.color = color;
	}

    public function getColor(): TeamColor {
        return this.color;
    }

    public function getPlayer(name: String): Option<Player> {
        return Transform.nullableToOption(this.players.get(name));
    }

    public function addPlayer(player: Player) {
    }

    public function remPlayer(name: String): Bool {
        return true;
    }
}
