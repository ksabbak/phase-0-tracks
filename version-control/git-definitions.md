# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful? 
	
	Version control is a way to keep the code clean and track changes as they're made. It's especially useful when working on a project with multiple people so you know who makes what changes where, and also when any issues that may crop up were introduced.

* What is a branch and why would you use one?
	
	Branches are copies of the files that allow people to make changes without editing the original or any other version. They get to stay on their branch and not interfere with any other changes or the original until they're done and then they can merge again. This is great for when different people/groups are working on different aspects of the project at their own pace in their own place.

* What is a commit? What makes a good commit message?
	
	A commit is like a "save". It takes all changes that were added and makes a snapshot you can return to. A good commit message is clear and descriptive. For example "Bug fix" is a bad commit message but "Stop crash when creating a second account" actually explains what the commit does and is therefore much better.

* What is a merge conflict?
	
	A merge conflict is when something was changed in (at least) two different ways. For example, if the original read "Mary had a little lamb" and someone on CatBranch changed it to "Mary had a little kitten" and someone on DogBranch changed it to "Mary had a little puppy", it would be fine when the first branch merges, but when the second branch merges, it would present that as a conflict. 