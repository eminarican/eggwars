package eminarican.eggwars.utils;

import eminarican.eggwars.team.TeamColor;
import eminarican.eggwars.team.Team;
import pocketmine.utils.Transform;
import php.TypedArray;
import haxe.ds.Option;

abstract class Balancer {

	public static function getAvailable(teams: TypedArray<TeamColor, Team>): Option<Team> {
		var result: Null<Team> = null;
		teams.foreachKeyValue((color, team) -> {
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
