console.log("Hello world!");

function changeBackgroundColor(element){
	colorNumber = Math.floor((Math.random() * 10));
	document.body.style.background = colors[colorNumber];
	//console.log(colorNumber);
}


var externalLinkWrapper = document.getElementById("external-links");
var unorderedList = externalLinkWrapper.getElementsByTagName("ul")[0];

console.log(unorderedList);

var listElement = document.createElement('li');
listElement.innerHTML = "This is new????"

unorderedList.appendChild(listElement);
//listElements.appendChild("This is new!");

colors = ["red", "orange", "yellow", 'green', 'blue', 'purple', 'pink', 'gray', 'white', 'cyan'];

document.addEventListener("click", changeBackgroundColor);