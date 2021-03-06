package eminarican.eggwars.team;

import eminarican.eggwars.utils.Arrays;
import pocketmine.utils.Transform;
import pocketmine.player.Player;
import haxe.ds.Option;
import php.TypedArray;

class Team {

	private final limit: Int;
	private final color: TeamColor;

	private var count: Int = 0;
	private var alive: Bool = true;

	private var members: TypedArray<String, Player> = new TypedArray();

	public function new(limit: Int, color: TeamColor) {
		this.limit = limit;
		this.color = color;
	}

	public function getColor(): TeamColor {
		return this.color;
	}

	public function getColorReadable(): String {
		return TeamColor.toReadable('${this.getColor()}');
	}

	public function hasSpace(): Bool {
		return this.limit > this.count;
	}

	public function getMemberCount(): Int {
		return this.count;
	}

	public function getMember(name: String): Option<Player> {
		return Arrays.get(this.members, name);
	}

	public function hasMember(player: Player): Bool {
		return Transform.nullableToBool(this.getMember(player.getName()));
	}

	public function addMember(player: Player) {
		this.members.set(player.getName(), player);
	}

	public function remMember(player: Player) {
		this.remMemberByName(player.getName());
	}

	public function remMemberByName(name: String) {
		this.members.removeKey(name);
	}
}
