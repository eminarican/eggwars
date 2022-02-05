package eminarican.eggwars.utils;

import haxe.ds.Option;
import php.TypedArray;

abstract class Arrays {
    
    public static function get<I, V>(array: TypedArray<I, V>, index: I): Option<V>  {
        if (array.hasKey(index)) {
            return Some(array.get(index));
        }
        return None;
    }
}
