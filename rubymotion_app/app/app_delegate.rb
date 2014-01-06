class AppDelegate

  def init
    cookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage
    cookieStorage.cookieAcceptPolicy = NSHTTPCookieAcceptPolicyAlways

    CDVURLProtocol.registerURLProtocol

    super
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    screenBounds = UIScreen.mainScreen.bounds
    @window = UIWindow.alloc.initWithFrame(screenBounds)
    @window.autoresizesSubviews = true

    @navigationController = UINavigationController.alloc.initWithRootViewController(MainViewController.new)

    @window.rootViewController = @navigationController
    @window.makeKeyAndVisible
    true

  end

end