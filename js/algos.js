/**
Takes: array
Set up a longest var - unassinged
set up a longestLength var make it equal 0
For the number of items in an array, do this:
	Take the item corresponding to the loop number (human language: first item computer language: 0th item for the first run through the loop)
	Get the length. 
	IF the length is greater than the longestLength
		set the longestLength equal to the current length
		set longest to current index
RETURN: string - the item in the array at index longest
**/


//This only returns the FIRST longest phrase if there are more than one
//phrase of the longest length (e.g. ["a", "b", "abc", "xyz"] will only return "abc")
//I will consider fixing this if I have time. --SEE getALlLongest below
function getLongest(phrases){	
	var longest;
	var longestLength = 0;

	for(var phraseIndex in phrases){
		currentLength = phrases[phraseIndex].length;
		if (currentLength > longestLength) {
			longest = phraseIndex;
			longestLength = currentLength;
		}
	}
	return phrases[longest];
}

//This returns ALL longest word/phrases in the form of another array.
function getAllLongest(phrases){	
	var longests = [];
	var longestLength = 0;

	for(var phraseIndex in phrases){
		currentLength = phrases[phraseIndex].length;
		if (currentLength > longestLength) {
			longests = []
			longests.push(phrases[phraseIndex]);
			longestLength = currentLength;
		} else if (currentLength === longestLength) {
			longests.push(phrases[phraseIndex]);
		}
	}
	return longests;
}

/**
Take: two objects
Get the keys for all of object1. 
Iterate through all the keys
	IF object2 at the key has a value (is not undefined)
		if object2's value at key is the same as object1's value at key
		RETURN true
if the iteration finishes (return is not triggered)
RETURN false
**/

function checkPairMatch(object1, object2){
	var keys = Object.keys(object1);
	for(let key of keys){
		if (!(object2[key] == "undefined") && (object2[key] === object1[key])){
			return true;
		}
	}
	return false;
}

/**
Write a function that takes an integer for length, and builds and returns an array of 
strings of the given length. So if we ran your function with an argument of 3, we would 
get an array of 3 random words back (the words don't have to be actual sensical English 
words -- "nnnnfph" totally counts). The words should be of randomly varying length, with 
a minimum of 1 letter and a maximum of 10 letters. (This involves a new trick, generating 
a random number, that you'll have to look up, but the solution on how to do so is 
relatively straightforward.)

Takes: length (int)
create an alphabet var
create a words array
do the following the length number of times:
	create a new string var
	for a random number of times between 1 and 10
		add a random char from alphabet to the string var
	add the string var to the words array.

RETURN: the words array 
**/

function createStringArray(length){
	var alphabet = "abcdefghijklmnopqrstuvwxyz";
	var words = [];

	//Monkeys and keyboards my friends.
	for(var i = 0; i < length; i++){
		randomString = "";
		//console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		stringLength = Math.floor(Math.random() * 10) + 1;
		for(var j = 0; j < stringLength; j++){
			randomLetter = Math.floor(Math.random() * 26);
			randomString += alphabet[randomLetter];
			//console.log("++++++++++++++++" + randomString)
		}
		words.push(randomString);
	}

	return words;
}





//DRIVER CODE HERE: 

console.log(getLongest(["a", "b", "abc", "xyz"]));

var steve = {name: "Steven", age: 54}; 
var tamir = {name: "Tamir", 'age': 54};
console.log(checkPairMatch(steve, tamir));

var shark = {type: "shark", name: "ed", age: 2000}; 
var sandwich = {type: "sandwich", ingredients: 3};
console.log(checkPairMatch(shark, sandwich));

//console.log(createStringArray(90));

//Add driver code that does the following 10 times: generates an array, prints the 
//array, feeds the array to your "longest word" function, and prints the result

for (var i = 0; i < 10; i++){
	var words = createStringArray(i + 2);
	console.log(words);
	console.log(getLongest(words));
	console.log("ALL the longest words: " + getAllLongest(words))
}