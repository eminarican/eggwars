package eminarican.eggwars.arena;

import eminarican.eggwars.utils.Balancer;
import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.team.Team;
import pocketmine.utils.Transform;
import pocketmine.player.Player;
import haxe.ds.Option;
import php.TypedArray;
import php.Exception;

class Arena {

	private var members: TypedArray<String, Player> = new TypedArray();
	private var teams: TypedArray<TeamColor, Team> = new TypedArray();

	private var balancer: Balancer;

	private var limit = 0;

	public function new(perLimit: Int, teams: Array<TeamColor>) {
		this.balancer = new Balancer(this.teams);

		for (color in teams) {
			this.addTeam(new Team(perLimit, color));
			this.limit += perLimit;
		}
	}

	public function getMember(name: String): Option<Player> {
		return Transform.nullableToOption(this.members.get(name));
	}

	public function addMember(player: Player): Bool {
		return Transform.optionToBoolWithAction(this.balancer.getAvailable(), (team) -> {
			team.addMember(player);
		});
	}

	public function remMember(player: Player) {
		this.members.removeKey(player.getName());
		this.teams.foreachKeyValue((color, team) -> {
			team.remMember(player);
		});
	}

	public function getTeam(color: TeamColor): Option<Team> {
		return Transform.nullableToOption(teams.get(color));
	}

	public function hasTeam(team: Team): Bool {
		return hasTeamColor(team.getColor());
	}

	public function hasTeamColor(color: TeamColor): Bool {
		return Transform.optionToBool(this.getTeam(color));
	}

	public function addTeam(team: Team) {
		if (this.hasTeam(team)) {
			this.teams.set(team.getColor(), team);
		} else {
			throw new Exception('Team ${team.getColorReadable()} already exists');
		}
	}
}
