/*
chrome.extension.sendMessage({}, function(response) {
	var readyStateCheckInterval = setInterval(function() {
	if (document.readyState === "complete") {
		clearInterval(readyStateCheckInterval);

		// ----------------------------------------------------------
		// This part of the script triggers when page is done loading
		console.log("Hello. This message was sent from scripts/inject.js");
		// ----------------------------------------------------------
		
		//send something to background / extension using chrome.extension.sendMessage
		//different event different messages

	}
	}, 10);
});
*/
/*
$(document).click(function(e) { 
	// Check for left button
	console.log("something was clicked: i.js");
    if (e.button == 0) {
		chrome.extension.sendMessage({
			type: "clicked",
			class: "anything",
			url : window.location.href
		});
    }
});
*/

$('.question-hyperlink').click(function() {
	console.log("something was clicked: i.js"); 
	chrome.extension.sendMessage({
		type: "clicked",
		class: "question-link",
		url : window.location.href
		
	});

});

$('.comments-link').click(function() {
	console.log("User tried to comment!"); 
	chrome.extension.sendMessage({
		type: "clicked",
		class: "comment",
		url : window.location.href
		
	});

});

$('[class^=vote-up]').click(function() { 
	chrome.extension.sendMessage({
		type: "clicked",
		class: "vote-up",
		url : window.location.href
	});
});

$('[class^=vote-down]').click(function() { 
	chrome.extension.sendMessage({
		type: "clicked",
		class: "vote-down",
		url : window.location.href
	});
});

$('[class^=star').click(function() { 
	var tag=document.getElementsByClassName('post-taglist')[0];
	var tags=tag.getElementsByClassName('post-tag');
	var len=tags.length;
	var obj=[]
	for(var i =0; i<len;i++){
		obj.push(tags[i].innerHTML);
	}
	chrome.extension.sendMessage({
		type: "clicked",
		class: "favorite",
		url : window.location.href,
        anchor: obj
	});

});

$('[class^=short').click(function() { 
	chrome.extension.sendMessage({
		type: "clicked",
		class: "share",
		url : window.location.href
	});
});