/**
 * @providesModule RCTSFSafariViewController
 * @flow
 */
'use strict';

var React = require('react-native');
var {
  NativeModules: {
    SFSafariViewController,
  },
  processColor,
} = React;

var RCTSFSafariViewControllerExport = {
  open: function(url, options={}) {
    var parsedOptions = {};

    if(options.tintColor)
      parsedOptions.tintColor = processColor(options.tintColor);

    SFSafariViewController.openURL(url, parsedOptions);
  },
};

module.exports = RCTSFSafariViewControllerExport;
