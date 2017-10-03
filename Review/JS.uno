using Fuse;
using Fuse.Scripting;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;

[UXGlobalModule]
public class ReviewModule : NativeModule
{
	static readonly ReviewModule _instance;
	public ReviewModule()
	{
		if (_instance != null) return;

		_instance = this;
		Resource.SetGlobalKey(_instance, "ReviewModule");
		AddMember(new NativeFunction("requestReview", (NativeCallback)requestReview));
	}

	static object requestReview(Context c, object[] args)
	{
		StartForeign.requestReview();
		return null;
	}
}

[ForeignInclude(Language.ObjC, "@(Project.Name)-Swift.h")]
class StartForeign
{
	// Simulator
	public static extern(!mobile) void requestReview()
	{
		debug_log("Not Implemented for simulator");
	}

	// Android
	[Foreign(Language.Java)]
	public static extern(Android) void requestReview()
	@{
		android.util.Log.d("Not Implemented for Android");
	@}

	// iOS
	[Foreign(Language.ObjC)]
	public static extern(iOS) void requestReview()
	@{
		Review* x = [[Review alloc] init];
        [x requestReview];
	@}
}
