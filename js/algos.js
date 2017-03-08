/**
In algos.js, write a function that takes an array of words or phrases and returns 
the longest word or phrase in the array. So if we gave your function the array of 
["long phrase","longest phrase","longer phrase"], it would return "longest phrase". 
This is a logical reasoning challenge, so try to reason through this based on what you 
already know, rather than Googling the fanciest solution or looking up built-in sorting 
unctions. Note that "some string".length will do what you expect in JS.

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

console.log(getLongest(["a", "b", "abc", "xyz"]));