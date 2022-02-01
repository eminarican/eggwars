package eminarican.eggwars.utils;

import haxe.ds.Option;

abstract class Transform {

    public static function nullableToOption<T>(nullable: T): Option<T> {
        return if (nullable != null) {
             Some(nullable);
        } else {
            None;
        }
    }
}
