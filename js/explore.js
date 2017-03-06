/**
For each letter in the word, 
take the letter 
add it to a new word at the last spot

OKAY IGNORE THAT there's no add at position that I can see.
Take the word
Find the length.
Repeat the following for each position (going backwards from the last letter)
Take the letter
Add it to the new string

return the new string
**/

function reverse(word) { 
	
	var backwardsWord = "";

	for (var i = word.length - 1; i >= 0; i--) {
		backwardsWord += word[i];
	}
	return backwardsWord;
}


console.log(reverse("Hello"));
console.log(reverse("World"));