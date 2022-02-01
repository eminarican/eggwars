package eminarican.eggwars.team;

import eminarican.eggwars.utils.Transform;
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
        return Transform.teamColorToString('${this.getColor()}');
    }

    public function hasSpace(): Bool {
        return this.limit > this.count;
    }

    public function getMemberCount() {
        return this.count;
    }

    public function getMember(name: String): Option<Player> {
        return Transform.nullableToOption(this.members.get(name));
    }

    public function hasMember(player: Player) {
        return Transform.nullableToBool(this.members.get(player.getName()));
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
