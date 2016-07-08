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
} = React;

var RCTSFSafariViewControllerExport = {
  open: function(url, options={}) {
    SFSafariViewController.openURL(url, options);
  },
};

module.exports = RCTSFSafariViewControllerExport;
