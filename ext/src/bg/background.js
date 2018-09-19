// if you checked "fancy-settings" in extensionizr.com, uncomment this lines

// var settings = new Store("settings", {
//     "sample_setting": "This is how you use Store.js to remember values"
// });


//example of using a message handler from the inject scripts
chrome.extension.onMessage.addListener(
  function(request, sender, sendResponse) {
  	//chrome.pageAction.show(sender.tab.id);
    //sendResponse();
    console.log("Click received in b.js: "+request.class);
    onClickListener(request);
    /*
    switch(request.type) {
      case "clicked":
        onClickListener(request);
      break;
    }
    */
    return true;
  });

  var onClickListener = function(request) {
    console.log("request in function");
    var username = 'dummy';
    chrome.cookies.get( { url: 'http://localhost:3000/', name: 'userId' },
      function (cookie) {
      if (cookie) {
          console.log(cookie);
          userId = cookie.value;
          var timestamp = new Date();
          var eventHistoryDomain = {
            "userDomain": {
              "userId": userId
            },
            "eventDomain": {
              "name": request.class
            },
            "description":request.url
          }
      
          axios.post('http://127.0.0.1:9090/aw/addEventHistory', eventHistoryDomain);
        }
      else {
        console.log('Cookie not found');
      }
    });
  };