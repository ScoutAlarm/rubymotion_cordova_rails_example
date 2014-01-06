class MainViewController < CDVViewController

  def self.build
    @controller ||= alloc.initWithNibName(nil, bundle: nil)
  end

  def init
    super

    self.wwwFolderName = "www"
    self.startPage = "http://localhost:3000"

    self
  end

  def viewDidLoad
    super

    self.navigationItem.rightBarButtonItem = right_button
    self.navigationItem.leftBarButtonItem = left_button

  end

  def webViewDidFinishLoad(theWebView)
    super
  end


  def right_button
    menuBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Alert",
                                                            style: UIBarButtonItemStyleBordered,
                                                            target: self,
                                                            action: "call_javascript")
  end

  def left_button
    menuBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Refresh HTML",
                                                            style: UIBarButtonItemStyleBordered,
                                                            target: self,
                                                            action: "call_javascript_browser_refresh")
  end

  def call_javascript
    puts "Calling alert from javascript!"
    self.commandDelegate.evalJsHelper("alert('Call started in rubymotion!');")
  end

  def call_javascript_browser_refresh
    puts "refreshing html!"
    self.commandDelegate.evalJsHelper("location.reload();")
  end

end