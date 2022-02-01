package eminarican.eggwars.arena;

import eminarican.eggwars.utils.Transform;
import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.team.Team;
import pocketmine.player.Player;
import haxe.ds.Option;
import php.TypedArray;
import php.Exception;

class Arena {
    
    private var players: TypedArray<String, Player> = new TypedArray();
    private var teams: TypedArray<TeamColor, Team> = new TypedArray();

    private var limit = 0;

    public function new(perLimit: Int, teams: Array<TeamColor>) {
        for (color in teams) {
            this.addTeam(new Team(perLimit, color));
            this.limit += perLimit;
        }
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
            throw new Exception('Team ${team.getColorName()} already exists');
        }
    }
}
