class ColorsController < UIViewController 
  def initWithNibName(name, bundle:bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemSearch, tag:3)
    self
  end

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.title = "Flashlight"
    @label = UILabel.alloc.initWithFrame(CGRectZero) 
    @label.text = "Pick your flashlight color!"
    @label.sizeToFit
    @label.center =
      [self.view.frame.size.width / 2,
       self.view.frame.size.height / 2]
    @label.autoresizingMask =
      UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    self.view.addSubview(@label)

    %w(red blue green).each_with_index do |color_text, index|
      color = UIColor.send("#{color_text}Color")
      button_width = 80

      button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      button.setTitle(color_text, forState:UIControlStateNormal)
      button.setTitleColor(color, forState:UIControlStateNormal)
      button.sizeToFit
      button.frame = [
        [30 + index*(button_width + 10),
          @label.frame.origin.y + button.frame.size.height + 30],
        [80, button.frame.size.height]
      ]
      button.autoresizingMask =
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
      button.addTarget(self, action:"tap_#{color_text}", forControlEvents:UIControlEventTouchUpInside)
      self.view.addSubview(button)
    end
  end
  def tap_red
    controller = ColorDetailController.alloc.initWithColor(UIColor.redColor)
    self.navigationController.pushViewController(controller, animated:true)
  end

  def tap_blue
    controller = ColorDetailController.alloc.initWithColor(UIColor.blueColor)
    self.navigationController.pushViewController(controller, animated:true)
  end

  def tap_green
    controller = ColorDetailController.alloc.initWithColor(UIColor.greenColor)
    self.navigationController.pushViewController(controller, animated:true)
  end
end