package eminarican.eggwars.utils;

import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.team.Team;
import php.TypedArray;
import haxe.ds.Option;

class Balancer {

    private var teams: TypedArray<TeamColor, Team>;

    public function new(teams: TypedArray<TeamColor, Team>) {
        this.teams = teams;
    }

    public function getAvailable(): Option<Team> {
        var result: Null<Team> = null;
        this.teams.foreachKeyValue((color, team) -> {
            if (result == null || team.getMemberCount() < result.getMemberCount()) {
                result == team;
            }
        });
        if (result != null && !result.hasSpace()) {
            result = null;
        }
        return Transform.nullableToOption(result);
    }
}
