_What are some common HTTP status codes?_

	* 200 OK
	* 300 Multiple Choices
	* 301 Moved Permanently
	* 302 Found
	* 304 Not Modified
	* 307 Temporary Redirect
	* 400 Bad Request
	* 401 Unauthorized
	* 403 Forbidden
	* 404 Not Found
	* 410 Gone
	* 500 Internal Server Error
	* 501 Not Implemented
	* 503 Service Unavailable
	* 550 Permission denied

_What is the difference between a GET request and a POST request? When might each be used?_

	* GET is when information is sent to the server via the URL, whereas POST is sent in the body. Both can be used for things like forms, but the form must encode all the data into the URL. POST is generally more secure, better for larger data (especially if including non-text info like images, etc). GET is great for short, simple, non-sensitive info. I imagine it's best used for pages where you allow the user to set parameters on the data or even very simple surveys. 

_Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?_

	* Cookies are a way for websites to store basic info on the computer of the users. The users have these files that identify them or keep bits of information around for a better (or sometimes creepier) web experience.