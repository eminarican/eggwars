package eminarican.eggwars.arena;

import eminarican.eggwars.utils.Balancer;
import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.utils.Arrays;
import eminarican.eggwars.team.Team;
import pocketmine.utils.Transform;
import pocketmine.player.Player;
import haxe.ds.Option;
import php.TypedArray;
import php.Exception;

class Arena {

	private var members: TypedArray<String, Player> = new TypedArray();
	private var teams: TypedArray<TeamColor, Team> = new TypedArray();

	private var limit = 0;

	public function new(perLimit: Int, teams: Array<TeamColor>) {
		for (color in teams) {
			this.addTeam(new Team(perLimit, color));
			this.limit += perLimit;
		}
	}

	public function getMember(name: String): Option<Player> {
		return Arrays.get(this.members, name);
	}

	public function addMember(player: Player): Bool {
		return Transform.optionToBoolWithAction(Balancer.getAvailable(this.teams), (team) -> {
			team.addMember(player);
		});
	}

	public function remMember(player: Player) {
		this.members.removeKey(player.getName());
		this.teams.foreachKeyValue((color, team) -> {
			team.remMember(player);
		});
	}

	public function findTeamByMember(player: Player): Team {
		var result = null;

		this.teams.foreachKeyValue((color, team) -> {
			if (team.hasMember(player)) {
				result = team;
			}
		});

		if (result == null) {
			throw new Exception('trying to get team of unregistered player');
		}

		return result;
	}

	public function getTeam(color: TeamColor): Option<Team> {
		return Arrays.get(this.teams, color);
	}

	public function hasTeam(team: Team): Bool {
		return hasTeamColor(team.getColor());
	}

	public function hasTeamColor(color: TeamColor): Bool {
		return Transform.optionToBool(this.getTeam(color));
	}

	public function addTeam(team: Team) {
		if (!this.hasTeam(team)) {
			this.teams.set(team.getColor(), team);
		} else {
			throw new Exception('Team ${team.getColorReadable()} already exists');
		}
	}
}
