package cre.utils;

import cre.utils.Constants.NoteColors;

/**
 * This class handles actual setting of... settings.
 */
class LocalSettings extends DefaultSettings
{
	public function loadDefaults():DefaultSettings
	{
		var instance:DefaultSettings = new DefaultSettings();

		for (key in Reflect.fields(instance))
		{
			Reflect.setField(this, key, Reflect.field(instance, key));
		}
		return instance;
	}

	/**
	 * Sets a setting to a certain value if it exists.
	 * @param setting The setting to change
	 * @param value The value
	 */
	public function setSetting(setting:String, value:String):Void
	{
		if (Reflect.fields(this).contains(setting))
		{
			try
			{
				Reflect.setField(this, setting, value);
			}
			catch (e:Dynamic)
			{
				trace('SETTING $setting DOES NOT EXIST!');
			}
		}
	}
}

/**
 * This class holds all the default settings.
 */
class DefaultSettings
{
	/**
	 * Controls whether to use antialiasing for sprites.
	 */
	public static var globalAntialiasing:Bool = true;

	public static var perfectWindow:Int = 15;
	public static var sickWindow:Int = 45;
	public static var goodWindow:Int = 90;
	public static var badWindow:Int = 135;

	public static var noteColors:Array<NoteColors> = [
		Constants.noteColors_Left,
		Constants.noteColors_Down,
		Constants.noteColors_Up,
		Constants.noteColors_Right
	];

	public function new() {}
}
