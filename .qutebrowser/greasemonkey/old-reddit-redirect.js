// ==UserScript==
// @name         old-reddit-redirect
// @version      1.0
// @description  old reddit redirect
// @match        *://*.reddit.com/*
// @match        *://reddit.com/*
// @grant        none
// @run-at       document-start
// ==/UserScript==

(function () {
	'use strict';
	if (top.location.hostname !== "old.reddit.com") {
		top.location.hostname = "old.reddit.com";
	}
})();
