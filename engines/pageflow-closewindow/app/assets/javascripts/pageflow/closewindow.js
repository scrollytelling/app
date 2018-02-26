pageflow.widgetTypes.register('closewindow', {
  enhance: function(element) {
    var homeUrl = element.find('a').prop('href');

    // Enable the widget if the visitor came from Home.
    if (document.referrer.indexOf(homeUrl) !== -1) {
      element.addClass('enabled');
    }
  }
})
