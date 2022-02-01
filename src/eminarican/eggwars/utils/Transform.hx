package eminarican.eggwars.utils;

import pocketmine.utils.TextFormat;
import haxe.ds.Option;
import php.TypedArray;

abstract class Transform {

    private static final colors: TypedArray<String, String> = [
        TextFormat.GOLD => "Yellow",
        TextFormat.DARK_PURPLE => "Purple",
        TextFormat.WHITE => "White",
        TextFormat.GREEN => "Green",
        TextFormat.GRAY => "Gray",
        TextFormat.AQUA => "Blue",
        TextFormat.LIGHT_PURPLE => "Pink",
        TextFormat.RED => "Red",
    ];

    public static function teamColorToString(color: String): String {
        return colors.get(color);
    }

    public static function nullableToOption<T>(nullable: T): Option<T> {
        return if (nullable != null) {
             Some(nullable);
        } else {
            None;
        }
    }

    public static function optionToBool<T>(option: Option<T>): Bool {
        return switch option {
            case Some(v):
                return true;
            case None:
                return false;
        }
    }
}
