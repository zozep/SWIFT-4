
var Action = function() {};

Action.prototype = {
    
    
    
    //"tell iOS the JavaScript has finished preprocessing, and give this data dictionary to the extension." The data that is being sent has the keys "URL" and "title", with the values being the page URL and page title.
run: function(parameters) {
    parameters.completionFunction({"URL": document.URL, "title": document.title });
},
finalize: function(parameters) {
    var customJavaScript = parameters["customJavaScript"];
    eval(customJavaScript);
}
    
};

var ExtensionPreprocessingJS = new Action
