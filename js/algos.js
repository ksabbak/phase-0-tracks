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
//I will consider fixing this if I have time.
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

/**
In algos.js, write a function that takes two objects and checks to see if the objects 
share at least one key-value pair. (You'll keep adding to this file, so we suggest 
grouping functions at the top and testing at the bottom of the file.) 
If we called your function with {name: "Steven", age: 54} and {name: "Tamir", age: 54}, 
the function would return true, because at least one key-value pair matches between the 
two objects. If no pairs match (and keep in mind that the two objects may not even have 
any of the same keys), the function should return false. To make your life easier, 
don't worry about whether a property is a string ('age') or an identifier name (age). 
Those can be considered equivalent. Again, try to reason through the problem using the 
basics you've already learned, rather than looking up slick search functions that will 
do the job for you. We'd rather see you write code that you actually understand!

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

console.log(getLongest(["a", "b", "abc", "xyz"]));

var steve = {name: "Steven", age: 54}; 
var tamir = {name: "Tamir", 'age': 54};
console.log(checkPairMatch(steve, tamir));

var shark = {type: "shark", name: "ed", age: 2000}; 
var sandwich = {type: "sandwich", ingredients: 3};
console.log(checkPairMatch(shark, sandwich));